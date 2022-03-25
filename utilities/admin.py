from django.contrib import admin
from django.contrib.sessions.models import Session
# from django.contrib.gis import admin
from leaflet.admin import LeafletGeoAdmin

from .models import *

# Register your models here.

# class SessionAdmin(admin.ModelAdmin):
#     def _session_data(self, obj):
#         return obj.get_decoded()  # .get('_auth_user_id')
#     list_display = ['session_key', '_session_data', 'expire_date']
#     readonly_fields = ['_session_data', 'session_data']
#     # exclude = ['session_data']
#     date_hierarchy = 'expire_date'
# admin.site.register(Session, SessionAdmin)


class BoundaryAdmin(LeafletGeoAdmin):
    list_display = ('id', 'name', 'area')


admin.site.register(Boundary, BoundaryAdmin)


class BuildingAdmin(LeafletGeoAdmin):
    list_display = ('id', 'block', 'name')
    search_fields = ('block', 'name',)
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
    list_display = ('id', 'problem_related_utility', 'service_required_type',
                    'is_solved', 'registration_date', 'registered_by')
    search_fields = ('id', 'problem_related_utility')
    list_filter = ('problem_related_utility',
                   'service_required_type', 'is_solved')
    ordering = ('id', )
    change_list_template = 'utilities/change_list_graph.html'


admin.site.register(Complaint, ComplaintAdmin)
