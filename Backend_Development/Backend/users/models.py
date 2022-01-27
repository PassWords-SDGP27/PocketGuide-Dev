from django.db import models


# creating a database object named user
class User(models.Model):
    # defining attributes each model user has
    username = models.CharField(max_length=20)
    firstName = models.CharField(max_length=200)
    lastName = models.CharField(max_length=200)
    email = models.CharField(max_length=100)

    def __self__(self):
        return self.username
