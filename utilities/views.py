from django.shortcuts import render
from rest_framework.response import Response

# Create your views here.
def index(request):
    return render(request, 'utilities/base.html', {})

def webmap(request):
    return render(request, 'utilities/map.html', {})