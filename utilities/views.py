from django.shortcuts import render
from rest_framework.response import Response

# Create your views here.
def home(request):
    return render(request, 'utilities/home.html', {})

def webmap(request):
    return render(request, 'utilities/map.html', {})