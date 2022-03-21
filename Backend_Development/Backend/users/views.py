from django.shortcuts import render
from django.http import HttpResponse
from rest_framework.views import APIView
from users.serializer import UserSerializer
from users.models import models, User

from rest_framework.response import Response  # include the response to each request
from rest_framework import status  # maintain status of a response
from rest_framework.decorators import api_view  # handles what http method a function supports
from django.utils.translation import gettext_lazy as _


# function represents a view (view index)
def index(response):
    return HttpResponse("<h1>PocketGuide!</h1>")

# Register Users View
class RegisterView(APIView):
    def post(self, request):
        serializer = UserSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)

# # non primary key based
# @api_view(['GET', 'POST'])
# def userNonPrimaryKeyBased(request):
#     if request.method == "GET":
#         # Get new student
#         users = User.objects.all()  # Assign all student rows to the users variable
#         serializer = UserSerializer(users, many=True)
#         return Response(serializer.data)
#
#     elif request.method == "POST":
#         # Add new student
#         serializer = UserSerializer(data=request.data)
#         if serializer.is_valid():
#             serializer.save()
#             return Response(serializer.data, status=status.HTTP_201_CREATED)

# # function represents a view (view index)
# def index(response):
#     return HttpResponse("<h1>PocketGuide!</h1>")
#
#
# # function represents a view (view index)
# def v1(response):
#     return HttpResponse("<h1>PocketGuide View 1!</h1>")
