from django.core.management.base import BaseCommand

from utilities import load

'''
python manage.py uploaddata
'''


class Command(BaseCommand):
    help = 'upload data from shapefile to models.'

    def handle(self, *args, **kwargs):
        load.run()
        print("Successful!")
