from django.db import models


# Create your models here.
class Persona(models.Model):
    user = models.CharField(max_length=20)
    nombre = models.CharField(max_length=45)
    apellido = models.CharField(max_length=45)
    correo = models.CharField(max_length= 45)
    telefono = models.CharField(max_length=10)

    def __str__(self):
        return self.nombre + " " + self.apellido


class Login(models.Model):
    user =  models.ForeignKey(Persona, on_delete=models.CASCADE)
    password = models.CharField(max_length=20)


class Campana(models.Model):
    nombre = models.CharField(max_length=45)
    user = models.ForeignKey(Persona, on_delete=models.CASCADE)

    def __str__(self):
        return self.nombre


class Donaciones(models.Model):
    categoria = models.CharField(max_length=15)
    metodo = models.CharField(max_length=30)
    user = models.ForeignKey(Persona, on_delete=models.CASCADE)
    campana = models.ForeignKey(Campana, on_delete=models.CASCADE)
    observacion = models.CharField(max_length=100)
    fecha = models.DateTimeField()

    def __str__(self):
        return self.observacion