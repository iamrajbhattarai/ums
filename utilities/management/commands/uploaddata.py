from django.core.management.base import BaseCommand

from utilities import load

'''
python manage.py uploaddata
'''


class Command(BaseCommand):
    help = 'upload data from shapefile to models.'

    def handle(self, *args, **kwargs):
        load.run1()
        load.run2()
        load.run3()
        load.run4()
        load.run5()
        load.run6()
        load.run7()
        load.run8()
        load.run9()
        load.run10()
        load.run11()
        load.run12()
        print("Successful!")
