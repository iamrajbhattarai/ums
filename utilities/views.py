from django.http.response import HttpResponse
from django.shortcuts import render
from django.core.serializers import serialize
from rest_framework.response import Response
from django.urls import path, include
from rest_framework import viewsets
from .models import Buildings
from .serializers import BuildingsSerializer

# Create your views here.
def home(request):
    return render(request, 'utilities/home.html', {})

def webmap(request):
    return render(request, 'utilities/map.html', {})

def buildings(request):
    buildingsData = serialize('geojson', Buildings.objects.all(),geometry_field='geom')
    return HttpResponse(buildingsData, content_type='geojson')

# class BuildingsViewSet(viewsets.ModelViewSet):
#     queryset = Buildings.objects.all()
#     serializer_class = BuildingsSerializerss