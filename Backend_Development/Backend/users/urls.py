# defines the paths to the different web pages (goes to the different views)

from django.urls import path
from . import views  # import views from the current directory

urlpatterns = [
    path("", views.index, name="index"),  # serves the http response named index in views.py file
    path("user/", views.userNonPrimaryKeyBased),
]
