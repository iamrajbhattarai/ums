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
    search_fields = ('names',)
    list_filter = ('block',)
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
