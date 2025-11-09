# medication_expiry_tracker/urls.py
from django.contrib import admin
from django.urls import path, include
from .views import chaos_start

urlpatterns = [
    path('admin/', admin.site.urls),
    path('medications/', include('medications.urls')),  # both HTML and API
    path('users/', include('users.urls')),
    path("chaos/start", chaos_start),
]

