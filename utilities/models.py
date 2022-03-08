# from django.db import models
from django.contrib.gis.db import models


# Create your models here.
class Boundary(models.Model):
    area = models.FloatField()
    name = models.CharField(max_length=50)
    geom = models.MultiPolygonField(srid=4326)


class Building(models.Model):
    block = models.CharField(max_length=50)
    names = models.CharField(max_length=150)
    area = models.FloatField()
    geom = models.MultiPolygonField(srid=4326)


class Road(models.Model):
    name = models.CharField(max_length=50)
    geom = models.PolygonField(srid=4326)


class Ground(models.Model):
    name = models.CharField(max_length=50)
    area = models.FloatField()
    geom = models.MultiPolygonField(srid=4326)


class Fountain(models.Model):
    name = models.CharField(max_length=50)
    geom = models.MultiPolygonField(srid=4326)


class SepticTank(models.Model):
    name = models.CharField(max_length=50)
    area = models.FloatField()
    geom = models.MultiPolygonField(srid=4326)


class WaterBody(models.Model):
    wbtype = models.CharField(max_length=100)
    area = models.FloatField()
    geom = models.MultiPolygonField(srid=4326)
