from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from donaciones import views

urlpatterns = [
    path('persona/', views.PersonaArreglo.as_view()),
    path('campana/', views.CampanaArreglo.as_view()),
    path('donaciones/', views.DonacionesArreglo.as_view()),
    path('login/<int:pk>', views.LoginDetallado.as_view()),
    path('persona/<int:pk>', views.PersonaDetallado.as_view()),
    path('campana/<int:pk>', views.CampanaDetallado.as_view()),
    path('donaciones/<int:pk>', views.DonacionesDetallado.as_view()),
]

urlpatterns = format_suffix_patterns(urlpatterns)