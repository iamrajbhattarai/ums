//creating layers to add on the map

//1. Add Bing basemap
var bingMapLayer = new ol.layer.Tile({
  //visible: true,
  preload: Infinity,
  source: new ol.source.BingMaps({
    key: "Al8ndH_tSrjQGgBTDzeRsN4v97ct11yzrS78nH4i5zn960SjjFRC9WlmBLIBtHzc",
    imagerySet: "Aerial",
  }),
  title: "BingMaps",
});

//Adding all layers as one map
var allLayer = new ol.layer.Tile({
  source: new ol.source.TileSuperMapRest({
    url: "http://localhost:8090/iserver/services/map-contestworkspace/rest/maps/allmap",
    wrapX: true,
    cacheEnabled: false,
  }),
  projection: "EPSG:4326",
});

//2.Adding black background
var blackBackground = new ol.layer.Tile({
  source: new ol.source.TileSuperMapRest({
    url: "http://localhost:8090/iserver/services/map-contestworkspace/rest/maps/blackhousingboundarymap",
    wrapX: true,
    cacheEnabled: false,
  }),
  //visible:false,
});

//3.Adding gray background
var grayBackground = new ol.layer.Tile({
  source: new ol.source.TileSuperMapRest({
    url: "http://localhost:8090/iserver/services/map-contestworkspace/rest/maps/housingboundarymap",
    wrapX: true,
    cacheEnabled: false,
  }),
  visible: false,
});

//4.Adding tank layer
var tankLayer = new ol.layer.Tile({
  source: new ol.source.TileSuperMapRest({
    url: "http://localhost:8090/iserver/services/map-contestworkspace/rest/maps/tankmap",
    wrapX: true,
    cacheEnabled: false,
  }),
  //visible:false,
});

//5.Adding opensapce layer
var openspaceLayer = new ol.layer.Tile({
  source: new ol.source.TileSuperMapRest({
    url: "http://localhost:8090/iserver/services/map-contestworkspace/rest/maps/openspacemap",
    wrapX: true,
    cacheEnabled: false,
  }),
  //visible:false,
});

//6.Adding buildings layer
var buildingsLayer = new ol.layer.Tile({
  source: new ol.source.TileSuperMapRest({
    url: "http://localhost:8090/iserver/services/map-contestworkspace/rest/maps/buildingsmap",
    wrapX: true,
    cacheEnabled: false,
  }),
  //visible:false,
});

//7.Adding road layer
var roadLayer = new ol.layer.Tile({
  source: new ol.source.TileSuperMapRest({
    url: "http://localhost:8090/iserver/services/map-contestworkspace/rest/maps/roadmap",
    wrapX: true,
    cacheEnabled: false,
  }),
  //visible:false,
});

//8.Adding transmissionline layer
var transmissionlineLayer = new ol.layer.Tile({
  source: new ol.source.TileSuperMapRest({
    url: "http://localhost:8090/iserver/services/map-contestworkspace/rest/maps/transmissionlinemap",
    wrapX: true,
    cacheEnabled: false,
  }),
  //visible:false,
});

//9.Adding pipeline layer
var pipelineLayer = new ol.layer.Tile({
  source: new ol.source.TileSuperMapRest({
    url: "http://localhost:8090/iserver/services/map-contestworkspace/rest/maps/pipelinemap",
    wrapX: true,
    cacheEnabled: false,
  }),
  //visible:false,
});

//10.Adding drainageline layer
var drainagelineLayer = new ol.layer.Tile({
  source: new ol.source.TileSuperMapRest({
    url: "http://localhost:8090/iserver/services/map-contestworkspace/rest/maps/drainagelinemap",
    wrapX: true,
    cacheEnabled: false,
  }),
  //visible:false,
});

//11.Adding waterpoints layer
var waterpointsLayer = new ol.layer.Tile({
  source: new ol.source.TileSuperMapRest({
    url: "http://localhost:8090/iserver/services/map-contestworkspace/rest/maps/waterpointsmap",
    wrapX: true,
    cacheEnabled: false,
  }),
  //visible:false,
});

//12.Adding electricpoints layer
var electricpointsLayer = new ol.layer.Tile({
  source: new ol.source.TileSuperMapRest({
    url: "http://localhost:8090/iserver/services/map-contestworkspace/rest/maps/electicpointsmap",
    wrapX: true,
    cacheEnabled: false,
  }),
  //visible:false,
});

//13.Adding drainagepoints layer
var drainagepointsLayer = new ol.layer.Tile({
  source: new ol.source.TileSuperMapRest({
    url: "http://localhost:8090/iserver/services/map-contestworkspace/rest/maps/drainagepointsmap",
    wrapX: true,
    cacheEnabled: false,
  }),
  //visible:false,
});

//14.Adding temple layer
var templeLayer = new ol.layer.Tile({
  source: new ol.source.TileSuperMapRest({
    url: "http://localhost:8090/iserver/services/map-contestworkspace/rest/maps/templemap",
    wrapX: true,
    cacheEnabled: false,
  }),
  //visible:false,
});

//15.Adding temple layer
var complaintsLayer = new ol.layer.Tile({
  source: new ol.source.TileSuperMapRest({
    url: "http://localhost:8090/iserver/services/map-contestworkspace/rest/maps/complaintsmap",
    wrapX: true,
    cacheEnabled: false,
  }),
  //visible:false,
});

//now creating the layer group and adding
var layerGroup = new ol.layer.Group({
  layers: [
    bingMapLayer,
    blackBackground,
    grayBackground,
    buildingsLayer,
    tankLayer,
    openspaceLayer,
    roadLayer,
    transmissionlineLayer,
    pipelineLayer,
    drainagelineLayer,
    waterpointsLayer,
    electricpointsLayer,
    drainagepointsLayer,
    templeLayer,
    complaintsLayer,
  ],
});

//lets create a map object and assign all the layers from the layerGroup
var map = new ol.Map({
    target: "map",
    layers: [layerGroup],
    controls: ol.control
      .defaults({ attributionOptions: { collapsed: true } })
      .extend([new ol.supermap.control.Logo()]),
    view: new ol.View({
      center: [85.3222, 27.753014],
      zoom: 19,
      projection: "EPSG:4326",
      multiWorld: true,
    }),
  });

//lets add basic web map components

// add scale bar to the map
var scaleline = new ol.supermap.control.ScaleLine({
  target: document.getElementById("scale-line"),
});
map.addControl(scaleline);

//display Coordinates of Map Area
var mousePositionControl = new ol.control.MousePosition({
  coordinateFormat: ol.coordinate.createStringXY(4),
  projection: "EPSG:4326",
  emptyString: "Out of Map Area",
  className: "display-coordinate",
  target: document.getElementById("display-coordinate"),
});
map.addControl(mousePositionControl);

// add overview map
const overviewMapControl = new ol.control.OverviewMap({
  layers: [
    new ol.layer.Tile({
      source: new ol.source.OSM(),
    }),
  ],
  target: document.getElementById("overviewmap"),
  collapsed: false,
});
map.addControl(overviewMapControl);




//logic for functioning of layer selector

function bindInputs(layerid, layer) {
  const visibilityInput = $(layerid + " input.visible");
  visibilityInput.on("change", function () {
    layer.setVisible(this.checked);
  });
  //visibilityInput.prop('checked', layer.getVisible());
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

setup("#layer", layerGroup);
