from django.urls import include, path
from rest_framework import serializers
from rest_framework_gis.serializers import GeoFeatureModelSerializer

from .models import Boundary, Building


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
