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

let listener;
let select;
let currentLayer;
let currentFeature;
let resultLayer;

function measure(type) {
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
    const length = ol.sphere.getLength(line, { projection: 'EPSG:4326' });
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
    const area = ol.sphere.getArea(polygon, { projection: 'EPSG:4326' });
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

    // let listener;
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

  addInteraction(type);
}
//function to reset everything drawn and interaction
function clearDraw() {
  map.removeInteraction(draw);
  map.removeInteraction(select);
  map.removeInteraction(modify);
  map.removeInteraction(snap);
  source.clear();
  currentFeature = null;
  map.removeOverlay(helpTooltip);
  map.removeOverlay(measureTooltip);
  overlay.setPosition(undefined);
  removeElementsByClass('ol-tooltip ol-tooltip-static');
  $('#noFeatureErrorModal').modal('hide');
  // editSource.clear();
}

// for popup
var container = document.getElementById("popup"),
  content = document.getElementById("popup-content"),
  closer = document.getElementById('popup-closer');
var overlay = new ol.Overlay({
  element: container,
  autoPan: true,
  autoPanAnimation: {
    duration: 250,
  },
  offset: [0, -20],
});

closer.onclick = function () {
  overlay.setPosition(undefined);
  closer.blur();
  return false;
};

//creating a dictionary which links the inputs from the user to its associated layers. This is used for achieving clickQuery function
var layerDict = {
  "Boundary": boundaryLayer,
  "Building": buildingsLayer,
  "Ground": groundLayer,
  "Road": roadLayer,
  "Fountain": fountainLayer,
  "Septic Tank": septicTankLayer,
  "Water Body": waterbodyLayer,
  "Drainage": drainageLayer,
  "Sewerline": sewerlineLayer,
  "Transmission Line": transmissionlineLayer,
  "Street Lamp": streetlampLayer,
  "Electric Pole": electricpoleLayer,
  "Complaint": complaintLayer,
};



//function that highlights the queried feature and displays attribute
function clickQuery() {
  clearDraw();
  const pointerMoveHandler = function (evt) {
    if (evt.dragging) {
      return;
    }
  };
  // Drawing interaction
  draw = new ol.interaction.Draw({
    source: popupSource,
    type: 'Point',
    //only draw when Ctrl is pressed.
    // condition : ol.events.condition.platformModifierKeyOnly
  });
  map.addInteraction(draw);

  /* add ol.collection to hold all selected features */
  select = new ol.interaction.Select();
  map.addInteraction(select);
  selectedFeatures = select.getFeatures();

  draw.on('drawstart', function (event) {

    source.clear();
    select.setActive(false);
    selectedFeatures.clear();
    currentFeature = null;
  }, this);

  draw.on('drawend', function (event) {

    delaySelectActivate();
    selectedFeatures.clear();
    currentFeature = null;
    var point = event.feature.getGeometry();
    // var features = buildingsLayer.getSource().getFeatures();
    currentLayer = layerDict[$("#select-layer").text()];
    var features = currentLayer.getSource().getFeatures();
    //to accomodate for line layers since they intersect at a common point
    var count = 1;
    var pointLayerList = [electricpoleLayer, streetlampLayer, complaintLayer]
    var lineLayerList = [transmissionlineLayer, drainageLayer, sewerlineLayer]

    for (var i = 0; i < features.length; i++) {
      if (pointLayerList.includes(currentLayer)) {
        var extent = features[i].getGeometry().getExtent();
        if (point.intersectsExtent(ol.extent.buffer(extent, 0.00009))) {
          selectedFeatures.push(features[i]);
          currentFeature = features[i];
        }
      }
      else if (lineLayerList.includes(currentLayer)) {
        // point.intersectsExtent( features[i].getGeometry().getExtent() )
        if (features[i].getGeometry().intersectsExtent(ol.extent.buffer(point.getExtent(), 0.00005))) {
          if (count <= 1) {
            selectedFeatures.push(features[i]);
            currentFeature = features[i];
          }
          count = count + 1;
          // console.log(count);
        }
      }
      else {
        if (features[i].getGeometry().intersectsExtent(point.getExtent())) {
          selectedFeatures.push(features[i]);
          currentFeature = features[i];
        }
      }
    }
    if (!currentFeature) {
      map.removeInteraction(draw);
      $('#noFeatureErrorModal').modal('show');
    }
    displayPopup();
  });

  function delaySelectActivate() {
    setTimeout(function () {
      select.setActive(true)
    }, 300);
  }

}


