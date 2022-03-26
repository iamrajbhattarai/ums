# Create your views here.
import os
import uuid

from django.conf import settings
from django.contrib import auth, messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.hashers import make_password
from django.core.mail import send_mail
from django.db.models import Q
from django.shortcuts import redirect, render
from rest_framework import status, viewsets
from rest_framework.authtoken.models import Token
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView

from .models import User
from .serializers import *


class UsersViewsSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    http_method_names = ['get', 'post', 'patch']

    def create(self, request, *args, **kwargs):
        print(request.data)
        errors = []
        request.data._mutable = True
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            email = serializer.validated_data.get('email')
            user = User.objects.get(email=email)
            user.save()
            try:
                uuid_code1 = uuid.uuid4()
                uuid_code2 = uuid.uuid4()
                uuid_code = str(uuid_code1) + str(uuid_code2)
                password1 = request.data['password1']
                password2 = request.data['password2']
                if password1 != password2:
                    return Response(status=status.HTTP_406_NOT_ACCEPTABLE, data={'message': 'Passwords do not match!'})
                created_object = serializer.save(
                    email_verification_token=uuid_code)
                created_object.set_password(password1)
                created_object.save()
                '''send email for verification'''
                subject = "User Verification"
                message = f'Click in the link to activate your account. ' + \
                    os.environ.get("ACTIVATE_URL")+'/?token='+uuid_code
                email_from = settings.EMAIL_HOST_USER
                email_to = [created_object.email]
                send_mail(subject, message, email_from, email_to)
                return Response(status=200, data={'message': 'User Successfully Registered. To activate your account, click in the link sent to your email.'})
            except Exception as e:
                User.objects.get(username=request.data['username']).delete()
                errors.append({"error": str(e)})
                return Response(status=status.HTTP_400_BAD_REQUEST, data={"message": "User Not Registered", "Error": errors})
        else:
            for er in serializer._errors:
                errors.append(
                    {"errorName": er, "details": serializer._errors[er][0]})
            return Response(status=status.HTTP_400_BAD_REQUEST, data={'message': 'Error Occured', 'Error': errors})

    # def partial_update(self, request, pk=None):
    #     user = User.objects.get(pk=pk)
    #     if isinstance(request.data.get('image'), str):
    #         request.data._mutable = True
    #         request.data.pop('image', None)
    #     serializer = UserSerializer(user, data=request.data, partial=True)
    #     if serializer.is_valid():
    #         serializer.save()
    #         serializer = UserSerializer(user, context={'request': request})
    #         return Response(serializer.data, status=status.HTTP_201_CREATED)
    #     return Response(serializer.errors, status=status.HTTP_403_FORBIDDEN)


def forgotPassword(request):
    return render(request, 'user/forgot-password.html', {})


class ResetPasswordEmailConfirmationView(APIView):
    def post(self, request, *args, **kwargs):
        try:
            username_or_email = request.data.get(
                'username_or_email')
            print(username_or_email)
            if User.objects.filter(Q(username=username_or_email) | Q(email=username_or_email)).exists():
                profile = User.objects.filter(
                    Q(username=username_or_email) | Q(email=username_or_email))
                if profile[0].email == username_or_email or profile[0].username == username_or_email:
                    uuid_code1 = uuid.uuid4()
                    uuid_code2 = uuid.uuid4()
                    uuid_code = str(uuid_code1)+str(uuid_code2)
                    user = profile[0]
                    print(user, 'user')
                    user.email_verification_token = uuid_code
                    user.save()
                    subject = "Reset Password Verification"
                    message = f'Click in the link to reset your password. ' + \
                        os.environ.get('RESET_PASSWORD_URL') + \
                        '/?token='+uuid_code
                    email_from = settings.EMAIL_HOST_USER
                    email_to = [user.email]
                    print(email_to, "email is here")
                    send_mail(subject, message, email_from, email_to)
                    messages.success(
                        request, 'A reset password link is sent to your email. Please check it.')
                    return redirect('/user/forgot-password/')
                    # return Response(status=status.HTTP_200_OK, data={"message": "A reset password link is sent to your email. Please check it."})
            messages.error(
                request, 'Please input correct username or email and try again!')
            return redirect('/user/forgot-password/')
            # return Response(status=status.HTTP_400_BAD_REQUEST, data={"message": "Incorrect Email or no email found!"})
        except Exception as e:
            return Response(status=status.HTTP_400_BAD_REQUEST, data={"message": "Error!", "Details": str(e)})


def resetPassword(request):
    # defined global so as to retrieve user id from get request to post request
    global email_verification_token
    if request.method == "POST":
        if User.objects.filter(email_verification_token=email_verification_token).exists():
            user = User.objects.get(
                email_verification_token=email_verification_token)
        else:
            messages.error(
                request, "Your account is not registered. Try again for registered account!")
            return redirect('/user/reset-password')
        password1 = request.POST['resetpassword1']
        password2 = request.POST['resetpassword2']
        if password1 == password2:
            user.set_password(password1)
            user.save()
            messages.success(
                request, 'Your password has been reset successfully!')
            return redirect('/user/reset-password')
        else:
            messages.error(request, "Passwords do not match!")
            return redirect('/user/reset-password')

    else:
        email_verification_token = request.GET.get('token', None)
        return render(request, 'user/reset-password.html', {})


def changePassword(request):
    if request.method == "POST":
        if request.user.is_authenticated:
            old_password = request.POST["oldpassword"]
            new_password1 = request.POST["changepassword1"]
            new_password2 = request.POST["changepassword2"]
            '''validating old password'''
            user = request.user
            check_old_password = user.check_password(old_password)
            if check_old_password:
                if new_password1 == new_password2:
                    user.set_password(new_password1)
                    user.save()
                    messages.success(
                        request, "Your have successfully changed your password!")
                    return redirect('/user/change-password')
                else:
                    messages.error(request, "Passwords don't match!")
                    return redirect('/user/change-password')
            else:
                messages.error(
                    request, "Please entry your old password correctly!")
                return redirect('/user/change-password')
        else:
            messages.error(request, "Your are not logged in!")
            return redirect('/user/change-password')
    else:
        return render(request, 'user/change-password.html', {})


class ActivateView(APIView):
    # queryset = User.objects.none()
    # should have been a post request. However why extra fuss when you can achieve with less.
    def get(self, request, *args, **kwargs):
        try:
            email_verification_token = self.request.query_params.get('token')
            if User.objects.filter(email_verification_token=email_verification_token).exists():
                profile = User.objects.filter(
                    email_verification_token=email_verification_token)
                user = profile[0]
                user.is_active = True
                # user.is_staff = True
                user.save()
                # create token also for the created user.
                Token.objects.create(user=user)
                return redirect('/user/login')
            return Response(status=status.HTTP_400_BAD_REQUEST, data={"message": "Invalid token!"})
        except Exception as e:
            return Response(status=status.HTTP_400_BAD_REQUEST, data={"message": "Error!", "Details": str(e)})


def signIn(request):
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)

            # print(token)
            # return render(request, 'utilities/map.html', {'token': token})
            return redirect('/map')

        else:
            messages.error(request, "Invalid username or password!")
            # return render(request, 'utilities/login.html', {})
            return redirect('/user/login')
    else:
        return render(request, 'user/login.html', {})


def signOut(request):
    logout(request)
    return render(request, 'user/login.html', {})


def signUp(request):
    return render(request, 'user/signup.html', {})
