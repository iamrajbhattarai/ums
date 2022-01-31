from django.urls import include, path
from rest_framework import serializers
from rest_framework_gis.serializers import GeoFeatureModelSerializer

from .models import Buildings


class BuildingsSerializer(GeoFeatureModelSerializer):

    class Meta:
        model = Buildings
        geo_field = 'geom'
        fields = '__all__'
