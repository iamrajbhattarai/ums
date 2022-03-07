from django.urls import include, path
from rest_framework.routers import DefaultRouter

from . import viewset

router = DefaultRouter()
router.register(r'building', viewset.BuildingViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('home/', viewset.home, name='homepage'),
    path('map/', viewset.webmap, name='webmap'),
    # path('user/', include('django.contrib.auth.urls')),
    path('login/', viewset.signIn, name='signIn'),
    path('logout/', viewset.signOut, name='signOut'),

]
