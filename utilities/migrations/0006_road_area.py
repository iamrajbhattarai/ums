# Generated by Django 4.0.1 on 2022-03-27 15:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('utilities', '0005_drainage_length'),
    ]

    operations = [
        migrations.AddField(
            model_name='road',
            name='area',
            field=models.FloatField(blank=True, null=True),
        ),
    ]