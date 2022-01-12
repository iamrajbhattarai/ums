var map = new ol.Map({
    target: 'map',
    layers: [
      new ol.layer.Tile({
        source: new ol.source.OSM()
      })
    ],
    view: new ol.View({
      center: [85.5386, 27.6195],
      zoom: 18,
      projection: "EPSG:4326",
      multiWorld: true,
    })
  });