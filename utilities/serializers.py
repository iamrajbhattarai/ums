from django.urls import include, path
from rest_framework import serializers
from rest_framework_gis.serializers import GeoFeatureModelSerializer

from .models import *


class BuildingSerializer(GeoFeatureModelSerializer):

    class Meta:
        model = Building
        geo_field = 'geom'
        fields = '__all__'


class BoundarySerializer(GeoFeatureModelSerializer):

    class Meta:
        model = Boundary
        geo_field = 'geom'
        fields = '__all__'


class RoadSerializer(GeoFeatureModelSerializer):

    class Meta:
        model = Road
        geo_field = 'geom'
        fields = '__all__'


class GroundSerializer(GeoFeatureModelSerializer):

    class Meta:
        model = Ground
        geo_field = 'geom'
        fields = '__all__'


class FountainSerializer(GeoFeatureModelSerializer):

    class Meta:
        model = Fountain
        geo_field = 'geom'
        fields = '__all__'
