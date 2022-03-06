from django.contrib import auth, messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.core.serializers import serialize
from django.http.response import HttpResponse
from django.shortcuts import redirect, render
from django.urls import include, path
from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response

from .models import Buildings
from .serializers import BuildingsSerializer


# Create your views here.
def home(request):
    return render(request, 'utilities/home.html', {})


def webmap(request):
    return render(request, 'utilities/map.html', {})


def signIn(request):
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            messages.success(request, 'You are sucessfully login !')
            return redirect('/map/')

        else:
            messages.error(request, "Invalid username or password !")
            return redirect('/login/')
    else:
        return render(request, 'utilities/login.html', {})


def signOut(request):
    logout(request)
    return render(request, 'utilities/login.html', {})


class BuildingsViewSet(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated]
    queryset = Buildings.objects.all()
    serializer_class = BuildingsSerializer
    http_method_names = ['get']
