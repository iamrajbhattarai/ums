# Generated by Django 4.0.1 on 2022-03-07 16:22

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('utilities', '0005_alter_building_geom'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Building',
        ),
    ]