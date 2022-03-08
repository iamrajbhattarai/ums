//styles for each layer stored in a dictionary
var styles = {
    'measure': new ol.style.Style({
        fill: new ol.style.Fill({
          color: 'rgba(255, 255, 255, 0.2)',
        }),
        stroke: new ol.style.Stroke({
          color: '#ffcc33',
          width: 2,
        }),
        image: new ol.style.Circle({
          radius: 7,
          fill: new ol.style.Fill({
            color: '#ffcc33',
          }),
        }),
      }),

    'boundary': new ol.style.Style({
        stroke: new ol.style.Stroke({
          color: 'black',
          // lineDash: [4],
          width: 2,
        }),
        fill: new ol.style.Fill({
          // color: 'rgba(0, 0, 255, 0.1)',
          color: '#F7F7F7',
        }),
      }),

    'building': new ol.style.Style({
        stroke: new ol.style.Stroke({
          color: 'black',
          // lineDash: [4],
          width: 2,
        }),
        fill: new ol.style.Fill({
          // color: 'rgba(0, 0, 255, 0.1)',
          color: '#FFF',
        }),
      }),

    'road': new ol.style.Style({
        stroke: new ol.style.Stroke({
          color: 'green',
          // lineDash: [4],
          width: 2,
        }),
        fill: new ol.style.Fill({
          color: 'rgba(0, 0, 255, 0.1)',
        }),
      }),

    'ground': new ol.style.Style({
        // stroke: new ol.style.Stroke({
        //   color: 'green',
        //   // lineDash: [4],
        //   width: 2,
        // }),
        fill: new ol.style.Fill({
          color: '#86B1DD',
        }),
      }),

      'fountain': new ol.style.Style({
        stroke: new ol.style.Stroke({
          color: 'green',
          // lineDash: [4],
          width: 2,
        }),
        fill: new ol.style.Fill({
          color: 'blue',
        }),
      }),


  }
