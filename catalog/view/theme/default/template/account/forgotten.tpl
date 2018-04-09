<?php echo $header; ?>
<div class="container">

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
        .form-horizontal .control-label{text-align: left;}
         #content h1{font-size: 28px;line-height: 34px;color:#000;font-weight: bold;}
         #content p{font-size: 15px;line-height: 20px;color:#000;font-weight: bold;margin-top: 40px;}
        #content h1,#content p{text-align: center;}
        .form-horizontal{width: 500px;margin:0 auto;}
        .form-horizontal input{border-radius: 10px;padding: 10px;border: solid 2px #4a90e2;display: block;height: auto;margin-bottom: 10px;}
        .form-horizontal label {font-size: 15px;line-height: 22px;font-weight: normal;text-transform: capitalize;}
        .form-horizontal .btn.btn-primary {background: #ff8d00;color: #fff;font-size: 14px;line-height: 1;font-weight: bold;border-radius: 0px;display: block;width: 100%;padding: 10px 20px;margin-bottom: 10px}
        .form-horizontal .btn.btn-default{background:transparent;border:none;font-size: 15px;line-height: 22px;color:#4A90E2;text-align: center;display: block;}
      </style>
      <h1>Forgot password?</h1>
      <p>Enter the email you use to sign in and we will send<br/>
you an email ro reset your password.</p>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <div class="form-group required">
            <label class="col-sm-12 control-label" for="input-email">EMAIL</label>
            <div class="col-sm-12">
              <input type="text" name="email" value="<?php echo $email; ?>" placeholder="Enter Your Email" id="input-email" class="form-control" />
            </div>
          </div>
        </fieldset>
        <div class="buttons clearfix">
          
          <div class="">
            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
          </div>
          <div class=""><a href="<?php echo $back; ?>" class="btn btn-default">CANCEL</a></div>
        </div>
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>