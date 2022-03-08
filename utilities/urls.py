from django.urls import include, path
from rest_framework.routers import DefaultRouter

from . import viewset

router = DefaultRouter()
router.register(r'building', viewset.BuildingViewSet)
router.register(r'boundary', viewset.BoundaryViewset)
router.register(r'road', viewset.RoadViewset)
router.register(r'ground', viewset.GroundViewset)
router.register(r'fountain', viewset.FountainViewset)
router.register(r'septic_tank', viewset.SepticTankViewset)
router.register(r'waterbody', viewset.WaterBodyViewset)


urlpatterns = [
    path('', include(router.urls)),
    path('home/', viewset.home, name='homepage'),
    path('map/', viewset.webmap, name='webmap'),
    # path('user/', include('django.contrib.auth.urls')),
    path('login/', viewset.signIn, name='signIn'),
    path('logout/', viewset.signOut, name='signOut'),

]