function displayPopup(){
  propertiesDict = currentFeature.getProperties()
  var geom = currentFeature.getGeometry();
  console.log(geom.getCoordinates());
  var user;
  var geomType = geom.getType();
  // console.log(geomType);
  var contentHTML = "<h5 style='color:#33727e;'><center><b>Popup</b></center></h5>";
  contentHTML += '<table class="table table-bordered">';
  contentHTML += "<tr><td class='menu'>id</td><td>" + currentFeature.getId() + "</td></tr>";
  $.each(propertiesDict, function (key, value) {
    if (key != "geometry" && currentLayer != complaintLayer) {
      contentHTML += "<tr>";
      contentHTML += "<td class='menu'>" + key + "</td>";
      if (key == "area") {
        contentHTML += "<td>" + value + " m<sup>2</sup></td></tr>";
      }
      else if (key == "length") {
        contentHTML += "<td>" + value + " m</td></tr>";
      }
      else {
        contentHTML += "<td>" + value + "</td></tr>";
      }
    }
    else if (key != "geometry") {
      contentHTML += "<tr>";
      if (key == "registered_by") {
        contentHTML += "<td class='menu'>complaint_registered_user_id</td>";
        user = value;
      }
      else {
        contentHTML += "<td class='menu'>" + key + "</td>";
      }
      if (key == "registered_by" || key == "registration_date") {
        contentHTML += "<td>" + value + "</td></tr>";
      }
      else if (key == "description") {
        contentHTML += '<td><textarea class="form-control" id="' + key + 'Input" rows="3">' + value + '</textarea></td></tr>';
        // contentHTML += '<td><input type="text" class="form-control" id="' + key + 'Input" value="' + value + '"</td></tr>';
      }
      else {
        contentHTML += '<td><input type="text" class="form-control" id="' + key + 'Input" value="' + value + '"</td></tr>';
      }

    }
  });
  contentHTML += "</table>";
  if (currentLayer == complaintLayer && user_role == 'superadmin') {
    contentHTML += '<button class="btn btn-danger" style="width:30%" id="delete" onclick="deleteComplaint()">Delete</button>';
    contentHTML += '&nbsp;&nbsp;<button class="btn btn-secondary" style="width:30%" id="edit" onclick="editGeometry()">Edit Geom</button>';
    contentHTML += '&nbsp;&nbsp;<button class="btn btn-warning" style="width:30%" id="submit" onclick="editTable()">Update</button>';
  }
  if (currentLayer == complaintLayer && user_role == 'client' && user_id == user) {
    contentHTML += '&nbsp;&nbsp;<button class="btn btn-secondary" style="width:30%" id="edit" onclick="editGeometry()">Edit Geom</button>';
    contentHTML += '&nbsp;&nbsp;<button class="btn btn-warning" style="width:30%" id="submit" onclick="editTable()">Update</button>';
  }
  content.innerHTML = contentHTML;
  // console.log(contentHTML);
  if (geomType == 'Point') {
    overlay.setPosition(geom.getCoordinates());
  }
  else {
    var extent = geom.getExtent();
    var x = (extent[0] + extent[2]) / 2, y = extent[3] - 0.0001;
    // console.log(x,y);
    overlay.setPosition([x, y]);
  }
  // console.log(currentFeature.getGeometry().getCoordinates());
  map.addOverlay(overlay);
}
function addComplaint() {
  draw = new ol.interaction.Draw({
    source: popupSource,
    type: 'Point',
  });
  map.addInteraction(draw);

  draw.on('drawstart', function (event) {

    source.clear();
    // select.setActive(false);
    // selectedFeatures.clear();
    currentFeature = null;
  }, this);

  draw.on('drawend', function (event) {
    var pointCoordinates = event.feature.getGeometry().getCoordinates();
    let url = "http://localhost:8000/complaint/";
    // const csrftoken = getCookie('csrftoken');
    // console.log(csrftoken);
    console.log(token);
    var complaintDict = {
      'problem_related_utility': $("#problem_related_utility").val(),
      'description': $("#description").val(),
      'service_required_type': $("#service_required_type").val(),
      'long': pointCoordinates[0],
      'lat': pointCoordinates[1]
    }
    console.log(complaintDict);
    $.ajax({
      url: url,
      type: 'POST',
      data: complaintDict,
      headers: {
        Authorization: 'Token ' + token,   //If your header name has spaces or any other char not appropriate
      },
      dataType: 'json',
      success: function (data) {
        clearDraw();
        $("#positiveRequestMessage").text('Sucessful! Thank you for registering the complaint. We\'ll try to solve the problem asap.');
        $('#positiveRequestMessageModal').modal('show');
      },
      error: function (xhr) {
        var errors = xhr.responseJSON.message;
        var errorMessage = '';
        if (typeof errors === 'string') {
          errorMessage = errors;
        }
        else {
          for (error in errors) {
            for (const [key, value] of Object.entries(errors[error])) {
              errorMessage = errorMessage+key+': '+value+"\n";
            }
          }
        }
        // if(xhr.status == 406) {
        //   errorMessage = "You can register a complaint inside KU premises only."
        // }
        // else if (xhr.status == 400) {
        //   errorMessage = "All fields are required!"
        // }
        // else if (xhr.status == 401) {
        //   errorMessage = "You must be logged in to add a complaint!"
        // }
        // else {
        //   errorMessage = "Please try again!"
        // }
        // errorMessage = 'Error - ' + xhr.status + ': ' + xhr.statusText + '\nDetails: ' + errorMessage + xhr.data
        console.log(errorMessage);
        $("#negativeRequestMessage").text(errorMessage);
        $('#negativeRequestMessageModal').modal('show');
      },
    });
    alert('This action is going to alter the data displayed on the map.');
    source.clear();
    map.removeInteraction(draw);
    clearDraw();
    complaintLayer.getSource().refresh();
    // location.reload();
  });
}

