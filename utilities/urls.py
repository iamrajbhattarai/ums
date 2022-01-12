from django.urls import path, include
from rest_framework.routers import DefaultRouter
from . import views

router = DefaultRouter()
# router.register(r'buildings', views.BuildingsViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('home/', views.home, name='homepage'),
    path('map/', views.webmap, name='webmap'),
    path('buildings/', views.buildings, name='buildings')
]
