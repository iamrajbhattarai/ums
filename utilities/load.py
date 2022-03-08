from pathlib import Path

from django.contrib.gis.utils import LayerMapping

from .models import *

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
#######################################################################################################
# boundary_mapping = {
#     'area': 'Area',
#     'name': 'Name',
#     'geom': 'MULTIPOLYGON25D',
# }

# boundary_shp = Path(__file__).resolve().parent / \
#     'Shapefiles' / 'Boundaries.shp'


# def run(verbose=True):
#     lm = LayerMapping(Boundary, boundary_shp,
#                       boundary_mapping, transform=False)
#     lm.save(strict=True, verbose=verbose)
###########################################################################################################

road_mapping = {
    'name': 'Name',
    'geom': 'POLYGON',
}


road_shp = Path(__file__).resolve().parent / \
    'Shapefiles' / 'Road.shp'


def run(verbose=True):
    lm = LayerMapping(Road, road_shp,
                      road_mapping, transform=False)
    lm.save(strict=True, verbose=verbose)
