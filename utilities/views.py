from django.core.serializers import serialize
from django.http.response import HttpResponse
from django.shortcuts import render
from django.urls import include, path
from rest_framework import viewsets
from rest_framework.response import Response

from .models import Buildings
from .serializers import BuildingsSerializer


# Create your views here.
def home(request):
    return render(request, 'utilities/home.html', {})


def webmap(request):
    return render(request, 'utilities/map.html', {})


class BuildingsViewSet(viewsets.ModelViewSet):
    queryset = Buildings.objects.all()
    serializer_class = BuildingsSerializer
    http_method_names = ['get', 'post']
