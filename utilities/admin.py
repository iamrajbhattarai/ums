from django.contrib import admin
# from django.contrib.gis import admin
from leaflet.admin import LeafletGeoAdmin

from .models import *

# Register your models here.


class BoundaryAdmin(LeafletGeoAdmin):
    list_display = ('id', 'name', 'area')


admin.site.register(Boundary, BoundaryAdmin)


class BuildingAdmin(LeafletGeoAdmin):
    list_display = ('id', 'block', 'names')
    search_fields = ('block', 'names',)
    ordering = ('id', )


admin.site.register(Building, BuildingAdmin)


class RoadAdmin(LeafletGeoAdmin):
    list_display = ('id', 'name')
    search_fields = ('name',)
    ordering = ('id', )


admin.site.register(Road, RoadAdmin)


class GroundAdmin(LeafletGeoAdmin):
    list_display = ('id', 'name')
    search_fields = ('name',)
    ordering = ('id', )


admin.site.register(Ground, GroundAdmin)


class FountainAdmin(LeafletGeoAdmin):
    list_display = ('id', 'name')
    search_fields = ('name',)
    ordering = ('id', )


admin.site.register(Fountain, FountainAdmin)


class SepticTankAdmin(LeafletGeoAdmin):
    list_display = ('id', 'name')
    search_fields = ('name',)
    ordering = ('id', )


admin.site.register(SepticTank, SepticTankAdmin)


class WaterBodyAdmin(LeafletGeoAdmin):
    list_display = ('id', 'wbtype')
    search_fields = ('wbtype',)
    list_filter = ('wbtype',)
    ordering = ('id', )


admin.site.register(WaterBody, WaterBodyAdmin)


class DrainageAdmin(LeafletGeoAdmin):
    list_display = ('id', 'name')
    search_fields = ('name',)
    ordering = ('id', )


admin.site.register(Drainage, DrainageAdmin)


class SewerlineAdmin(LeafletGeoAdmin):
    list_display = ('id', 'name')
    search_fields = ('name',)
    ordering = ('id', )


admin.site.register(Sewerline, SewerlineAdmin)


class TransmissionLineAdmin(LeafletGeoAdmin):
    list_display = ('id', 'name')
    search_fields = ('name',)
    ordering = ('id', )


admin.site.register(TransmissionLine, TransmissionLineAdmin)


class StreetLampAdmin(LeafletGeoAdmin):
    list_display = ('id', 'name')
    search_fields = ('name',)
    ordering = ('id', )


admin.site.register(StreetLamp, StreetLampAdmin)


class ElectricPoleAdmin(LeafletGeoAdmin):
    list_display = ('id', 'name')
    search_fields = ('name',)
    ordering = ('id', )


admin.site.register(ElectricPole, ElectricPoleAdmin)


class ComplaintAdmin(LeafletGeoAdmin):
    list_display = ('id', 'problem', 'service_required_type', 'is_solved')
    search_fields = ('id', 'problem')
    list_filter = ('service_required_type', 'is_solved')
    ordering = ('id', )


admin.site.register(Complaint, ComplaintAdmin)
