from django.urls import include, path
from rest_framework import serializers
from rest_framework_gis.serializers import GeoFeatureModelSerializer

from .models import Building


class BuildingSerializer(GeoFeatureModelSerializer):

    class Meta:
        model = Building
        geo_field = 'geom'
        fields = '__all__'
