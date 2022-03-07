from pathlib import Path

from django.contrib.gis.utils import LayerMapping

from .models import Building

# building_mapping = {
#     'block': 'Block',
#     'names': 'Names',
#     'area': 'Area',
#     'geom': 'MULTIPOLYGON',
# }

# building_shp = Path(__file__).resolve().parent / \
#     'Shapefiles' / 'Building.shp'


# def run(verbose=True):
#     lm = LayerMapping(Building, building_shp,
#                       building_mapping, transform=False)
#     lm.save(strict=True, verbose=verbose)
