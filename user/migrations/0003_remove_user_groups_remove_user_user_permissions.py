# Generated by Django 4.0.1 on 2022-03-20 13:12

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0002_user_groups_user_user_permissions'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='user',
            name='groups',
        ),
        migrations.RemoveField(
            model_name='user',
            name='user_permissions',
        ),
    ]
