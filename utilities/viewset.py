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

from .models import *
from .serializers import *


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


class BuildingViewSet(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated]
    queryset = Building.objects.all()
    serializer_class = BuildingSerializer
    http_method_names = ['get']


class BoundaryViewset(viewsets.ModelViewSet):
    # permission_classes = [IsAuthenticated]
    queryset = Boundary.objects.all()
    serializer_class = BoundarySerializer
    http_method_names = ['get']


class RoadViewset(viewsets.ModelViewSet):
    # permission_classes = [IsAuthenticated]
    queryset = Road.objects.all()
    serializer_class = RoadSerializer
    http_method_names = ['get']


class GroundViewset(viewsets.ModelViewSet):
    # permission_classes = [IsAuthenticated]
    queryset = Ground.objects.all()
    serializer_class = GroundSerializer
    http_method_names = ['get']


class FountainViewset(viewsets.ModelViewSet):
    # permission_classes = [IsAuthenticated]
    queryset = Fountain.objects.all()
    serializer_class = FountainSerializer
    http_method_names = ['get']


class SepticTankViewset(viewsets.ModelViewSet):
    # permission_classes = [IsAuthenticated]
    queryset = SepticTank.objects.all()
    serializer_class = SepticTankSerializer
    http_method_names = ['get']


class WaterBodyViewset(viewsets.ModelViewSet):
    # permission_classes = [IsAuthenticated]
    queryset = WaterBody.objects.all()
    serializer_class = WaterBodySerializer
    http_method_names = ['get']


class DrainageViewset(viewsets.ModelViewSet):
    # permission_classes = [IsAuthenticated]
    queryset = Drainage.objects.all()
    serializer_class = DrainageSerializer
    http_method_names = ['get']


class SewerlineViewset(viewsets.ModelViewSet):
    # permission_classes = [IsAuthenticated]
    queryset = Sewerline.objects.all()
    serializer_class = SewerlineSerializer
    http_method_names = ['get']


class TransmissionLineViewset(viewsets.ModelViewSet):
    # permission_classes = [IsAuthenticated]
    queryset = TransmissionLine.objects.all()
    serializer_class = TransmissionLineSerializer
    http_method_names = ['get']


class StreetLampViewset(viewsets.ModelViewSet):
    # permission_classes = [IsAuthenticated]
    queryset = StreetLamp.objects.all()
    serializer_class = StreetLampSerializer
    http_method_names = ['get']


class ElectricPoleViewset(viewsets.ModelViewSet):
    # permission_classes = [IsAuthenticated]
    queryset = ElectricPole.objects.all()
    serializer_class = ElectricPoleSerializer
    http_method_names = ['get']
