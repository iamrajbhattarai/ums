from django.conf import settings
from django.contrib import auth, messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.contrib.gis.geos import Point
from django.core.mail import send_mail
from django.core.serializers import serialize
from django.http import JsonResponse
from django.http.response import HttpResponse
from django.shortcuts import redirect, render
from django.urls import include, path
from django.views.decorators.csrf import ensure_csrf_cookie
from rest_framework import status, viewsets
from rest_framework.authentication import (SessionAuthentication,
                                           TokenAuthentication)
from rest_framework.authtoken.models import Token
from rest_framework.permissions import AllowAny, IsAdminUser, IsAuthenticated
from rest_framework.response import Response

from user.models import User

from .models import *
from .serializers import *


# Create your views here.
def home(request):
    return render(request, 'utilities/home.html', {})


def webmap(request):
    user_role = ''
    if request.user.is_authenticated:
        user = request.user
        user_id = user.id
        if user.is_superuser:
            user_role = 'superadmin'
        else:
            user_role = 'client'
        token = Token.objects.get(user=user)
    else:
        token = ''
        user_role = ''
        user_id = ''
    return render(request, 'utilities/map.html', {'user_id': user_id, 'user_role': user_role, 'token': token})


class BuildingViewSet(viewsets.ModelViewSet):
    # permission_classes = [IsAuthenticated]
    queryset = Building.objects.all()
    serializer_class = BuildingSerializer
    http_method_names = ['get']


class BoundaryViewset(viewsets.ModelViewSet):
    # permission_classes = [IsAuthenticated]
    queryset = Boundary.objects.all()
    serializer_class = BoundarySerializer
    http_method_names = ['get']


class RoadViewset(viewsets.ModelViewSet):
    # permission_classes = [IsAuthenticated]
    queryset = Road.objects.all()
    serializer_class = RoadSerializer
    http_method_names = ['get']


class GroundViewset(viewsets.ModelViewSet):
    # permission_classes = [IsAuthenticated]
    queryset = Ground.objects.all()
    serializer_class = GroundSerializer
    http_method_names = ['get']


class FountainViewset(viewsets.ModelViewSet):
    # permission_classes = [IsAuthenticated]
    queryset = Fountain.objects.all()
    serializer_class = FountainSerializer
    http_method_names = ['get']


class SepticTankViewset(viewsets.ModelViewSet):
    # permission_classes = [IsAuthenticated]
    queryset = SepticTank.objects.all()
    serializer_class = SepticTankSerializer
    http_method_names = ['get']


class WaterBodyViewset(viewsets.ModelViewSet):
    # permission_classes = [IsAuthenticated]
    queryset = WaterBody.objects.all()
    serializer_class = WaterBodySerializer
    http_method_names = ['get']


class DrainageViewset(viewsets.ModelViewSet):
    # permission_classes = [IsAuthenticated]
    queryset = Drainage.objects.all()
    serializer_class = DrainageSerializer
    http_method_names = ['get']


class SewerlineViewset(viewsets.ModelViewSet):
    # permission_classes = [IsAuthenticated]
    queryset = Sewerline.objects.all()
    serializer_class = SewerlineSerializer
    http_method_names = ['get']


class TransmissionLineViewset(viewsets.ModelViewSet):
    # permission_classes = [IsAuthenticated]
    queryset = TransmissionLine.objects.all()
    serializer_class = TransmissionLineSerializer
    http_method_names = ['get']


class StreetLampViewset(viewsets.ModelViewSet):
    # permission_classes = [IsAuthenticated]
    queryset = StreetLamp.objects.all()
    serializer_class = StreetLampSerializer
    http_method_names = ['get']


class ElectricPoleViewset(viewsets.ModelViewSet):
    # permission_classes = [IsAuthenticated]
    queryset = ElectricPole.objects.all()
    serializer_class = ElectricPoleSerializer
    http_method_names = ['get']


