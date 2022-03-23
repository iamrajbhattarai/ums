import os.path
from io import BytesIO

from django.contrib.auth.models import (AbstractBaseUser, BaseUserManager,
                                        Group, PermissionsMixin)
from django.core.files.base import ContentFile
from django.core.validators import FileExtensionValidator, RegexValidator
from django.db import models

# from django.utils.translation import ugettext_lazy as _
# from PIL import Image

# from api.utils.make_thumbnail import make_thumbnail

# Create your models here.


class UserManager(BaseUserManager):
    use_in_migrations = True

    def _create_user(self, username, password, **extra_fields):
        """
        Creates and saves a User with the given email and password.
        """
        if not username:
            raise ValueError('The given username must be set')
        # email = self.normalize_email(email)
        user = self.model(username=username, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, username, password=None, **extra_fields):
        extra_fields.setdefault('is_superuser', False)
        return self._create_user(username, password, **extra_fields)

    def create_superuser(self, username, password, **extra_fields):
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_active', True)
        extra_fields.setdefault('email', 'utilityadmin@ku.com')

        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must have is_superuser=True.')

        return self._create_user(username, password, **extra_fields)

    def get_by_natural_key(self, username):
        return self.get(username=username)


class User(AbstractBaseUser, PermissionsMixin):
    GENDER_CHOICES = (
        ("Male", "Male"), ("Female", "Female"), ("Other", "Other")
    )
    DESIGNATION_CHOICES = (
        ("Student", "Student"), ("Teacher",
                                 "Teacher"), ("Staff", "Staff"), ("Other", "Other")
    )
    DEPARTMENT_CHOICES = (
        ("Geomatics Engineering", "Geomatics Engineering"),
        ("Computer Science and Engineering", "Computer Science and Engineering"),
        ("Civil Engineering with Architecture Program",
         "Civil Engineering with Architecture Program"),
        ("Chemical Engineering", "Chemical Engineering"),
        ("Mechanical Engineering", "Mechanical Engineering"),
        ("Electrical and Electronics Engineering",
         "Electrical and Electronics Engineering"),
        ("Other", "Other"),
    )
    username = models.CharField(max_length=64, unique=True)
    full_name = models.CharField(max_length=64)
    contact = models.CharField(max_length=10, validators=[
                               RegexValidator(r'^\d{1,10}$')], blank=True, null=True)
    designation = models.CharField(
        max_length=15, default="Student", choices=DESIGNATION_CHOICES)
    department = models.CharField(
        max_length=50, choices=DEPARTMENT_CHOICES, default="Geomatics Engineering")
    email = models.EmailField(unique=True)
    gender = models.CharField(
        max_length=15, default="Male", choices=GENDER_CHOICES)
    # image = models.ImageField(upload_to='profile_pic/', blank=True, null=True)
    # thumbnail = models.ImageField(
    #     upload_to='profile_pic/thumb/', editable=False,  blank=True, null=True)
    # group = models.ForeignKey(
    #     Group, related_name='UserGroup', on_delete=models.SET_NULL, blank=True, null=True)
    is_active = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    email_verification_token = models.CharField(
        max_length=100, null=True, blank=True)
    USERNAME_FIELD = 'username'
    objects = UserManager()

    def has_perm(self, perm, obj=None):
        return True

    def has_module_perms(self, app_label):
        return True

    def save(self, *args, **kwargs):
        # if self.image:
        #     if not make_thumbnail(self.image, self.thumbnail):
        #         raise Exception(
        #             'Could not create thumbnail- is the file type is valid')
        # # if self.password:
        # #     self.password=make_password(self.password)
        super(User, self).save(*args, **kwargs)

    def __str__(self):
        return self.username
