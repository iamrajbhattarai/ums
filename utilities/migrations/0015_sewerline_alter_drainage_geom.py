# Generated by Django 4.0.1 on 2022-03-08 15:39

import django.contrib.gis.db.models.fields
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('utilities', '0014_drainage'),
    ]

    operations = [
        migrations.CreateModel(
            name='Sewerline',
            fields=[
                ('id', models.BigAutoField(auto_created=True,
                 primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('geom', django.contrib.gis.db.models.fields.LineStringField(srid=4326)),
            ],
        ),
        migrations.AlterField(
            model_name='drainage',
            name='geom',
            field=django.contrib.gis.db.models.fields.MultiLineStringField(
                srid=4326),
        ),
    ]
