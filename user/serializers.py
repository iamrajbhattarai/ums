from django.contrib.auth.models import Group
from rest_framework import serializers

from user.models import User


class UserSerializer(serializers.ModelSerializer):

    class Meta:
        model = User
        exclude = ['email_verification_token', 'password']
        # extra_kwargs = {"email": {"write_only": False, "required": True},
        #                 "username": {"write_only": False, "required": True},
        #                 "password": {"write_only": True, "required": True},
        #                 "full_name": {"write_only": False, "required": True},
        #                 "gender": {"write_only": False, "required": True},
        #                 }


# class UserGroupSerializerPermissions(serializers.ModelSerializer):
#     permissions = serializers.SerializerMethodField()

#     class Meta:
#         model = Group
#         fields = ['permissions']

#     def get_permissions(self, obj):
#         if obj.permissions:
#             data = []
#             qs = obj.permissions.all().values('name')
#             for q in qs:
#                 data.append(q['name'])
#             return data
#         return data
