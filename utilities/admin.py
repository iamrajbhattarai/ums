from django.contrib import admin
# from django.contrib.gis import admin
from leaflet.admin import LeafletGeoAdmin

from .models import Buildings

# Register your models here.


class BuildingsAdmin(LeafletGeoAdmin):
    list_display = ('housenumber', 'ownername', 'block')
    search_fields = ('housenumber',)
    list_filter = ('block',)
    ordering = ('housenumber', )


admin.site.register(Buildings, BuildingsAdmin)
