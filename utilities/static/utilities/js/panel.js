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
  var navlinks = ['layers-nav-link', 'query-nav-link', 'complaints-nav-link', 'mylocation-nav-link']
  navlinks.forEach(x => {
    document.getElementById(x).classList.remove('color-yellow');
  })
}

//function to control contents baseed on the navlink selection.
function hidePanelContents() {
  var contents = ['layers', 'query-feature', 'complaints', 'mylocation']
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

function displayMyLocation() {
  hidePanelContents();
  document.getElementById("mylocation").classList.remove("d-none");
  removeNavLinkHighlight();
  document.getElementById("mylocation-nav-link").classList.add("color-yellow");
}
//function to display mylocation menu

// function to return the map extent to this default location
function defaultExtent() {
  map.setView(
    new ol.View({
      center: [85.5361, 27.6185],
      zoom: 18,
      projection: "EPSG:4326",
      multiWorld: true,
    })
  );
}

// feature of dropdown menu item display and selction
 $(".dropdown-menu").on('click', 'li a', function(){
    $("#select-layer").text($(this).text());
    $("#select-layer").val($(this).text());
    clearDraw();
    clickQuery();
 });
