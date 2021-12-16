from pathlib import Path
from django.contrib.gis.utils import LayerMapping
from .models import Building


# Auto-generated `LayerMapping` dictionary for Buildings model
buildings_mapping = {
    'ownername': 'OwnerName',
    'housenumber': 'HouseNumbe',
    'block': 'Block',
    'shape_length': 'SHAPE_Leng',
    'shape_area': 'SHAPE_Area',
    'geom': 'MULTIPOLYGON',
}

buildings_shp = Path(__file__).resolve().parent / 'HousingData' / 'Buildings.shp'

def run(verbose=True):
    lm = LayerMapping(Buildings, buildings_shp, buildings_mapping, transform=False)
    lm.save(strict=True, verbose=verbose)
