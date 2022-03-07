from django.contrib import admin
# from django.contrib.gis import admin
from leaflet.admin import LeafletGeoAdmin

from .models import Building

# Register your models here.


class BuildingAdmin(LeafletGeoAdmin):
    list_display = ('block', 'names')
    search_fields = ('names',)
    list_filter = ('block',)
    ordering = ('block', )


admin.site.register(Building, BuildingAdmin)
