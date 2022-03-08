// for distance and area measurement in measure.js

let measureLayer, source;
source = new ol.source.Vector();
measureLayer = new ol.layer.Vector({
  source: source,
  style: styles['measure']
});


//basemap layers to display on the map

//OSM
var osmLayer = new ol.layer.Tile({
  visible: false,
  source: new ol.source.OSM(),
  title: 'OSM',
});

//Bing Satellite
var bingMapLayer = new ol.layer.Tile({
  visible: false,
  preload: Infinity,
  source: new ol.source.BingMaps({
    key: "Al8ndH_tSrjQGgBTDzeRsN4v97ct11yzrS78nH4i5zn960SjjFRC9WlmBLIBtHzc",
    imagerySet: "Aerial",
  }),
  title: 'BingMaps',
});

// //MapBox
// mapboxgl.accessToken = 'pk.eyJ1IjoicmFqYmhhdHRhcmFpIiwiYSI6ImNrcjNycmMxZDAxZjMycW52NWJia3oyMGEifQ.QXAX2aKoQ2uwh1ySjl68iw';
// var mapboxLayer = new ol.layer.MapboxVector({
//   styleUrl: 'mapbox://styles/rajbhattarai/ckz6trs4a000i14qw94l5yxt4',
//   accessToken: 'pk.eyJ1IjoicmFqYmhhdHRhcmFpIiwiYSI6ImNrejZuZGpzNDBkajEyb254NGt5ZmJrMnAifQ.jjZ9MEMbOuCxTUjbOue7Hg',
//   projection: 'EPSG:4326',
//   title: 'MapBox',
// });

//CartoDB Light
var cartoLightLayer = new ol.layer.Tile({
  visible: true,
  source: new ol.source.XYZ({
      url:'https://{1-4}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png',
  }),
  title: 'CartoLight',
});

//CartoDB Dark
var cartoDarkLayer = new ol.layer.Tile({
  visible: false,
  source: new ol.source.XYZ({
    url: 'https://{1-4}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png'
  }),
  title: 'CartoDark',
});


//utility overlays to display on the map
var boundaryLayer = new ol.layer.Vector({
  source: new ol.source.Vector({
    url: 'http://localhost:8000/boundary/',
    format: new ol.format.GeoJSON(),
  }),
  style: styles['boundary'],
});

var buildingsLayer = new ol.layer.Vector({
  source: new ol.source.Vector({
    url: 'http://localhost:8000/building/',
    format: new ol.format.GeoJSON(),
  }),
  style: styles['building'],
});

var groundLayer = new ol.layer.Vector({
  source: new ol.source.Vector({
    url: 'http://localhost:8000/ground/',
    format: new ol.format.GeoJSON(),
  }),
  style: styles['ground'],
});


var roadLayer = new ol.layer.Vector({
  source: new ol.source.Vector({
    url: 'http://localhost:8000/road/',
    format: new ol.format.GeoJSON(),
  }),
  style: styles['road'],
});

var fountainLayer = new ol.layer.Vector({
  source: new ol.source.Vector({
    url: 'http://localhost:8000/fountain/',
    format: new ol.format.GeoJSON(),
  }),
  style: styles['fountain'],
});

var septicTankLayer = new ol.layer.Vector({
  source: new ol.source.Vector({
    url: 'http://localhost:8000/septic_tank/',
    format: new ol.format.GeoJSON(),
  }),
  style: styles['septicTank'],
});

var waterbodyLayer = new ol.layer.Vector({
  source: new ol.source.Vector({
    url: 'http://localhost:8000/waterbody/',
    format: new ol.format.GeoJSON(),
  }),
  style: styles['waterbody'],
});

var drainageLayer = new ol.layer.Vector({
  source: new ol.source.Vector({
    url: 'http://localhost:8000/waterbody/',
    format: new ol.format.GeoJSON(),
  }),
  style: styles['drainage'],
});

var sewerlineLayer = new ol.layer.Vector({
  source: new ol.source.Vector({
    url: 'http://localhost:8000/sewerline/',
    format: new ol.format.GeoJSON(),
  }),
  style: styles['sewerline'],
});

//BaseMap Layer Group
var baselayerGroup = new ol.layer.Group({
  layers: [
    osmLayer,
    bingMapLayer,
    cartoLightLayer,
    cartoDarkLayer,
  ],
});

//utility layer group
var overlayGroup = new ol.layer.Group({
  layers: [
    boundaryLayer,
    buildingsLayer,
    groundLayer,
    roadLayer,
    fountainLayer,
    septicTankLayer,
    waterbodyLayer,
    drainageLayer,
    sewerlineLayer,
  ],
});

// declaring map as a global variable
//creating a map element
let map = new ol.Map({
    target: 'map',
    layers: [baselayerGroup, overlayGroup, measureLayer],
    controls: ol.control
      .defaults({ attributionOptions: {collapsed:true}}),
    view: new ol.View({
      center: [85.5361, 27.6185],
      // center: [9498023.86, 3217870.04],
      zoom: 18,
      projection: 'EPSG:4326',
      // projection: 'EPSG:3857',
      multiWorld: true,
    })
  });

//lets add basic web map components

// add scale bar to the map
var scaleline = new ol.control.ScaleLine({
  target: document.getElementById("scale-line"),
});
map.addControl(scaleline);

//display Coordinates of Map Area
var mousePositionControl = new ol.control.MousePosition({
  coordinateFormat: ol.coordinate.createStringXY(4),
  projection: "EPSG:4326",
  emptyString: "Out of Map",
  className: "display-coordinate",
  target: document.getElementById("display-coordinate"),
});
map.addControl(mousePositionControl);


//logic for functioning of baselayers selector
const baselayers = $("input[type='radio'][name='basemap']");
for (let baselayer of baselayers) {
  baselayer.addEventListener("change", function() {
    let baselayerValue = this.value;
    baselayerGroup.getLayers().forEach(function(layer, index, array) {
      let baselayerTitle = layer.get('title');
      layer.setVisible(baselayerTitle === baselayerValue);
    })
  })
}

//logic for functioning of overlays selector

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
    if (layer instanceof ol.layer.Group) {
      setup(layerid, layer);
    }
  });
}

setup("#layer", overlayGroup);
