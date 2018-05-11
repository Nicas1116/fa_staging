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
      <div class="category_image_small" style="padding:0px;background-image: none;"><img src="/fa/staging/image/banner_addressbook.png"/></div>
      <?php if ($addresses) { ?>

        <div class="addresses row">
          <?php $dasd=0;foreach ($addresses as $result) { //echo json_encode($result); ?> 
          <div class="col-sm-4">
              <div class="orangebox <?php if($result["is_default"]){echo "whitebox";}$dasd++;?>">
         <p><?php echo $result['address']; ?></p>
         <div class="buttons">
         <a href="<?php echo $result['update']; ?>" class="btn btn-info"><?php echo $button_edit; ?></a> &nbsp;|&nbsp; <a href="<?php echo $result['delete']; ?>" class="btn btn-danger"><?php echo $button_delete; ?></a>
       </div>
       <div class="radio">
          <label><input type="radio" name="primaryaddress" value="<?php echo $result['address_id']; ?>" class="form-control" <?php if($result["is_default"]){echo "checked='checked'";}?>/>Primary Address</label>
       </div>
       </div>
        </div>
          <?php } ?>
        </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
      
        <div class="pull-left"><a href="<?php echo $add; ?>" class="btn btn-primary"><?php echo $button_new_address; ?></a></div>
      </div>
      <script type="text/javascript">
        $(window).load(function(){
          var sheight = 0;
          $.each($(".addresses .orangebox"),function(i,a){
            if($(a).height()>sheight){
              sheight = $(a).height();
            }
          })
          $(".addresses .orangebox").height(sheight);
        })
        $(document).ready(function () {

          $("input[name=primaryaddress]").change(function(){
            //alert($("input[name=primaryaddress]:checked").attr("value"));
            $(".addresses .orangebox").removeClass("whitebox");
            $(this).parent().parent().parent().addClass("whitebox")
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
<style type="text/css">#content{margin-bottom: 20px;}#header-bottom{display: none;}#header-main{padding-bottom: 0px;border-bottom: solid 1px #e3e3e3;}</style>
<?php echo $footer; ?>