function deleteComplaint() {
  var complaintId = currentFeature.getId();
  let url = "http://localhost:8000/complaint/" + complaintId + "/";
  // const csrftoken = getCookie('csrftoken');
  // console.log(csrftoken);
  console.log(token);
  console.log(user_role);
  $.ajax({
    url: url,
    type: 'PATCH',
    // data: {'is_solved': 'True'},
    headers: {
      Authorization: 'Token ' + token,   //If your header name has spaces or any other char not appropriate
    },
    success: function (data) {
      $("#positiveRequestMessage").text('Complaint deleted successful! An email is sent to the user who registered it.');
      $('#positiveRequestMessageModal').modal('show');
    },
    error: function (xhr, status, error) {
      var errorMessage;
      if (xhr.status == 400) {
        errorMessage = "Couln't fetch the data from the database!"
      }
      else {
        errorMessage = "Please try again!"
      }
      errorMessage = 'Error - ' + xhr.status + ': ' + xhr.statusText + '\nDetails: ' + errorMessage
      // alert('Error - ' + errorMessage);
      $("#negativeRequestMessage").text(errorMessage);
      $('#negativeRequestMessageModal').modal('show');
    },
  });
  alert('This action is going to alter the data displayed on the map.');
  source.clear();
  map.removeInteraction(draw);
  clearDraw();
  complaintLayer.getSource().refresh();
  // location.reload();
}



//function to toggle input panel on and off
function showInput() {
  $("#inputPannel").toggle();
  $("#keyWordsOptions").hide();
}

//filter feature based on Service Type like emergency or normal. It lists complaitns features with specified service type.
$("#keyWordsInput1").change(function () {
  clearDraw();
  var inputValue = $("#keyWordsInput1").val();
  var inputValue2 = $("#keyWordsInput2").val();
  // console.log(inputValue);
  let url = "http://localhost:8000/complaint/" + "?service_required_type=" + inputValue + "&problem_related_utility=" + inputValue2;
  complaintLayer.getSource().setUrl(url);
  // alert('This action is going to alter the data displayed on the screem.');
  complaintLayer.getSource().refresh();
  console.log(url);
  $.ajax({
    url: url,
    type: 'GET',
    headers: {
      Authorization: 'Token ' + token,   //If your header name has spaces or any other char not appropriate
    },
    success: function (data) {
      // console.log(data.features[0].properties['problem']);
      var features = data.features
      var id, problem, optionHTML = "";
      for (var i = 0; i < features.length; i++) {
        id = features[i].id;
        description = features[i].properties['description'];
        optionHTML += "<option value='" + id + "'>" + description + "</option>";
      }
      // console.log(optionHTML);
      $("#keyWordsOptions").show();
      $("#keyWordsTable").empty();
      $("#keyWordsTable").append(optionHTML);
    },
    error: function (xhr, status, error) {
      var errorMessage;
      if (xhr.status == 400) {
        errorMessage = "Couln't fetch the data from the database!"
      }
      else {
        errorMessage = "Please try again!"
      }
      errorMessage = 'Error - ' + xhr.status + ': ' + xhr.statusText + '\nDetails: ' + errorMessage
      // alert('Error - ' + errorMessage);
      $("#negativeRequestMessage").text(errorMessage);
      $('#negativeRequestMessageModal').modal('show');
    },
  });
});

