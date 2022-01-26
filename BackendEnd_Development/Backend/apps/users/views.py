from django.shortcuts import render
from django.http import HttpResponse


# function represents a view (view index)
def index(response):
    return HttpResponse("<h1>PocketGuide!</h1>")


# function represents a view (view index)
def v1(response):
    return HttpResponse("<h1>PocketGuide View 1!</h1>")
