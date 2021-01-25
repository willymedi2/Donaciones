from django.shortcuts import render
from rest_framework import generics
from .models import *
from .serializers import *

# Create your views here.

class PersonaArreglo(generics.ListCreateAPIView):
    queryset = Persona.objects.all()
    serializer_class = PersonaSerializer


class PersonaDetallado(generics.RetrieveUpdateDestroyAPIView):
    queryset = Persona.objects.all()
    serializer_class = PersonaSerializer


class DonacionesArreglo(generics.ListCreateAPIView):
    queryset = Donaciones.objects.all()
    serializer_class = DonacionesSerializer


class DonacionesDetallado(generics.RetrieveUpdateDestroyAPIView):
    queryset = Donaciones.objects.all()
    serializer_class = DonacionesSerializer


class CampanaArreglo(generics.ListCreateAPIView):
    queryset = Campana.objects.all()
    serializer_class = CampanaSerializer


class CampanaDetallado(generics.RetrieveUpdateDestroyAPIView):
    queryset = Campana.objects.all()
    serializer_class = CampanaSerializer


class LoginDetallado(generics.RetrieveUpdateDestroyAPIView):
    queryset = Login.objects.all()
    serializer_class = LoginSerializer