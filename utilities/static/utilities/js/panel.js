// function to display sidebar/toolbar
function showSideBar() {
  document.getElementById("printForm").classList.add("left-0");
}

// function to hide sidebar/toolbar
function hideSideBar() {
  document.getElementById("printForm").classList.remove("left-0");
}

// function to display hover of buttons
$(function () {
  $('[data-toggle="tooltip"]').tooltip();
})

//function to control highlight of nav-links on toolbar.
function removeNavLinkHighlight() {
  var navlinks = ['layers-nav-link', 'query-nav-link', 'complaints-nav-link']
  navlinks.forEach(x => {
    document.getElementById(x).classList.remove('color-yellow');
  })
}

//function to control contents baseed on the navlink selection.
function hidePanelContents() {
  var contents = ['layers', 'query-feature', 'complaints']
  contents.forEach(x => {
    document.getElementById(x).classList.add('d-none');
  })
}

//function to display layer toggler menu
function displayToggler() {
  hidePanelContents();
  document.getElementById("layers").classList.remove("d-none");
  removeNavLinkHighlight();
  document.getElementById("layers-nav-link").classList.add("color-yellow");
}

// function to trigger layer toggler menu by defafult
window.onload = displayToggler();


//function to display query feature menu
function displayQueryFeature() {
  hidePanelContents();
  document.getElementById("query-feature").classList.remove("d-none");
  removeNavLinkHighlight();
  document.getElementById("query-nav-link").classList.add("color-yellow");
}

//function to display complaints menu
function displayComplaints() {
  hidePanelContents();
  document.getElementById("complaints").classList.remove("d-none");
  removeNavLinkHighlight();
  document.getElementById("complaints-nav-link").classList.add("color-yellow");
}

// function to return the map extent to this default location
function defaultExtent() {
  map.setView(
    new ol.View({
      center: [85.5381, 27.6185],
      zoom: 18,
      projection: "EPSG:4326",
      multiWorld: true,
    })
  );
}

/*************************************************************************/

// //creating a vector layer to draw upon
// var drawLine;
// var drawPolygon;
// var drawLayer = new ol.layer.Vector({
//   source: new ol.source.Vector(),
// });
// map.addLayer(drawLayer);

// // function to measure distance
// function measureDistance() {
//   drawLine = new ol.interaction.Draw({
//     source: drawLayer.getSource(),
//     type: "LineString",
//   });
//   map.addInteraction(drawLine);

//   drawLine.on("drawend", function (evt) {
//     console.log(evt);
//     var distanceMeasureParam = new SuperMap.MeasureParameters(
//       evt.feature.getGeometry()
//     );
//     new ol.supermap.MeasureService(url, {
//       measureMode: "",
//     }).measureDistance(distanceMeasureParam, function (serviceResult) {
//       console.log(serviceResult);
//       widgets.alert.showAlert(
//         serviceResult.result.distance.toFixed(2) + "m",
//         true
//       );
//     });
//   });
// }

// // function to measure area by drawing polygon
// function measureArea() {
//   drawPolygon = new ol.interaction.Draw({
//     source: drawLayer.getSource(),
//     type: "Polygon",
//   });
//   map.addInteraction(drawPolygon);

//   drawPolygon.on("drawend", function (evt) {
//     console.log(evt);
//     var distanceMeasureParam = new SuperMap.MeasureParameters(
//       evt.feature.getGeometry()
//     );
//     new ol.supermap.MeasureService(url, {
//       measureMode: "",
//     }).measureArea(distanceMeasureParam, function (serviceResult) {
//       console.log(serviceResult);
//       widgets.alert.showAlert(
//         serviceResult.result.area.toFixed(2) + "m²",
//         true
//       );
//     });
//   });
// }

// // function to reset everything drawn and interaction
// function clearDraw() {
//   map.removeInteraction(drawLine);
//   map.removeInteraction(drawPolygon);
//   drawLayer.getSource().clear();
//   map.removeInteraction(drawPoint);
//   resultLayer.getSource().clear();
//   overlay.setPosition(undefined);
//   map.removeOverlay(overlay);
//   currentFeature = null;
//   map.removeInteraction(modify);
//   map.removeInteraction(snap);
//   editLayer.getSource().clear();
// }



