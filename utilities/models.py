# from django.db import models
from django.contrib.gis.db import models

# Create your models here.


class Building(models.Model):
    block = models.CharField(max_length=50)
    names = models.CharField(max_length=150)
    area = models.FloatField()
    geom = models.MultiPolygonField(srid=4326)
