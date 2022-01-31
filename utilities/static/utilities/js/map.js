//styles for each layer stored in a dictionary
var styles = {
  'buildings': new ol.style.Style({
    stroke: new ol.style.Stroke({
      color: 'blue',
      lineDash: [4],
      width: 3,
    }),
    fill: new ol.style.Fill({
      color: 'rgba(0, 0, 255, 0.1)',
    }),
  }),
}


// layers to display on the map
var osmLayer = new ol.layer.Tile({
  source: new ol.source.OSM()
});

var bingMapLayer = new ol.layer.Tile({
  visible: false,
  preload: Infinity,
  source: new ol.source.BingMaps({
    key: "Al8ndH_tSrjQGgBTDzeRsN4v97ct11yzrS78nH4i5zn960SjjFRC9WlmBLIBtHzc",
    imagerySet: "Aerial",
  }),
  title: "BingMaps",
});

var buildingsLayer = new ol.layer.Vector({
  source: new ol.source.Vector({
    url: 'http://localhost:8000/buildings/',
    format: new ol.format.GeoJSON(),
  }),
  style: styles['buildings'],
});

//LayerGroup
var layerGroup = new ol.layer.Group({
  layers: [
    osmLayer,
    bingMapLayer,
    buildingsLayer,
  ],
});


//creating a map element
var map = new ol.Map({
    target: 'map',
    layers: [layerGroup],
    view: new ol.View({
      center: [85.3222, 27.753014],
      zoom: 18,
      projection: "EPSG:4326",
      multiWorld: true,
    })
  });



//logic for functioning of layer selector

function bindInputs(layerid, layer) {
  const visibilityInput = $(layerid + " input.form-check-input");
  visibilityInput.on("change", function () {
    layer.setVisible(this.checked);
  });
}
function setup(id, group) {
  group.getLayers().forEach(function (layer, i) {
    const layerid = id + i;
    bindInputs(layerid, layer);
    // if (layer instanceof ol.layer.Group) {
    //   setup(layerid, layer);
    // }
  });
}

setup("#layer", layerGroup);
