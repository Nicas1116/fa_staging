<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> registerpage"><?php echo $content_top; ?>
      <div class="register_content">
       <h1>SIGN UP</h1>
      <div class="row titletab">
          <div class="col-sm-4 step1 active"><span>Step 1</span>Create Account</div>
          <div class="col-sm-5 step2 active"><span>Step 2</span>Personal Information</div>
          <div class="col-sm-3 step3 active"><span>Step 3</span>Complete</div>
      </div>
      <div class="succesmessage">
        <h2><?php echo $heading_title; ?></h2>
      <?php echo $text_message; ?>
      </div>
      <div class="succesmessagebuttons">
        <div class=""><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
    
  </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<style type="text/css">
#content{margin-bottom: 40px; }
        #page{background-color: #fff5e1;}#header-bottom{display: none;}#header-main{padding-bottom: 0px;border-bottom: solid 1px #e3e3e3;}
     </style>
<?php echo $footer; ?>