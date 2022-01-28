import uuid
from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils.translation import gettext_lazy as _


# User Types
class Roles(models.TextChoices):
    SUPER_ADMIN = 'SUPER_ADMIN', _('SUPER_ADMIN')
    ADMIN = 'ADMIN', _('ADMIN')
    # SERVICE_PROVIDER = 'SERVICE_PROVIDER', _('SERVICE_PROVIDER')???
    USER = 'USER', _('USER')


# User Title
class Title(models.TextChoices):
    Mr = 'Mr', _('Mr')
    Ms = 'Ms', _('Ms')
    Mrs = 'Mrs', _('Mrs')


# authentication types
class AuthTypes(models.TextChoices):
    PASSWORD = 'PASSWORD', _('PASSWORD')
    PIN = 'PIN ', _('PIN ')


# creating a database object named user
class User(AbstractUser):
    # defining attributes each model user has
    user_type = models.CharField(max_length=20, choices=Roles.choices, default=Roles.USER)
    title = models.CharField(max_length=20, choices=Title.choices)
    first_name = models.CharField(max_length=255)
    last_name = models.CharField(max_length=255)
    email = models.CharField(max_length=255, unique=True)
    phone = models.CharField(max_length=15)
    password = models.CharField(max_length=255)
    username = None
    active = models.BooleanField(default=False)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    def __self__(self):
        return self.username