$("#keyWordsInput2").change(function () {
  clearDraw();
  var inputValue = $("#keyWordsInput1").val();
  var inputValue2 = $("#keyWordsInput2").val();
  // console.log(inputValue);
  let url = "http://localhost:8000/complaint/" + "?service_required_type=" + inputValue + "&problem_related_utility=" + inputValue2;
  complaintLayer.getSource().setUrl(url);
  // alert('This action is going to alter the data displayed on the screem.');
  complaintLayer.getSource().refresh();
  // console.log(url);
  $.ajax({
    url: url,
    type: 'GET',
    headers: {
      Authorization: 'Token ' + token,   //If your header name has spaces or any other char not appropriate
    },
    success: function (data) {
      // console.log(data.features[0].properties['problem']);
      var features = data.features
      var id, problem, optionHTML = "";
      for (var i = 0; i < features.length; i++) {
        id = features[i].id;
        description = features[i].properties['description'];
        optionHTML += "<option value='" + id + "'>" + description + "</option>";
      }
      // console.log(optionHTML);
      $("#keyWordsOptions").show();
      $("#keyWordsTable").empty();
      $("#keyWordsTable").append(optionHTML);
    },
    error: function (xhr, status, error) {
      var errorMessage;
      if (xhr.status == 400) {
        errorMessage = "Couln't fetch the data from the database!"
      }
      else {
        errorMessage = "Please try again!"
      }
      errorMessage = 'Error - ' + xhr.status + ': ' + xhr.statusText + '\nDetails: ' + errorMessage
      // alert('Error - ' + errorMessage);
      $("#negativeRequestMessage").text(errorMessage);
      $('#negativeRequestMessageModal').modal('show');
    },
  });
});

//based on the selected complaint feature, it shows its attributes on a table.
$("#keyWordsTable").change(function () {
  clearDraw();
  var selectedID = $(this).val()[0];
  // console.log(selectedID);
  currentLayer = complaintLayer;
  currentFeature = currentLayer.getSource().getFeatureById(selectedID);
  displayPopup();
});


// for editing any feature's attributes.
function editTable() {
  var complaintId = currentFeature.getId();
  var newPointCoordinates = currentFeature.getGeometry().getCoordinates();
  // console.log(currentFeature.getGeometry().getCoordinates());
  var complaintDict = {
    'problem_related_utility': $("#problem_related_utilityInput").val(),
    'description': $("#descriptionInput").val(),
    'service_required_type': $("#service_required_typeInput").val(),
    'long': newPointCoordinates[0],
    'lat': newPointCoordinates[1]
  }
  // console.log(complaintDict);
  let url = "http://localhost:8000/complaint/" + complaintId + "/";
  $.ajax({
    url: url,
    type: 'PUT',
    data: complaintDict,
    headers: {
      Authorization: 'Token ' + token,   //If your header name has spaces or any other char not appropriate
    },
    dataType: 'json',
    success: function (data) {
      clearDraw();
      $("#positiveRequestMessage").text('Successful! Thank you for updating the complaint. We\'ll try to solve the problem asap.');
      $('#positiveRequestMessageModal').modal('show');
    },
    error: function (xhr) {
      var errors = xhr.responseJSON.message;
      var errorMessage = '';
      if (typeof errors === 'string') {
        errorMessage = errors;
      }
      else {
        for (error in errors) {
          for (const [key, value] of Object.entries(errors[error])) {
            errorMessage = errorMessage+key+': '+value+"\n";
          }
        }
      }

      // var errorMessage;
      // if (xhr.status == 400) {
      //   errorMessage = "All fields are required!"
      // }
      // else if (xhr.status == 401) {
      //   errorMessage = "You must be logged in to update the complaint!"
      // }
      // else {
      //   errorMessage = "Please try again!"
      // }
      // errorMessage = 'Error - ' + xhr.status + ': ' + xhr.statusText + '\nDetails: ' + errorMessage
      $("#negativeRequestMessage").text(errorMessage);
      $('#negativeRequestMessageModal').modal('show');
    },
  });
  // map.removeInteraction(snap);
  // map.removeInteraction(modify);
  map.removeInteraction(draw);
  clearDraw();
  alert('This action is going to alter the data displayed on the map.');
  complaintLayer.getSource().refresh();
}

resultLayer = new ol.layer.Vector({
  source: popupSource,
  style: new ol.style.Style({
    stroke: new ol.style.Stroke({
      color: "#F601ED",
      width: 3,
    }),
    fill: new ol.style.Fill({
      color: "rgba(0, 0, 255, 0.1)",
    }),
  }),
});
map.addLayer(resultLayer);


// for editing any feature's geometry
var modify, snap;

function editGeometry() {
  overlay.setOffset([0, overlay.getOffset()[1]]);
  modify = new ol.interaction.Modify({
    source: complaintLayer.getSource()
  });
  map.addInteraction(modify);
  snap = new ol.interaction.Snap({
    source: complaintLayer.getSource()
  });
  map.addInteraction(snap);
  modify.on('modifyend', function (event) {
    currentFeature = event.features.item(0);
    // console.log(currentFeature.getId());
    // console.log(currentFeature.getGeometry().getCoordinates());
    //coordinates changed you can make put request now. Making the request only after the attributes have also changed.
  });
}