class ComplaintViewset(viewsets.ModelViewSet):
    # permission_classes = [IsAuthenticated]
    queryset = Complaint.objects.filter(is_solved=False)
    serializer_class = ComplaintSerializer
    http_method_names = ['get', 'post', 'patch', 'put']

    def get_permissions(self):
        if self.action == 'create' or self.action == 'update' or self.action == 'partial_update':
            permission_classes = [IsAuthenticated]
        elif self.action == 'delete':
            permission_classes = [IsAdminUser]
        else:
            permission_classes = [AllowAny]
        return [permission() for permission in permission_classes]

    def create(self, request, *args, **kwargs):
        errors = []
        print(request.data)
        lng = request.data.get('long')
        lat = request.data.get('lat')
        request.data._mutable = True
        request.data.pop('long', None)
        request.data.pop('lat', None)
        geom = Point(float(lng), float(lat))
        ku_boundary = Boundary.objects.first().geom
        if geom.within(ku_boundary):
            request.data['geom'] = geom
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST, data={'message': 'You cannot set the geometry outside KU premises.'})
        # request.data['is_solved'] = False
        request.data['registered_by'] = request.user.id
        print(request.data)
        serializer = ComplaintSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(data={'message': 'Complaint Registered Succesfully!'}, status=status.HTTP_201_CREATED)
        else:
            for er in serializer._errors:
                errors.append(
                    {"errorName": er, "details": serializer._errors[er][0]})
            return Response(status=status.HTTP_400_BAD_REQUEST, data={'message': errors})

    def partial_update(self, request, pk=None):
        # print('pk is :', pk)
        if Complaint.objects.get(pk=pk):
            complaint_instance = Complaint.objects.get(pk=pk)
            message_text = 'Your complaint of ' + complaint_instance.problem_related_utility + ' utillity type with description ' + \
                complaint_instance.description + \
                ' has been resolved. Thank you for helping us maintain the utilities.\n-Kathmandu Univaersity Utility Management Team.'
            complaint_instance.is_solved = True
            user_email = complaint_instance.registered_by.email
            complaint_instance.save()
            subject = "Utility Concern Resolved"
            message = message_text
            email_from = settings.EMAIL_HOST_USER
            email_to = [user_email]
            send_mail(subject, message, email_from, email_to)
            return Response(data={'message': 'Data deleted succesfully!'}, status=status.HTTP_201_CREATED)
        return Response(data={'message': 'Could not retrieve object from database!'}, status=status.HTTP_400_BAD_REQUEST)

    def update(self, request, pk=None):
        complaint_instance = Complaint.objects.get(pk=pk)
        # print('pk is :', pk)
        errors = []
        lng = request.data.get('long')
        lat = request.data.get('lat')
        request.data._mutable = True
        request.data.pop('long', None)
        request.data.pop('lat', None)
        geom = Point(float(lng), float(lat))
        ku_boundary = Boundary.objects.first().geom
        if geom.within(ku_boundary):
            request.data['geom'] = geom
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST, data={'message': 'You cannot set the geometry outside KU premises.'})
        # request.data['is_solved'] = False
        request.data['registered_by'] = request.user.id
        serializer = ComplaintSerializer(
            complaint_instance, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            # print(serializer.data)
            return Response(data={'message': 'Complaint Updated Succesfully!'}, status=status.HTTP_201_CREATED)
        else:
            for er in serializer._errors:
                errors.append(
                    {"errorName": er, "details": serializer._errors[er][0]})
            return Response(status=status.HTTP_400_BAD_REQUEST, data={'message': errors})

    def list(self, request, *args, **kwargs):
        queryset = Complaint.objects.filter(is_solved=False)
        service_required_type = self.request.query_params.get(
            'service_required_type', None)
        problem_related_utility = self.request.query_params.get(
            'problem_related_utility', None)
        # print(service_required_type)
        if service_required_type == 'Normal' or service_required_type == 'Emergency':
            queryset = queryset.filter(
                service_required_type=service_required_type)
        if problem_related_utility is not None and problem_related_utility != 'All' and problem_related_utility != 'Select the Utility Type':
            queryset = queryset.filter(
                problem_related_utility=problem_related_utility)
        serializer = ComplaintSerializer(queryset, many=True)
        return Response(serializer.data)
