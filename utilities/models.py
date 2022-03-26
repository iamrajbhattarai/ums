# from django.db import models
from django.contrib.gis.db import models

from user.models import User


# Create your models here.
class Boundary(models.Model):
    area = models.FloatField()
    name = models.CharField(max_length=50)
    geom = models.MultiPolygonField(srid=4326)


class Building(models.Model):
    block = models.CharField(max_length=50)
    name = models.CharField(max_length=150)
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


class Drainage(models.Model):
    name = models.CharField(max_length=50)
    geom = models.MultiLineStringField(srid=4326)


class Sewerline(models.Model):
    name = models.CharField(max_length=50)
    geom = models.MultiLineStringField(srid=4326)


class TransmissionLine(models.Model):
    name = models.CharField(max_length=50)
    geom = models.MultiLineStringField(srid=4326)


class StreetLamp(models.Model):
    name = models.CharField(max_length=50)
    geom = models.PointField(srid=4326)


class ElectricPole(models.Model):
    name = models.CharField(max_length=50)
    geom = models.PointField(srid=4326)


class Complaint(models.Model):
    SERVICE_REQUIRED_TYPE_CHOICES = (
        ("Normal", "Normal"),
        ("Emergency", "Emergency"),
    )

    PROBLEM_REALTED_UTILITY_CHOICES = (
        ("Electric Pole", "Electric Pole"),
        ("Street Lamp", "Street Lamp"),
        ("Transmission Line", "Transmission Line"),
        ("Sewerline", "Sewerline"),
        ("Drainage", "Drainage"),
        ("Water Body", "Water Body"),
        ("Septic Tank", "Septic Tank"),
        ("Fountain", "Fountain"),
        ("Road", "Road"),
        ("Ground", "Ground"),
        ("Building", "Building"),
        ("Boundary", "Boundary"),
        ("Other", "Other"),
    )

    problem_related_utility = models.CharField(
        max_length=255, choices=PROBLEM_REALTED_UTILITY_CHOICES, default='Other')
    description = models.TextField()
    service_required_type = models.CharField(
        max_length=50, choices=SERVICE_REQUIRED_TYPE_CHOICES, default="Normal")
    geom = models.PointField(srid=4326)
    is_solved = models.BooleanField(default=False)
    registration_date = models.DateTimeField(auto_now_add=True)
    registered_by = models.ForeignKey(
        User, related_name="complaint_registering_user", on_delete=models.SET_NULL, blank=True, null=True)
