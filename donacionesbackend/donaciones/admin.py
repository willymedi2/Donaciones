from django.contrib import admin
from .models import *
from import_export import resources
from import_export.admin import ImportExportModelAdmin

# Register your models here.

class PersonaResource(resources.ModelResource):
    class Meta:
        model = Persona


class PersonaAdmin(ImportExportModelAdmin,admin.ModelAdmin):
    search_fields = ['nombre']
    list_display = ('id', 'user', 'nombre', 'apellido', 'correo','telefono',)
    resource_class = PersonaResource


class LoginResource(resources.ModelResource):
    class Meta:
        model = Login


class LoginAdmin(ImportExportModelAdmin,admin.ModelAdmin):
    search_fields = ['id']
    list_display = ('id', 'user', )
    resource_class = LoginResource


class CampanaResource(resources.ModelResource):
    class Meta:
        model = Campana


class CampanaAdmin(ImportExportModelAdmin,admin.ModelAdmin):
    search_fields = ['nombre']
    list_display = ('id', 'nombre','user',)
    resource_class = CampanaResource


class DonacionesResource(resources.ModelResource):
    class Meta:
        model = Campana


class DonacionesAdmin(ImportExportModelAdmin,admin.ModelAdmin):
    search_fields = ['categoria']
    list_display = ('id', 'categoria','metodo','user','campana','observacion', 'fecha',)
    resource_class = CampanaResource

admin.site.register(Persona, PersonaAdmin)
admin.site.register(Login, LoginAdmin)
admin.site.register(Campana, CampanaAdmin)
admin.site.register(Donaciones, DonacionesAdmin)