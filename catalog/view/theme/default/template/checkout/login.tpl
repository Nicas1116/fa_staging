<div class="loginpage row">
  
  <div class="col-sm-6 leftline">
    <h2>Login</h2>
    <div class="form-group">
      <input type="text" name="email" value="" placeholder="Enter Your Email" id="input-email" class="form-control" />
    </div>
    <div class="form-group text-right">
      <input type="password" name="password" value="" placeholder="Password" id="input-password" class="form-control" />
      <a href="<?php echo $forgotten; ?>">Forgot password?</a></div>
    <input type="button" value="<?php echo $button_login; ?>" id="button-login" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-login" />
     <p class="logintext_social">or connect with your social media account</p>
    <div class="row">
      <div class="col-sm-6"><a class="button-facebook"><i class="fa fa-facebook"></i>Facebook</a></div>
      <div class="col-sm-6">
        <div class="g-signin2" data-onsuccess="onSignIn"></div>
      </div>
    
    </div>
  </div>
  <div class="col-sm-6 rightline">
    <h2>New customer?</h2>
    <input type="hidden" name="account" value="register" checked="checked" />
    
    <a href="<?php echo $signup; ?>" class="btn btn-primary btn-register" >SIGN UP NOW</a>
    <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi </p>
  </div>
</div>

<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript"></script>
<script>
  var gotclick = false;
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1774996859228146',
      cookie     : true,
      xfbml      : true,
      version    : 'v2.12'
    });
      
    FB.AppEvents.logPageView();   
      
  };
 function onSignIn(googleUser) {
  if(gotclick){
    var profile = googleUser.getBasicProfile();
    var gu = {id:profile.getId(), name:profile.getName(), email:profile.getEmail()};
    logingoogle(gu);
    gotclick=false;
  }
}
  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
   $(document).ready(function(){
        $(".g-signin2").click(function(){
          gotclick=true;
        })
        $(".button-facebook").click(function(){
          FB.login(function(response){
              if (response.status === 'connected') {
                 FB.api('/me',{fields: 'email,first_name,last_name'}, function(response) {
           
                      loginfacebook(response);
                    });
              } else {
                // The person is not logged into this app or we are unable to tell. 
              }
          }, {scope: 'public_profile,email'});
        })
    })

   function logingoogle(response){
      $.ajax({
        url: 'index.php?route=account/login/loginwithgoogle',
        type: 'post',
        data: response,
        dataType: 'json',
        beforeSend: function() {
          
        },
        complete: function() {
            
        },
        success: function(json) {
            if (json['redirect']) {
                location = json['redirect'];
            } 
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
   }

   function loginfacebook(response){
      $.ajax({
        url: 'index.php?route=account/login/loginwithfacebook',
        type: 'post',
        data: response,
        dataType: 'json',
        beforeSend: function() {
          
        },
        complete: function() {
            
        },
        success: function(json) {
            if (json['redirect']) {
                location = json['redirect'];
            } 
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
   }
</script>