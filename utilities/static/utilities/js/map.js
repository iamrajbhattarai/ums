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

var buildingsLayer = new ol.layer.Vector({
  source: new ol.source.Vector({
    url: 'http://localhost:8000/buildings/',
    format: new ol.format.GeoJSON(),
  }),
  style: styles['buildings'],
});

//creating a map element 
var map = new ol.Map({
    target: 'map',
    layers: [      
      osmLayer,
      buildingsLayer,
    ],
    view: new ol.View({
      center: [85.3222, 27.753014],
      zoom: 18,
      projection: "EPSG:4326",
      multiWorld: true,
    })
  });