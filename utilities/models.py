# from django.db import models
from django.contrib.gis.db import models
# Create your models here.

class Buildings(models.Model):
    ownername = models.CharField(max_length=50)
    housenumber = models.CharField(max_length=50)
    block = models.CharField(max_length=50)
    shape_length = models.FloatField()
    shape_area = models.FloatField()
    geom = models.MultiPolygonField(srid=4326)


