// Currently drawn feature.
let sketch;

// The help tooltip element.
let helpTooltipElement;

// Overlay to show the help messages.
let helpTooltip;

// The measure tooltip element.
let measureTooltipElement;

// Overlay to show the measurement.
let measureTooltip;

// Message to show when the user is drawing a polygon.
const continuePolygonMsg = 'Click to continue drawing the polygon';

// Message to show when the user is drawing a line.
const continueLineMsg = 'Click to continue drawing the line';
// Handle pointer move.
let draw; // global so we can remove it later

function measure(type){
  clearDraw();
  const pointerMoveHandler = function (evt) {
    if (evt.dragging) {
      return;
    }
    let helpMsg = 'Click to start drawing';
    if (sketch) {
      const geom = sketch.getGeometry();
      if (geom instanceof ol.geom.Polygon) {
        helpMsg = continuePolygonMsg;
      } else if (geom instanceof ol.geom.LineString) {
        helpMsg = continueLineMsg;
      }
    }

    helpTooltipElement.innerHTML = helpMsg;
    helpTooltip.setPosition(evt.coordinate);

    helpTooltipElement.classList.remove('hidden');
  };

  // map.addOverlay(vector);
  map.on('pointermove', pointerMoveHandler);

  map.getViewport().addEventListener('mouseout', function () {
    helpTooltipElement.classList.add('hidden');
  });

  const typeSelect = document.getElementById('type');

  // let draw; // global so we can remove it later

  // Format length output.
  const formatLength = function (line) {
    const length = ol.sphere.getLength(line, {projection:'EPSG:4326'});
    let output;
    if (length > 100) {
      output = Math.round((length / 1000) * 100) / 100 + ' ' + 'km';
    } else {
      output = Math.round(length * 100) / 100 + ' ' + 'm';
    }
    return output;
  };

  // Format area output.
  const formatArea = function (polygon) {
    const area = ol.sphere.getArea(polygon, {projection:'EPSG:4326'});
    let output;
    if (area > 10000) {
      output = Math.round((area / 1000000) * 100) / 100 + ' ' + 'km<sup>2</sup>';
    } else {
      output = Math.round(area * 100) / 100 + ' ' + 'm<sup>2</sup>';
    }
    return output;
  };

  function addInteraction(type) {
    // const type = type.value == 'area' ? 'Polygon' : 'LineString';
    type = type == 'area' ? 'Polygon' : 'LineString';
    draw = new ol.interaction.Draw({
      source: source,
      type: type,
      style: new ol.style.Style({
        fill: new ol.style.Fill({
          color: 'rgba(255, 255, 255, 0.2)',
        }),
        stroke: new ol.style.Stroke({
          color: 'rgba(0, 0, 0, 0.5)',
          lineDash: [10, 10],
          width: 2,
        }),
        image: new ol.style.Circle({
          radius: 5,
          stroke: new ol.style.Stroke({
            color: 'rgba(0, 0, 0, 0.7)',
          }),
          fill: new ol.style.Fill({
            color: 'rgba(254,215,104,1)',
          }),
        }),
      }),
    });
    map.addInteraction(draw);

    createMeasureTooltip();
    createHelpTooltip();

    let listener;
    draw.on('drawstart', function (evt) {
      // set sketch
      sketch = evt.feature;
      let tooltipCoord = evt.coordinate;
      listener = sketch.getGeometry().on('change', function (evt) {
        const geom = evt.target;
        let output;
        if (geom instanceof ol.geom.Polygon) {
          output = formatArea(geom);
          tooltipCoord = geom.getInteriorPoint().getCoordinates();
        } else if (geom instanceof ol.geom.LineString) {
          output = formatLength(geom);
          tooltipCoord = geom.getLastCoordinate();
        }
        measureTooltipElement.innerHTML = output;
        measureTooltip.setPosition(tooltipCoord);
      });
    });

    draw.on('drawend', function () {
      measureTooltipElement.className = 'ol-tooltip ol-tooltip-static';
      measureTooltip.setOffset([0, -7]);
      // unset sketch
      sketch = null;
      // unset tooltip so that a new one can be created
      measureTooltipElement = null;
      createMeasureTooltip();
      ol.Observable.unByKey(listener);
    });
  }

  // Creates a new help tooltip
  function createHelpTooltip() {
    if (helpTooltipElement) {
      helpTooltipElement.parentNode.removeChild(helpTooltipElement);
    }
    helpTooltipElement = document.createElement('div');
    helpTooltipElement.className = 'ol-tooltip hidden';
    helpTooltip = new ol.Overlay({
      element: helpTooltipElement,
      offset: [15, 0],
      positioning: 'center-left',
    });
    map.addOverlay(helpTooltip);
  }

  // Creates a new measure tooltip
  function createMeasureTooltip() {
    if (measureTooltipElement) {
      measureTooltipElement.parentNode.removeChild(measureTooltipElement);
    }
    measureTooltipElement = document.createElement('div');
    measureTooltipElement.className = 'ol-tooltip ol-tooltip-measure';
    measureTooltip = new ol.Overlay({
      element: measureTooltipElement,
      offset: [0, -15],
      positioning: 'bottom-center',
      stopEvent: false,
      insertFirst: false,
    });
    map.addOverlay(measureTooltip);
  }

  // Let user change the geometry type.
  // type.onchange = function () {
  //   map.removeInteraction(draw);
  //   addInteraction(type);
  // };

  addInteraction(type);
}
// // function to reset everything drawn and interaction
function clearDraw() {
  map.removeInteraction(draw);
  source.clear();
  map.removeOverlay(helpTooltip);
  map.removeOverlay(measureTooltip);
  removeElementsByClass('ol-tooltip ol-tooltip-static');
}
