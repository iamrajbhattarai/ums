# Generated by Django 4.0.1 on 2022-03-27 07:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('utilities', '0003_complaint'),
    ]

    operations = [
        migrations.AlterField(
            model_name='complaint',
            name='problem_related_utility',
            field=models.CharField(choices=[('Electric Pole', 'Electric Pole'), ('Street Lamp', 'Street Lamp'), ('Transmission Line', 'Transmission Line'), ('Sewerline', 'Sewerline'), ('Drainage', 'Drainage'), ('Water Body', 'Water Body'), (
                'Septic Tank', 'Septic Tank'), ('Fountain', 'Fountain'), ('Road', 'Road'), ('Ground', 'Ground'), ('Building', 'Building'), ('Boundary', 'Boundary'), ('Other', 'Other')], default='Other', max_length=255),
        ),
    ]
