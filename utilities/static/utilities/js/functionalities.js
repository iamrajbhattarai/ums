//hidining and uniding the tools for admin/client functionalities
window.onload = viz();

function viz() {
  if (typeof Storage !== "undefined") {
    // Retrieve
    var user = localStorage.getItem("userrole");
    if (user == "admin" ) {
      console.log(1);
      var divs = document.querySelectorAll(".btn-primary"),
        i;
        console.log(divs);
      for (i = 0; i < divs.length; ++i) {
        //console.log(divs[i]);
        divs[i].classList.remove("d-none");
      }
    }
  } else {
    alert("Sorry, your browser does not support Web Storage...");
  }
}

//sending email to the clients
function sendEmail(){
  url = 'mailto:'+ msgDic["email"] + '?subject=Service Bill&body=' + 'Dear Sir/Madam,\n You recently requested a ' + msgDic["service"] + ' for problem ' + msgDic["problem"] + '. So, the charges you need to pay as per the service is ' + msgDic["charge"] + '.   \n\nRegards,\n Grande Villa Housing Management';
  window.open(url);
}
