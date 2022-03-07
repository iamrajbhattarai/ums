from django.contrib import admin
# from django.contrib.gis import admin
from leaflet.admin import LeafletGeoAdmin

from .models import Boundary, Building

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
