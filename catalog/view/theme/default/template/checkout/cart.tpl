<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($attention) { ?>
  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
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
      
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="row">
          <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 ">
            <h2>Delivery Options</h2>
      <ul class="deliverymethods row">
        <li><input type="radio" name="deliverymethod" class="radio_dm" checked="checked"><a class="btnsingledelivery active"><strong>Single Address Delivery</strong>
          <span>Available with purchase of 1 or more products for 1 delivery address only</span></a></li>
        <?php 
          $disabletext ="";
        if(sizeof($products)>1){
          
        }else{
          if(sizeof($products)>0){
            if($products[0]["quantity"]<=1){
              $disabletext="disabled";
            }
          }
        }
      ?>
        <li><input type="radio" name="deliverymethod" class="radio_dm" <?php echo $disabletext ?>><a class="btnmultipledelivery <?php echo $disabletext ?>"><strong>Multiple Address Delivery</strong>
          <span>Only available with purchase of 1 product in multiple quantities</span></a></li>
      </ul>
      <h2>My Bag <span class="itemsbag"><?php echo sizeof($products) ?> items</span></h2>
          <div class="cart_products_list">
              <?php foreach ($products as $product) { ?>
              <?php
                    //echo json_encode($product);
                   ?>
              <div class="row cart-id-<?php echo $product['cart_id'] ?>">
                <div class="col-xs-1 text-center"><button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></button></div>
                <div class="col-xs-2 text-left"><?php if ($product['thumb']) { ?>
                  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                  <?php } ?></div>
                <div class="col-xs-4 text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                  <?php if (!$product['stock']) { ?>
                  <span class="text-danger">***</span>
                  <?php } ?>
                  <?php if ($product['option']) { ?>
                  <?php foreach ($product['option'] as $option) { ?>
                  <br/><small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                  <?php } ?>
                  <?php } ?>
                  <?php if ($product['reward']) { ?>
                  <br />
                  <small><?php echo $product['reward']; ?></small>
                  <?php } ?>
                  <?php if ($product['recurring']) { ?>
                  <br />
                  <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                  <?php } ?></div>
                  <div class="col-xs-2 text-left">Price<br/><?php echo $product['price']; ?></div>
               <div class="col-xs-1 text-left"><div class="boxq"><a class="btn_minproucts" onclick="cart.update('<?php echo $product['cart_id']; ?>',<?php echo $product['quantity']-1; ?>);">-</a><span><?php echo $product['quantity']; ?></span><a class="btn_addproucts" onclick="cart.update('<?php echo $product['cart_id']; ?>',<?php echo $product['quantity']+1; ?>);">+</a></div></div>
                  
                <div class="col-xs-2 text-left"><div class="subtotal_box">Subtotal<br/><p class="oriprice"><?php echo str_replace("RM","",$product['total']); ?></p><p class="item_subtotalprice"><?php echo $product['total']; ?></p></div></div>
                <p class="clearfix"></p>
                 <div class="col-xs-12 text-left">
                  <?php 
                  $fullproduct_options = $product["fullproduct_options"];
                  $product_options = $product["option"];
                  foreach ($fullproduct_options as $fullproduct_option) {
                      if($fullproduct_option["name"] == "Send As Gift"){
                        $fullproduct_option_name = $fullproduct_option;
                      }
                      if($fullproduct_option["name"] == "Giftbox Message"){
                        $fullproduct_option_giftboxmessage = $fullproduct_option;
                      }
                  }
                  $ison = false;
                  $hasmessage = false;
                   $option_all =array();
                   $mkinga=array();
                   $mkingb=array();
                   foreach ($product_options as $option) {
                      $dontsave =true;
                      if($option["name"] == "Send As Gift"){
                        $ison = true;
                         $dontsave=false;
                        $product_option_name = $option;
                      }
                      if($option["name"] == "Giftbox Message"){
                        $hasmessage=true;
                         $dontsave=false;
                        $product_option_giftboxmessage = $option;
                      }
                     if( $dontsave){
                      $mkingb[$option["product_option_id"]] = $option["product_option_value_id"];
                    }else{
                       $mkinga[$option["product_option_id"]] = $option["product_option_value_id"];
                    }
                  }
                  foreach ($fullproduct_options as $fullproduct_option) {
                      if($fullproduct_option["name"] == "Send As Gift"){
                        $mkinga[$fullproduct_option["id"]] = $fullproduct_option["value"];
                      }
                      if($fullproduct_option["name"] == "Giftbox Message"){
                        $mkinga[$fullproduct_option["id"]] = "";
                      }

                  }
                  ?>
                  <div class="allgiftbox"><label><input <?php if($ison){echo "checked='checked'";} ?> class="checkbox_sendasgift checkbox_sendasgift-<?php echo $product["cart_id"]  ?>" type="checkbox" /> Send as gift</label>
                  <div class="sendgiftbox" <?php if($ison){echo "style='display:block;'";} ?>>
                    <label><input <?php if($ison){echo "checked='checked'";} ?> class="checkbox_giftboxwithmessage" type="checkbox" /> Gift card with message Rm 3</label>
                    <textarea placeholder="Insert your message here" class="giftboxmessage giftboxmessage-<?php echo $product['cart_id'] ?>" name="giftboxname-<?php echo $product['cart_id'] ?>" ><?php if($hasmessage){echo $product_option_giftboxmessage["value"];} ?></textarea>
                    <span>Not more than 120 characters</span>
                  </div>
                  <script type="text/javascript">
                      $(document).ready(function(){
                        $(".checkbox_sendasgift-<?php echo $product["cart_id"]  ?>").click(function(){
                          if($(this).is(':checked')==true){
                            var a = '<?php echo json_encode($mkinga); ?>';
                            cart.updateoption("<?php echo $product["cart_id"]  ?>",a);   
                         }else{
                            var a = '<?php echo json_encode($mkingb); ?>';
                            cart.updateoption("<?php echo $product["cart_id"]  ?>",a);   
                         }
                        });
                        $(".giftboxmessage-<?php echo $product['cart_id'] ?>").change(function(i,a){
                          clearTimeout(clearTimeoutId);
                          clearTimeoutId = setTimeout(function(){
                            var a = {"<?php echo $fullproduct_option_name["id"]; ?>":"<?php echo $fullproduct_option_name["value"]; ?>","<?php echo $fullproduct_option_giftboxmessage["id"]; ?>":$(".giftboxmessage-<?php echo $product['cart_id'] ?>").val()};
                             var a = '<?php echo json_encode($mkinga); ?>';
                             var a = JSON.parse(a);
                             a["<?php echo $fullproduct_option_giftboxmessage["id"]; ?>"] = $(".giftboxmessage-<?php echo $product['cart_id'] ?>").val();
                            var a_text = JSON.stringify(a);
                            cart.updateoptiontext("<?php echo $product["cart_id"]  ?>",a_text);  
                          },500);
                        })
                      })
                  </script>
                </div>
                 </div>
              </div>
              <?php } ?>
              <?php foreach ($vouchers as $voucher) { ?>
              <div class="row">
                <div></div>
                <div class="text-left"><?php echo $voucher['description']; ?></div>
                <div class="text-left"></div>
                <div class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                    <span class="input-group-btn">
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="voucher.remove('<?php echo $voucher['key']; ?>');"><i class="fa fa-times-circle"></i></button>
                    </span></div></div>
                <div class="text-right"><?php echo $voucher['amount']; ?></div>
                <div class="text-right"><?php echo $voucher['amount']; ?></div>
              </div>
              <?php } ?>
            </div>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 ">
        <div id="cart_ordersummary">
        <h2>Order Summary</h2>
      
      <div class="row">
        <div class="col-sm-6">
          <p class="text-left"><strong><?php echo $totals[0]['title']; ?>:</strong></p>
        </div>
        <div class="col-sm-6">
          <p class="text-right"><strong class="subtotalprice"><?php echo $totals[0]['text']; ?></strong></p>
        </div>
      </div>
      <div class="row cartcoupon">
        <div class="col-sm-12">
        <?php foreach ($modules as $module) { ?>
          <?php echo $module; ?>
        <?php } ?>
         </div>
      </div>

      <div class="row total">
        <div class="col-sm-6">
          <p class="text-left"><strong><?php echo $totals[1]['title']; ?>:</strong></p>
        </div>
        <div class="col-sm-6">
          <p class="text-right"><strong class="totalprice"><?php echo $totals[1]['text']; ?></strong></p>
        </div>
      </div>
      <p class="small">GST included, where applicable</p>
      <div><a href="javascript:checkout();void(0);" class="btn btn-primary btn-checkout"><?php echo $button_checkout; ?></a></div>
    </div>
      </div>
      </form>
    </div>

  </div>
