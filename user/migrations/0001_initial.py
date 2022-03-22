# Generated by Django 4.0.1 on 2022-03-20 09:29

import django.core.validators
from django.db import migrations, models
import django.db.models.deletion
import user.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.BigAutoField(auto_created=True,
                 primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(
                    max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(
                    blank=True, null=True, verbose_name='last login')),
                ('username', models.CharField(max_length=64, unique=True)),
                ('full_name', models.CharField(max_length=64)),
                ('contact', models.CharField(blank=True, max_length=10, null=True, validators=[
                 django.core.validators.RegexValidator('^\\d{1,10}$')])),
                ('designation', models.CharField(choices=[('Student', 'Student'), ('Teacher', 'Teacher'), (
                    'Staff', 'Staff'), ('Other', 'Other')], default='Student', max_length=15)),
                ('email', models.EmailField(max_length=254, unique=True)),
                ('gender', models.CharField(choices=[
                 ('Male', 'Male'), ('Female', 'Female'), ('Other', 'Other')], default='Male', max_length=15)),
                ('is_active', models.BooleanField(default=False)),
                ('is_staff', models.BooleanField(default=False)),
                ('is_superuser', models.BooleanField(default=False)),
                ('email_verification_token', models.CharField(
                    blank=True, max_length=100, null=True)),
                ('group', models.ForeignKey(blank=True, null=True,
                 on_delete=django.db.models.deletion.CASCADE, related_name='UserGroup', to='auth.group')),
            ],
            options={
                'abstract': False,
            },
            managers=[
                ('objects', user.models.UserManager()),
            ],
        ),
    ]