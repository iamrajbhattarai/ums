# Generated by Django 4.0.1 on 2022-03-07 15:48

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('utilities', '0003_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='building',
            old_name='name',
            new_name='names',
        ),
    ]
