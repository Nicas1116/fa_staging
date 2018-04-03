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
  </div>
  <div class="col-sm-6 rightline">
    <h2>New customer?</h2>
    <input type="hidden" name="account" value="register" checked="checked" />
    
    <a href="<?php echo $signup; ?>" class="btn btn-primary btn-register" >SIGN UP NOW</a>
    <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi </p>
  </div>
</div>
