from rest_framework import serializers
from .models import *


class PersonaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Persona
        fields = ('id', 'user', 'nombre', 'apellido',
                  'correo','telefono')


class LoginSerializer(serializers.ModelSerializer):
    class Meta:
        model = Login
        fields = ('id', 'user','password',)


class CampanaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Campana
        fields = ('id', 'nombre','user')


class DonacionesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Donaciones
        fields = ('id', 'categoria','metodo','user','campana','observacion', 'fecha')