// // result layer to display result from query performed
// var drawPoint;
// var vectorSource = new ol.source.Vector({
//   wrapX: false,
// });
// resultLayer = new ol.layer.Vector({
//   source: vectorSource,
//   style: new ol.style.Style({
//     stroke: new ol.style.Stroke({
//       color: "#F601ED",
//       width: 3,
//     }),
//     fill: new ol.style.Fill({
//       color: "rgba(0, 0, 255, 0.1)",
//     }),
//   }),
// });
// map.addLayer(resultLayer);

// var container = document.getElementById("popup"),
//   content = document.getElementById("popup-content");
// var overlay = new ol.Overlay({
//   element: container,
//   autoPan: true,
//   autoPanAnimation: {
//     duration: 250,
//   },
//   offset: [0, -20],
// });

// //creating a dictionary which links the inputs from the user to its associated layers. This is used for achieving clickQuery function
// var dic = {
//   "Buildings": "Buildings@contestdatasource",
//   "Septic Water Tank": "SepticWaterTank@contestdatasource",
//   "Open Space": "OpenSpace@contestdatasource",
//   "Road": "Road@contestdatasource",
//   "Transmission Line": "TransmissionLine@contestdatasource",
//   "Water Pipeline": "",
//   "Water Pipeline": "Pipeline@contestdatasource",
//   "Drainage Line": "DrainageLine@contestdatasource",
//   "Water Point": "WaterPoints@contestdatasource",
//   "Electric Pole": "ElectricPole@contestdatasource",
//   "Drainage Point": "DrainagePoints@contestdatasource",
//   "Temple": "Temple@contestdatasource",
//   "Complaints": "Complaints@contestdatasource",
// };

// var msgDic= {};

// //function to query feature based on a buffer from a selected points and searches upon user selected layer.
// function clickQuery() {
//   drawPoint = new ol.interaction.Draw({
//     source: drawLayer.getSource(),
//     type: "Point",
//   });
//   //console.log(drawPoint);
//   map.addInteraction(drawPoint);

//   drawPoint.on("drawend", function (evt) {
//     clearDraw();
//     var param = new SuperMap.QueryByDistanceParameters({
//       queryParams: {
//         name: dic[$("#featureOf").val()],
//       },
//       distance: 0.00001, // units in degree
//       geometry: evt.feature.values_.geometry,
//     });
//     //console.log(evt.feature);
//     new ol.supermap.QueryService(url).queryByDistance(
//       param,
//       function (serviceResult) {
//         //console.log(serviceResult);
//         var features = new ol.format.GeoJSON().readFeatures(
//           serviceResult.result.recordsets[0].features
//         );
//         vectorSource.addFeatures(features);

//         //add popup to show attributes
//         var feature = features[0];
//         var properties = feature.getProperties();
//         console.log(properties);
//         msgDic["problem"] = properties.Problem;
//         msgDic["service"] = properties.ServiceTyp;
//         msgDic["email"] = properties.Email;
//         msgDic["charge"] = properties.Charges;

//         var contentHTML = '<table class="table table-bordered">';

//         $.each(properties, function (idx, obj) {
//           if (
//             idx != "geometry" &&
//             idx != "SmID" &&
//             idx != "SmUserID" &&
//             idx != "SmArea" &&
//             idx != "SmPerimeter"
//           ) {
//             contentHTML += "<tr>";
//             contentHTML += "<td>" + idx + "</td>";
//             contentHTML +=
//               '<td><input type="text" class="form-control" id="' +
//               idx +
//               'Input" value="' +
//               obj +
//               '" /></td>';
//             contentHTML += "</tr>";
//           }
//         });
//         contentHTML += "</table>";
//         contentHTML +=
//           '<button class="btn btn-primary d-none" style="width:50%" id="edit" onclick="editGeometry()">Edit</button>';
//         contentHTML +=
//           '<button class="btn btn-primary d-none" style="width:50%" id="submit" onclick="editTable()">Submit</button>';
//         if (($("#featureOf").val()) == "Complaints") {
//           contentHTML +=
//           '<br><br><button class="btn btn-primary d-none" style="width:50%" id="edit" onclick="sendEmail()">Send Email</button>';
//         }
//         content.innerHTML = contentHTML;
//         overlay.setPosition(evt.feature.values_.geometry.getCoordinates());
//         map.addOverlay(overlay);
//         currentFeature = feature; // retrieves feature to link in edit.js to edit the feature.
//         viz();
//       }
//     );
//   });
// }

