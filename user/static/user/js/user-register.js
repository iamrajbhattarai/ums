function createUser() {
    registrationDict = {
      'full_name': $('#signupfullname').val(),
      'gender': $("input[name='gender']:checked").val(),
      'username': $('#signupusername').val(),
      'password1': $('#signuppassword1').val(),
      'password2': $('#signuppassword2').val(),
      'designation': $("input[name='designation']:checked").val(),
      'department': $('#signupdepartment').val(),
      'email': $('#signupemail').val(),
      'contact': $('#signupcontact').val(),
    }
    // console.log(registrationDict);
    let url = "http://localhost:8000/user/users/"
    $.ajax({
        url: url,
        type: 'POST',
        data: registrationDict,
        dataType: 'json',
        success: function () {
          $("#positiveuserrequestMessage").text('User Successfully Registered. To activate your account, click in the link sent to your email.');
          $('#positiveuserrequestMessageModal').modal('show');
        },
        error: function (xhr, status, error) {
          var errorMessage;
          if (xhr.status == 400) {
            errorMessage = "Error! Account Not Created. Please try again."
          }
          else {
            errorMessage = "Error! Please try again!"
          }
          errorMessage = 'Error - ' + xhr.status + ': ' + xhr.statusText + '\nDetails: ' +errorMessage;
          $("#negativeuserrequestMessage").text(errorMessage);
          $('#negativeuserrequestMessageModal').modal('show');
        },
      });
 }
