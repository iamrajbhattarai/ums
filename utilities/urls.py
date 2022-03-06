from django.urls import include, path
from rest_framework.routers import DefaultRouter

from . import views

router = DefaultRouter()
router.register(r'buildings', views.BuildingsViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('home/', views.home, name='homepage'),
    path('map/', views.webmap, name='webmap'),
    # path('user/', include('django.contrib.auth.urls')),
    path('login/', views.signIn, name='signIn'),
    path('logout/', views.signOut, name='signOut'),

]
