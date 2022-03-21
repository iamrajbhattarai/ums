# Create your views here.
import os
import uuid

from django.conf import settings
from django.contrib import auth, messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.hashers import make_password
from django.contrib.auth.models import Group
from django.core.files.uploadedfile import SimpleUploadedFile
from django.core.mail import send_mail
from django.db.models import Q
from django.http import JsonResponse
from django.shortcuts import redirect, render
from django.views.decorators.csrf import ensure_csrf_cookie
from rest_framework import status, viewsets
from rest_framework.authentication import (BasicAuthentication,
                                           TokenAuthentication)
from rest_framework.authtoken.models import Token
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.generics import GenericAPIView
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
        errors = []
        request.data._mutable = True
        serializer = UserSerializer(data=request.data)
        print('I am at first!')

        if serializer.is_valid():
            serializer.save()
            print('I am here!')
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

    # def list(self, request, *args, **kwargs):
    #     try:
    #         if not request.user.is_authenticated:
    #             return Response(status=status.HTTP_403_FORBIDDEN, data={"message": "You are not logged in."})
    #         group_id = request.user.group.id
    #         wards_list = []
    #         for ward in request.user.wards.all():
    #             wards_list.append(ward.id)
    #         if User.objects.filter(group=group_id).exists():
    #             if group_id == int(os.environ.get('SUPER_ADMIN')):
    #                 user_qs = User.objects.all()
    #             elif group_id == int(os.environ.get('MUNICIPAL_EDITOR')):
    #                 user_qs = User.objects.filter(Q(group=group_id) | Q(group=int(
    #                     os.environ.get('WARD_EDITOR'))) | Q(group=int(os.environ.get('VIEWER'))))
    #             elif group_id == int(os.environ.get('WARD_EDITOR')):
    #                 user_qs = User.objects.filter(((Q(wards__in=wards_list) & Q(
    #                     group=group_id)) | Q(group=int(os.environ.get('VIEWER'))))).distinct()
    #                 print(user_qs)
    #             else:
    #                 user_qs = User.objects.filter(group=group_id)
    #         user_list = []
    #         if user_qs:
    #             user_qs = user_qs.values(
    #                 'id', 'image', 'full_name', 'designation', 'contact', 'email', 'last_login', 'is_active')
    #             for q in user_qs:
    #                 user_details = {}
    #                 user_details['id'] = q['id']
    #                 user_details['image'] = str(
    #                     os.environ.get('BACKEND_DOMAIN'))+q['image']
    #                 user_details['full_name'] = q['full_name']
    #                 user_details['designation'] = q['designation']
    #                 user_details['contact'] = q['contact']
    #                 user_details['email'] = q['email']
    #                 user_details['last_login'] = q['last_login']
    #                 user_details['active_status'] = q['is_active']
    #                 user_list.append(user_details)
    #             return Response(user_list, status=status.HTTP_200_OK)
    #         else:
    #             return Response(status=status.HTTP_400_BAD_REQUEST, data={'message': 'There are no any users in your group.'})
    #     except Exception as e:
    #         return Response(status=status.HTTP_400_BAD_REQUEST, data={'message': str(e)})


def forgotPassword(request):
    return render(request, 'user/forgot-password.html', {})


class ResetPasswordEmailConfirmationView(APIView):
    def post(self, request, *args, **kwargs):
        try:
            username_or_email = self.request.query_params.get(
                'username_or_email')
            print(username_or_email, 'i am here')
            if User.objects.filter(Q(username=username_or_email) | Q(email=username_or_email)).exists():
                profile = User.objects.filter(
                    Q(username=username_or_email) | Q(email=username_or_email))
                if profile[0].email == username_or_email or profile[0].username == username_or_email:
                    uuid_code1 = uuid.uuid4()
                    uuid_code2 = uuid.uuid4()
                    uuid_code = str(uuid_code1)+str(uuid_code2)
                    # new_password = str(uuid.uuid4())
                    user = profile[0]
                    print(user, 'user')
                    user.email_verification_token = uuid_code
                    # user.set_password(new_password)
                    # user.is_email_verified = False
                    # user.is_password_changed = False
                    user.save()
                    subject = "Reset Password Verification"
                    message = f'Click in the link to reset your password. ' + \
                        os.environ.get('FORGOT_PASSWORD_URL') + \
                        '/?token='+uuid_code
                    email_from = settings.EMAIL_HOST_USER
                    email_to = [user.email]
                    print(email_to, "email is here")
                    send_mail(subject, message, email_from, email_to)
                    messages.success(
                        request, 'A reset password link is sent to your email. Please check it.')
                    return redirect('/user/login')
                    # return Response(status=status.HTTP_200_OK, data={"message": "A reset password link is sent to your email. Please check it."})
            messages.error(
                request, 'Please input correct username or email and try again!')
            return redirect('/user/login')
            # return Response(status=status.HTTP_400_BAD_REQUEST, data={"message": "Incorrect Email or no email found!"})
        except Exception as e:
            return Response(status=status.HTTP_400_BAD_REQUEST, data={"message": "Error!", "Details": str(e)})


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
                Token.objects.create(user=user)
                # create token also for the created user.
                return redirect('/user/login')
            return Response(status=status.HTTP_400_BAD_REQUEST, data={"message": "Invalid token!"})
        except Exception as e:
            return Response(status=status.HTTP_400_BAD_REQUEST, data={"message": "Error!", "Details": str(e)})


class ResetPasswordView(APIView):
    def post(self, request, *args, **kwargs):
        try:
            email_verification_token = self.request.query_params.get('token')
            password1 = request.data.get("new_password1")
            password2 = request.data.get("new_password2")
            if password1 == password2:
                if User.objects.filter(email_verification_token=email_verification_token).exists():
                    profile = User.objects.filter(
                        email_verification_token=email_verification_token)
                    user = profile[0]
                    user.set_password(password1)
                    # user.email_verification_token = ''  # change
                    user.is_active = True
                    # user.is_staff = True
                    user.save()
                    return Response(status=status.HTTP_200_OK, data={"message": "Password reset successful. Please Login!"})
                return Response(status=status.HTTP_400_BAD_REQUEST, data={"message": "Invalid token!"})
            return Response(status=status.HTTP_400_BAD_REQUEST, data={"message": "New Passwords did not match!"})
        except Exception as e:
            return Response(status=status.HTTP_400_BAD_REQUEST, data={"message": "Error!", "Details": str(e)})


class ChangePasswordView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request, *args, **kwargs):
        old_password = request.data["old_password"]
        new_password1 = request.data["new_password1"]
        new_password2 = request.data["new_password2"]
        '''validating old password'''
        user = User.objects.get(id=request.user.id)
        check_old_password = user.check_password(old_password)
        if check_old_password:
            if new_password1 == new_password2:
                user.set_password(new_password1)
                # user.is_password_changed = True
                user.save()
                return Response({'message': 'Password Change Succesful!'})
            else:
                return Response({"message": "New passwords don't match!"})
        else:
            return Response({"message": "Your old password is wrong!"})


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
