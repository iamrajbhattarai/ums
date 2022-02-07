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
var buildingsLayer = new ol.layer.Vector({
  source: new ol.source.Vector({
    url: 'http://localhost:8000/buildings/',
    format: new ol.format.GeoJSON(),
  }),
  style: styles['buildings'],
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
    buildingsLayer,
  ],
});

//creating a map element
var map = new ol.Map({
    target: 'map',
    layers: [baselayerGroup, overlayGroup],
    view: new ol.View({
      center: [85.3222, 27.753014],
      zoom: 18,
      projection: 'EPSG:4326',
      multiWorld: true,
    })
  });

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
