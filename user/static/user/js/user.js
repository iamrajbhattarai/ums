function forgotPassword() {
    username_or_email = $('#username').val();
    console.log(username_or_email);
    let url = "http://localhost:8000/user/forgot-password-email-check/?username_or_email="+username_or_email
    console.log(url);
    $.ajax({
        url: url,
        type: 'GET',
        // data: complaintDict,
        dataType: 'json',
        success: function () {
          $("#requestMessage").text('A password reset email is sent to your email!');
          $('#requestMessageModal').modal('show');
        },
        error: function (xhr, status, error) {
          var errorMessage;
        //   if (xhr.status == 400) {
        //     errorMessage = "All fields are required!"
        //   }
        //   else if (xhr.status == 401) {
        //     errorMessage = "You must be logged in to add a complaint!"
        //   }
        //   else {
        //     errorMessage = "Please try again!"
        //   }
          errorMessage = 'Error - ' + xhr.status + ': ' + xhr.statusText + '\nDetails: ' + errorMessage
          $("#requestMessage").text(errorMessage);
          $('#requestMessageModal').modal('show');
        },
      });
 }
