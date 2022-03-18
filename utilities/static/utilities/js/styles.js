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
          color: 'rgb(224,196,147)',
          // color: '#FFF',
        }),
      }),

    'road': new ol.style.Style({
        stroke: new ol.style.Stroke({
          color: 'rgba(33,37,41,0.8)',
          // lineDash: [4],
          width: 2,
        }),
        fill: new ol.style.Fill({
          color: 'rgba(33,37,41,0.5)',
        }),
      }),

    'ground': new ol.style.Style({
        // stroke: new ol.style.Stroke({
        //   color: 'green',
        //   // lineDash: [4],
        //   width: 2,
        // }),
        fill: new ol.style.Fill({
          color: 'rgb(164,205,174)',
        }),
      }),

      'fountain': new ol.style.Style({
        stroke: new ol.style.Stroke({
          color: 'black',
          // lineDash: [4],
          width: 1,
        }),
        fill: new ol.style.Fill({
          color: 'rgb(230,190,235)',
        }),
      }),

      'septicTank': new ol.style.Style({
        stroke: new ol.style.Stroke({
          color: 'black',
          // lineDash: [4],
          width: 1,
        }),
        fill: new ol.style.Fill({
          color: 'rgb(138,120,38)',
        }),
      }),

      'waterbody': new ol.style.Style({
        stroke: new ol.style.Stroke({
          color: 'black',
          // lineDash: [4],
          width: 2,
        }),
        fill: new ol.style.Fill({
          color: 'rgb(9,195,215)',
        }),
      }),

      'drainage': new ol.style.Style({
        stroke: new ol.style.Stroke({
          color: 'green',
          // lineDash: [4],
          width: 2,
        }),
      }),
      'sewerline': new ol.style.Style({
        stroke: new ol.style.Stroke({
          color: 'green',
          lineDash: [4],
          width: 2,
        }),
      }),
      'transmissionline': new ol.style.Style({
        stroke: new ol.style.Stroke({
          color: 'red',
          // lineDash: [4],
          width: 2,
        }),
      }),
      'streetlamp': new ol.style.Style({
        stroke: new ol.style.Stroke({
          color: 'blue',
          // lineDash: [4],
          width: 2,
        }),
        image: new ol.style.Circle({
          radius: 4,
          fill: new ol.style.Fill({
            color: 'blue',
          }),
        }),
      }),
      'electricpole': new ol.style.Style({
        stroke: new ol.style.Stroke({
          color: 'black',
          // lineDash: [4],
          width: 2,
        }),
        image: new ol.style.Circle({
          radius: 4,
          fill: new ol.style.Fill({
            color: 'red',
          }),
        }),
      }),
      // 'complaint': new ol.style.Style({
      //   stroke: new ol.style.Stroke({
      //     color: 'black',
      //     // lineDash: [4],
      //     width: 2,
      //   }),
      //   image: new ol.style.Circle({
      //     radius: 4,
      //     fill: new ol.style.Fill({
      //       color: 'green',
      //     }),
      //   }),
      // }),
      'complaint': new ol.style.Style({
        image: new ol.style.Icon({
          anchor: [0.5, 46],
          anchorXUnits: 'fraction',
          anchorYUnits: 'pixels',
          src: 'http://localhost:8000/static/utilities/complaint.png',
        }),
      }),

  }
