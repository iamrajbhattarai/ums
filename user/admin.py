from django.contrib import admin

from .models import User


# Register your models here.
class UserAdmin(admin.ModelAdmin):
    list_display = ('id', 'email', 'username', 'full_name',
                    'is_active', 'is_staff')

    exclude = ('groups', )


admin.site.register(User, UserAdmin)