</div>
<script type="text/javascript">
  var clearTimeoutId;
  function checkout(){
      if( $(".btnsingledelivery").hasClass("active")){
        window.top.location = '<?php echo $checkout; ?>';
      }else{
         window.top.location = '<?php echo $multiplecheckout; ?>';
      }
      
  }

  $(document).ready(function(){
    $(".btnsingledelivery").click(function(){
      $(".radio_dm").prop("checked",false)
      $(this).parent().find("input").prop("checked",true);
      $(".btnsingledelivery,.btnmultipledelivery").removeClass("active");
      $(this).addClass("active");
      $(".checkbox_sendasgift").removeAttr("disabled")
      $(".checkbox_sendasgift").prop("checked",false);
    });
    $(".btnmultipledelivery").click(function(){
      if(!$(this).hasClass("disabled")){
      $(".radio_dm").prop("checked",false)
      $(this).parent().find("input").prop("checked",true);
      $(".btnsingledelivery,.btnmultipledelivery").removeClass("active");
      $(this).addClass("active");
      $(".checkbox_sendasgift").attr("disabled","disabled")
      $(".checkbox_sendasgift").prop("checked",false);
      $(".sendgiftbox").hide();
      }
    });
    
    $(".checkbox_giftboxwithmessage")
    $(".checkbox_sendasgift").bind("change",function(){
      if($(this).is(':checked')==true){
        $(this).parent().parent().find(".sendgiftbox").show();
      }else{
        $(this).parent().parent().find(".sendgiftbox").hide();
      }
    })
    $(".checkbox_giftboxwithmessage").bind("change",function(){
      var addmoney = 0;
      if($(this).is(':checked')==true){
        addmoney = 3
      }
      var theproductrow = ($(this).parent().parent().parent().parent().parent());
      var oriprice = parseFloat(theproductrow.find(".oriprice").html());
      var subtotalprice = oriprice+addmoney;
      theproductrow.find(".item_subtotalprice").html("RM"+subtotalprice.toFixed(2));
      calculateTotalPrice();
    })
  })
  function calculateTotalPrice()
  {
    var totalPrice = 0;
    $.each($(".cart_products_list .row"),function(i,a){
      totalPrice += parseFloat($(a).find(".item_subtotalprice").html().replace("RM",""))
    })
    $("#cart_ordersummary .subtotalprice").html("RM"+totalPrice.toFixed(2));
    $("#cart_ordersummary .totalprice").html("RM"+totalPrice.toFixed(2));
  }
</script>
<?php echo $footer; ?>
