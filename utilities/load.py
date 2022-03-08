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

# road_mapping = {
#     'name': 'Name',
#     'geom': 'POLYGON',
# }


# road_shp = Path(__file__).resolve().parent / \
#     'Shapefiles' / 'Road.shp'


# def run(verbose=True):
#     lm = LayerMapping(Road, road_shp,
#                       road_mapping, transform=False)
#     lm.save(strict=True, verbose=verbose)
###########################################################################################################

# ground_mapping = {
#     'name': 'Name',
#     'area': 'Area',
#     'geom': 'MULTIPOLYGON',
# }

# ground_shp = Path(__file__).resolve().parent / \
#     'Shapefiles' / 'Ground.shp'


# def run(verbose=True):
#     lm = LayerMapping(Ground, ground_shp,
#                       ground_mapping, transform=False)
#     lm.save(strict=True, verbose=verbose)
##############################################################################################################

# fountain_mapping = {
#     'name': 'Name',
#     'geom': 'MULTIPOLYGON',
# }

# fountain_shp = Path(__file__).resolve().parent / \
#     'Shapefiles' / 'Fountain.shp'


# def run(verbose=True):
#     lm = LayerMapping(Fountain, fountain_shp,
#                       fountain_mapping, transform=False)
#     lm.save(strict=True, verbose=verbose)

##############################################################################################################

# septictank_mapping = {
#     'name': 'Name',
#     'area': 'Area',
#     'geom': 'MULTIPOLYGON',
# }

# septic_tank_shp = Path(__file__).resolve().parent / \
#     'Shapefiles' / 'Septic_tank.shp'


# def run(verbose=True):
#     lm = LayerMapping(SepticTank, septic_tank_shp,
#                       septictank_mapping, transform=False)
#     lm.save(strict=True, verbose=verbose)
#################################################################################################################

# waterbody_mapping = {
#     'area': 'Area',
#     'wbtype': 'WBType',
#     'geom': 'MULTIPOLYGON',
# }


# waterbody_shp = Path(__file__).resolve().parent / \
#     'Shapefiles' / 'Water_body.shp'


# def run(verbose=True):
#     lm = LayerMapping(WaterBody, waterbody_shp,
#                       waterbody_mapping, transform=False)
#     lm.save(strict=True, verbose=verbose)

#############################################################################################################################

# drainage_mapping = {
#     'name': 'Name',
#     'geom': 'MULTILINESTRING',
# }

# drainage_shp = Path(__file__).resolve().parent / \
#     'Shapefiles' / 'Drain.shp'

# def run(verbose=True):
#     lm = LayerMapping(Drainage, drainage_shp,
#                       drainage_mapping, transform=False)
#     lm.save(strict=True, verbose=verbose)

######################################################
sewerline_mapping = {
    'name': 'Name',
    'geom': 'LINESTRING',
}

sewerline_shp = Path(__file__).resolve().parent / \
    'Shapefiles' / 'Drain.shp'


def run(verbose=True):
    lm = LayerMapping(Sewerline, sewerline_shp,
                      sewerline_mapping, transform=False)
    lm.save(strict=True, verbose=verbose)
