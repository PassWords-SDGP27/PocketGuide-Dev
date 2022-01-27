from django.db import models
from django.utils.translation import gettext_lazy as _


# # User Types
# class Roles(models.TextChoices):
#     SUPER_ADMIN = 'SUPER_ADMIN', _('SUPER_ADMIN')
#     ADMIN = 'ADMIN', _('ADMIN')
#     SERVICE_PROVIDER = 'SERVICE_PROVIDER', _('SERVICE_PROVIDER')
#     USER = 'USER', _('USER')
#
#
# # User Title
# class Title(models.TextChoices):
#     Mr = 'Mr', _('Mr')
#     Ms = 'Ms', _('Ms')
#     Mrs = 'Mrs', _('Mrs')
#
#
# # authentication types
# class AuthTypes(models.TextChoices):
#     PASSWORD = 'PASSWORD', _('PASSWORD')
#     PIN = 'PIN ', _('PIN ')


# creating a database object named user
class User(models.Model):
    # defining attributes each model user has
    first_name = models.CharField(max_length=255)
    last_name = models.CharField(max_length=255)
    email = models.CharField(max_length=255, unique=True)
    phone = models.CharField(max_length=15)
    password = models.CharField(max_length=255)
    username = models.CharField(max_length=255)
    active = models.BooleanField(default=False)

    def __self__(self):
        return self.username
