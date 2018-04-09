<?php echo $header; ?>
<div class="container">
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <style type="text/css">
        #page{background-color: #fff5e1;}#header-bottom{display: none;}#header-main{padding-bottom: 0px;border-bottom: solid 1px #e3e3e3;}
      
      </style>
      <div class="loginpage row">
  
  <div class="col-sm-6 leftline">
    <h2>Login</h2>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <div class="form-group">
      <input type="text" name="email" value="" placeholder="Enter Your Email" id="input-email" class="form-control" />
    </div>
    <div class="form-group text-right">
      <input type="password" name="password" value="" placeholder="Password" id="input-password" class="form-control" />
      <a href="<?php echo $forgotten; ?>">Forgot password?</a></div>
    <input type="submit" value="<?php echo $button_login; ?>" id="button-login" data-loading-text="Loading" class="btn btn-primary btn-login" />
  </form>
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

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
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
<?php echo $footer; ?>