// //function to toggle input panel on and off
// function showInput() {
//   $("#inputPannel").toggle();
//   $("#keyWordsOptions").hide();
// }

// //filter feature based on Service Type like emergency or normal. It lists complaitns features with specified service type.
// $("#keyWordsInput").bind("input propertychange", function () {
//   clearDraw();
//   var inputValue = $("#keyWordsInput").val();
//   var param = new SuperMap.QueryBySQLParameters({
//     queryParams: {
//       name: "Complaints@contestdatasource",
//       attributeFilter: "ServiceTyp LIKE '%" + inputValue + "%'",
//     },
//   });
//   new ol.supermap.QueryService(url).queryBySQL(param, function (serviceResult) {
//     var features = new ol.format.GeoJSON().readFeatures(
//       serviceResult.result.recordsets[0].features
//     );
//     vectorSource.addFeatures(features);
//     $("#keyWordsOptions").show();
//     $("#keyWordsTable").empty();
//     var optionHTML = "";

//     for (var i = 0; i < features.length; i++) {
//       var text = features[i].values_.Problem;
//       var value = features[i].values_.SmID;
//       optionHTML += "<option value='" + value + "'>" + text + "</option>";
//     }
//     $("#keyWordsTable").append(optionHTML);
//   });
// });

// //based on the selected complaint feature, it shows its attributes on a table.
// $("#keyWordsTable").change(function () {
//   clearDraw();
//   var selectedID = $(this).val()[0];
//   var param = new SuperMap.QueryBySQLParameters({
//     queryParams: {
//       name: "Complaints@contestdatasource",
//       attributeFilter: "SmID = " + selectedID + "",
//     },
//   });
//   new ol.supermap.QueryService(url).queryBySQL(param, function (serviceResult) {
//     var features = new ol.format.GeoJSON().readFeatures(
//       serviceResult.result.recordsets[0].features
//     );
//     vectorSource.addFeatures(features);
//     var feature = features[0];
//     currentFeature = feature;
//     console.log(feature);
//     var properties = feature.getProperties();
//     var contentHTML = '<table class="table table-bordered">';
//     //console.log(feature.values_.geometry.getExtent());
//     $.each(properties, function (idx, obj) {
//       if (
//         idx != "geometry" &&
//         idx != "SmID" &&
//         idx != "SmUserID" &&
//         idx != "SmArea" &&
//         idx != "SmPerimeter"
//       ) {
//         contentHTML += "<tr>";
//         contentHTML += "<td>" + idx + "</td>";
//         contentHTML +=
//           '<td><input type="text" class="form-control" id="' +
//           idx +
//           'Input" value="' +
//           obj +
//           '" /></td>';
//         contentHTML += "</tr>";
//       }
//     });
//     contentHTML += "</table>";
//     contentHTML +=
//       '<button class="btn btn-primary d-none" style="width:50%" id="edit" onclick="editGeometry()">Edit</button>';
//     contentHTML +=
//       '<button class="btn btn-primary d-none" style="width:50%" id="submit" onclick="editTable()">Submit</button>';
//       contentHTML +=
//       '<br><br><button class="btn btn-primary d-none" style="width:50%" id="email" onclick="sendEmail()">Send Email</button>';
//     content.innerHTML = contentHTML;

//     // if(localStorage.getItem('userrole') == 'admin')  {
//     //   document.querySelector('#edit').classList.remove('d-none');
//     //   document.querySelector('#edit').classList.remove('d-none');
//     //   document.querySelector('#edit').classList.remove('d-none');
//     // }
//     var featureExtent = feature.values_.geometry.getExtent();
//     //console.log(featureExtent);
//     var centerPoint = [featureExtent[0], featureExtent[1]];
//     overlay.setPosition(centerPoint);
//     map.addOverlay(overlay);
//     var featureView = new ol.View({
//       center: centerPoint,
//       zoom: 19,
//       projection: "EPSG:4326",
//       multiWorld: true,
//     });
//     map.setView(featureView);
//     viz();
//   });
// });

// //function the displays the userrole
// function showUser() {
//   if (typeof Storage !== "undefined") {
//     // Retrieve
//     var user = localStorage.getItem("userrole");
//     if (user == "admin") {
//       alert("Current User: Admin");
//     }
//     else {
//       alert("Current User: Client");
//     }
//   }
//   else {
//     alert("Sorry, your browser does not support Web Storage...");
//   }
// }
