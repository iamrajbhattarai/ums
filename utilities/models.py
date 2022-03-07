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
