<?php echo $header; ?>
<div class="container">
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="addresspage <?php echo $class; ?>"><?php echo $content_top; ?>
      <h2>Adress Book</h2>
      <div class="bline"></div>
      <?php if ($addresses) { ?>

        <div class="addresses row">
          <?php foreach ($addresses as $result) { //echo json_encode($result); ?> 
          <div class="col-sm-4">
              <div class="orangebox">
         <p><?php echo $result['address']; ?></p>
         <div class="buttons">
         <a href="<?php echo $result['update']; ?>" class="btn btn-info"><?php echo $button_edit; ?></a> &nbsp;|&nbsp; <a href="<?php echo $result['delete']; ?>" class="btn btn-danger"><?php echo $button_delete; ?></a>
       </div>
       <div class="radio">
          <input type="radio" name="primaryaddress" value="<?php echo $result['address_id']; ?>" <?php if($result["is_default"]){echo "checked='checked'";}?>/>Primary Address
       </div>
       </div>
        </div>
          <?php } ?>
        </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
        <div class="pull-right"><a href="<?php echo $add; ?>" class="btn btn-primary"><?php echo $button_new_address; ?></a></div>
      </div>
      <script type="text/javascript">
        $(document).ready(function () {
          $("input[name=primaryaddress]").change(function(){
            //alert($("input[name=primaryaddress]:checked").attr("value"));
            $.ajax({
              url: 'index.php?route=account/address/updateDefault',
              type: 'post',
              data: {'address_id':$("input[name=primaryaddress]:checked").attr("value")},
              dataType: 'json',
              beforeSend: function() {
                
              },
              complete: function() {
                  
              },
              success: function(json) {
                  
              },
              error: function(xhr, ajaxOptions, thrownError) {
                  alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
              }
          });
          })
        })
      </script>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<style type="text/css">#header-bottom{display: none;}#header-main{padding-bottom: 0px;border-bottom: solid 1px #e3e3e3;}</style>
<?php echo $footer; ?>