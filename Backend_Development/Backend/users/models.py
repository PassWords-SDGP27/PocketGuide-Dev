from django.db import models


# creating a database object named user
class User(models.Model):
    # defining attributes each model user has
    name = models.CharField(max_length=200)

    def __self__(self):
        return self.name
