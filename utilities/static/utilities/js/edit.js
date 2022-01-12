// var currentFeature;
// var dataUrl = "http://localhost:8090/iserver/services/data-contestworkspace/rest/data";  

// // for editing any feature's attributes.
// function editTable() {  
//     $.each(currentFeature.values_, function(idx, obj) {  
//         if (idx != "geometry" && idx != "SmID" && idx != "SmUserID" && idx != "SmArea" && idx !=  
//             "SmPerimeter") {  
//             currentFeature.values_[idx] = $("#" + idx + "Input").val();  
//         }  
//     });  
//     console.log(currentFeature);  

//     var tempList =(dic[$("#featureOf").val()]).split("@");  
//     console.log(tempList[0]);
//     var addFeatureParams = new SuperMap.EditFeaturesParameters({  
//         features: [currentFeature],  
//         dataSourceName: "contestdatasource",  
//         dataSetName: tempList[0],            
//         editType: "update",  
//         returnContent: true  
//     });  
//     var editFeaturesService = new ol.supermap.FeatureService(dataUrl);  
//     editFeaturesService.editFeatures(addFeatureParams, function(serviceResult) {  
//         if (serviceResult.result.succeed) {  
//             alert("Feature Modified successfully!");  
//             drawLayer.getSource().refresh();
//             clearDraw();
//         }  
//     });  
// }  

// var editSource = new ol.source.Vector();  
// let editLayer = new ol.layer.Vector({  
//     source: editSource  
// });  
// var modify, snap;  
// map.addLayer(editLayer);  

// // for editing any feature's geometry
// function editGeometry() {  
//     editLayer.getSource().clear();  
//     drawLayer.getSource().clear();  
//     resultLayer.getSource().clear();  
//     overlay.setOffset([0, overlay.getOffset()[1]-60]);  
      
//     modify = new ol.interaction.Modify({  
//         source: editSource  
//     });  
//     map.addInteraction(modify);  
  
//     snap = new ol.interaction.Snap({  
//         source: editSource  
//     });  
//     map.addInteraction(snap);  
      
//     editSource.addFeatures([currentFeature]);  
      
//     modify.on('modifyend', function(evt) {  
//         currentFeature = evt.features.array_[0];  
//     });  
// } 

// // for storing data on two layers, one for all complaints and one for current complaints
// var datasetList = ["ComplaintsPermanent","Complaints"];

// function drawComplaints(){  
//     var drawComplaints = new ol.interaction.Draw({  
//         source: drawLayer.getSource(),  
//         type: "Point"  
//     });  
//     map.addInteraction(drawComplaints);  
      
//     drawComplaints.on('drawend', function(evt) {  
//         map.removeInteraction(drawComplaints);  
//         var complaintGeometry = evt.feature.getGeometry();  
//         var complaintFeature = new ol.Feature(complaintGeometry);  
          
//         complaintFeature.values_.Problem = $("#problem").val();  
//         complaintFeature.values_.Descriptio = $("#description").val();  
//         complaintFeature.values_.ServiceTyp = $("#servicetype").val();  
//         complaintFeature.values_.Email = $("#email").val(); 

//         var shown = false;
//         //console.log(complaintFeature);  
//         for (i = 0; i < datasetList.length; i++) {
//             var addFeatureParams = new SuperMap.EditFeaturesParameters({  
//                 features: [complaintFeature],  
//                 dataSourceName: "contestdatasource",  
//                 dataSetName: datasetList[i],
//                 editType: "add",  
//                 returnContent: true  
//             });  
//             var editFeaturesService = new ol.supermap.FeatureService(dataUrl);  
//             console.log(editFeaturesService);
//             editFeaturesService.editFeatures(addFeatureParams, function(serviceResult) {              
//                 if (serviceResult.result.succeed) {    
//                     if(!shown) {
//                         alert("Complain Registered Successfully!");
//                         shown = true;
//                     }         
                                            
//                     complaintsLayer.getSource().refresh();                                                                  
//                     clearDraw();                                                                      
//                 }  
//             });              
//         }     
        
        
          
//     });  
// }  

// // for deleting features from complaints layer
// function deleteBuilding(){  
//     var deleteBuilding = new ol.interaction.Draw({  
//         source: drawLayer.getSource(),  
//         type: "Point"  
//     });  
//     map.addInteraction(deleteBuilding);  
      
//     deleteBuilding.on('drawend', function(evt) {  
//         map.removeInteraction(deleteBuilding);  
          
//         var param = new SuperMap.QueryByDistanceParameters({  
//             queryParams: {  
//                 name: "Complaints@contestdatasource"  
//             },  
//             distance: 0.00001, // units in degree
//             geometry: evt.feature.values_.geometry  
//         });  
//         new ol.supermap.QueryService(url).queryByDistance(param, function(serviceResult) {  
//             var features = (new ol.format.GeoJSON()).readFeatures(serviceResult.result.recordsets[0].features);  
//             vectorSource.addFeatures(features);  
//             //parseInt(features[0].values_)  //this is done below
//             console.log(features);  
              
//             var deleteFeatureParams = new SuperMap.EditFeaturesParameters({  
//                 IDs: [parseInt(features[0].values_.SmID)],  
//                 dataSourceName: "contestdatasource",  
//                 dataSetName: "Complaints",
//                 editType: "delete",  
//                 returnContent: true  
//             });  
//             var editFeaturesService = new ol.supermap.FeatureService(dataUrl);  
//             editFeaturesService.editFeatures(deleteFeatureParams, function(serviceResult) {  
//                 if (serviceResult.result && serviceResult.result.succeed) {                 
//                     alert("Solved Problem Deleted Succesfully!");  
//                     complaintsLayer.getSource().refresh();  
//                     clearDraw();  
//                 }  
//             });  
              
          
//         });  
//     });  
      
// }  
