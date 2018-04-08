<style type="text/css">
  .receiptbox{margin:30px 0;}
</style>
<form class="form-horizontal">
  <h2>Delivery Infomation</h2>
  <?php for ($i=0 ;$i<sizeof($a_products);$i++) { ?>
  <div class="receiptbox" id="recipent<?php echo ($i+1); ?>">
    <p class="receiptbtext">Recipient #<?php echo ($i+1); ?></p>
    <input type="hidden" name="recipent" value="<?php echo ($i+1); ?>">
   <div class="row pa_address_p">
  <div class="radio">
    <label>
      <input type="radio" name="shipping_address<?php echo ($i+1); ?>" class="shipping_address" value="new" checked="checked" />New Address</label>
  </div>
  <div class="radio">
    <label>
      <input type="radio" name="shipping_address<?php echo ($i+1); ?>" class="shipping_address" value="existing" <?php echo ($addresses) ? '' : 'disabled'; ?> />From Address Book</label>
  </div>
   </div>
  <div id="shipping-existing" style="display: none;">
    <?php foreach ($addresses as $address) { ?>
      <?php if ($address['address_id'] == $address_id) { ?>
       <?php  $address_selected = $address; ?>
       <?php } ?>
      <?php } ?>


    <div class="address_box address_selected">
      <input type="hidden" name="address_id" class="form-control" value=" <?php echo $address_selected["address_id"]; ?>" >
      <p><b ><?php echo $address_selected["firstname"]." ".$address_selected["lastname"]; ?></b>
          <?php echo $address_selected["company"]; ?><br/>
          <?php echo $address_selected["address_1"]; ?><br/>
          <?php echo $address_selected["address_2"]." ".$address_selected["postcode"] ; ?><br/>
          <?php echo $address_selected["custom_field"][1]; ?><br/>
      </p>
      <a class="btn_openpagefix">Change</a>
    </div>
  </div>
  <br />
  <div id="shipping-new">
    <div class="form-group required">
      <div class="col-sm-6">
        <input type="text" name="firstname" value="" placeholder="<?php echo $entry_firstname; ?>" id="input-shipping-firstname" class="form-control" />
      </div>
       <div class="col-sm-6">
        <input type="text" name="lastname" value="" placeholder="<?php echo $entry_lastname; ?>" id="input-shipping-lastname" class="form-control" />
      </div>
    </div>

    <div class="form-group">
      <div class="col-sm-12">
        <input type="text" name="company" value="" placeholder="<?php echo $entry_company; ?>" id="input-shipping-company" class="form-control" />
      </div>
    </div>
    <div class="form-group required">
      <div class="col-sm-3">
        <input type="text" name="address_1" value="" placeholder="<?php echo $entry_address_1; ?>" id="input-shipping-address-1" class="form-control" />
        
      </div>
      <div class="col-sm-9">
      <input type="text" name="address_2" value="" placeholder="<?php echo $entry_address_2; ?>" id="input-shipping-address-2" class="form-control" />
    </div>
    </div>
    <div class="form-group required">
      <div class="col-sm-4">
        <input type="text" name="city" value="" placeholder="<?php echo $entry_city; ?>" id="input-shipping-city" class="form-control" />
      </div>
      <div class="col-sm-4">
        <select name="zone_id" id="input-shipping-zone" class="form-control">
        </select>
      </div>
       <div class="col-sm-4">
        <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-shipping-postcode" class="ship_postcode form-control" />
      </div>
    </div>
    <div class="form-group required" style="display: none;">
      <label class="col-sm-2 control-label" for="input-shipping-country"><?php echo $entry_country; ?></label>
      <div class="col-sm-10">
        <select name="country_id" id="input-shipping-country" class="form-control">
          <option value=""><?php echo $text_select; ?></option>
          <?php foreach ($countries as $country) { ?>
          <?php if ($country['country_id'] == $country_id) { ?>
          <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
          <?php } else { ?>
          <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
          <?php } ?>
          <?php } ?>
        </select>
      </div>
    </div>
    <div class="form-group required custom-field">
      <div class="col-sm-12">
        <input type="text" name="custom_field[1]" value="" placeholder="Contact No" id="input-shipping-custom-field1" class="form-control">
      </div>
    </div>
  </div>
  <?php
       foreach ($a_products[$i]["fullproduct_options"] as $option) {
          if($option["name"] == "Send As Gift"){ ?>
            <input type="hidden" name="" class="sendasgift" value="<?php echo $option["product_option_id"]; ?>">
             <?php foreach ($option["product_option_value"] as $option2) {
                if($option2["name"] == "Gift card with message"){
                  $theprice = number_format($option2["price"], 2, '.', ',');
                  $thevalueid = $option2["product_option_value_id"];
                  $boption = $option["product_option_id"];
                } ?>
              <?php };
          }else if($option["name"] == "Giftbox Message"){
             $giftbox_message_option = $option["product_option_id"];
          }
       }
    
         $coption=null;
       foreach ($a_products[$i]["option"] as $option) {
        if($option["name"] == "Send As Gift"){
        $coption = $option;
       }
     }
       ?>
  <div class="shipping_options <?php if( $thevalueid!=$coption["product_option_value_id"]){ echo "disabled";} ?>">
<div class="form-group">
    <div class="col-sm-12">
      <h2>Order Information</h2>
      <?php //echo json_encode($a_products[$i]["fullproduct_options"]); ?>
      
      <label><input type="checkbox" name="giftcardmessage_check" class="giftcardmessage_check form-control"  <?php if( $thevalueid==$coption["product_option_value_id"]){ echo "checked='checked'";} ?>>Gift card with message Rm<?php echo $theprice; ?></label>
      <textarea name="giftcardmessage" placeholder="Insert your message here" rows="8" class="giftcardmessage" class="form-control" <?php if( $thevalueid!=$coption["product_option_value_id"]){ echo "disabled";} ?>></textarea>
     <script type="text/javascript">
       $(document).ready(function(){
          $("#recipent<?php echo ($i+1); ?> .giftcardmessage_check").change(function(){
           if($(this).is(':checked')==true){
            $(this).parent().parent().parent().parent().removeClass("disabled");
             $(this).parent().parent().parent().parent().find(".giftcardmessage").removeAttr("disabled");
              $.ajax({
                url: 'index.php?route=checkout/multiple_shipping_address/updateproductoption',
                type: 'post',
                dataType: 'html',
                data: {"productno":<?php echo $i; ?>,"key":<?php echo $boption; ?>,"value":<?php echo $thevalueid; ?>},
                success: function(html) {
                   getordersummary();
                }
            });
           }else{
            $(this).parent().parent().parent().parent().addClass("disabled");
             $(this).parent().parent().parent().parent().find(".giftcardmessage").attr("disabled","disabled");
            $.ajax({
                url: 'index.php?route=checkout/multiple_shipping_address/updateproductoption',
                type: 'post',
                dataType: 'html',
                data: {"productno":<?php echo $i; ?>,"key":<?php echo $boption; ?>,"value":""},
                success: function(html) {
                     $("#recipent<?php echo ($i+1); ?> .giftcardmessage").val("");
                    $.ajax({
                      url: 'index.php?route=checkout/multiple_shipping_address/updateproductoption',
                      type: 'post',
                      dataType: 'html',
                      data: {"productno":<?php echo $i; ?>,"key":<?php echo $giftbox_message_option; ?>,"value":""},
                      success: function(html) {
                          getordersummary();
                      }
                  });
                }
            });
           } 
       });
          $("#recipent<?php echo ($i+1); ?> .giftcardmessage").change(function(){
             $.ajax({
                url: 'index.php?route=checkout/multiple_shipping_address/updateproductoption',
                type: 'post',
                dataType: 'html',
                data: {"productno":<?php echo $i; ?>,"key":<?php echo $giftbox_message_option; ?>,"value":$(this).val()},
                success: function(html) {
                    getordersummary();
                }
            });
          });
           $("#recipent<?php echo ($i+1); ?> .ship_postcode").change(function(){
            postcodechange(<?php echo ($i+1); ?>);
          });
       });  
     </script>
    </div>
  </div>
</div>
 <div id="shipping-method">
   <div class="form-group">
    <div class="col-sm-12">
      <textarea name="comment" placeholder="Delivery Remark (optional) eg. delivery timing" rows="8" class="form-control"></textarea>
    </div>
  </div>
<input type="hidden" name="shipping_method" class="ishipping_method" value="" />
<div class="row"> <div class="col-xs-12">
  <p>Fill in the delivery address above to get the delivery fee</p>
   </div></div>
    <div class="overall_shippingcost row" style="display: none;">
      <input type="hidden" name="can_shipping" class="can_shipping" value="false">
        <div class="col-xs-6">Delivery Fee</div>
        <div class="col-xs-6 text-right shipping_cost"></div>
    </div>
     <div class="overall_shippingcost_text row" style="display: block;">
        <div class="col-xs-12">Not Avaiable for Delivery</div>
     </div>
     <div class="row">
        <div class="col-xs-12"><a href="#" class="opendeliverycharge"><img class="button_icon" src="/fa/staging/image/others/delivery.png"/>Delivery Charges</a></div>
     </div>
</div>
 </div>
   <?php } ?>
     <div class="buttons clearfix">
    <div class="pull-right">
      <input type="button" value="<?php echo $button_continue; ?>" id="button-shipping-address" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
    </div>
  </div>
 </form>
 <?php if($addresses){ ?>
<div id="shipping_addresschange" class="pagefix" style="display: none;">
  <div class="pagefix_insidebox">
     
      <div class="row"> <h1 class="pull-left">Address Book (<?php echo sizeof($addresses); ?>)</h1><p class="pull-right"><input type="text" name="searchbox" clsas="d_searchbox" placeholder="Search.."></p></div>
      <a class="btn_closepagefix">Close <span><i class="fa fa-close"></i></span></a>
      <div class="address_box_list">
        <?php foreach ($addresses as $address) { ?>
          <a data-id="<?php echo $address["address_id"]; ?>" class="address_box ">
          <span><b ><?php echo $address["firstname"]." ".$address["lastname"]; ?></b>
              <?php echo $address["company"]; ?><br/>
              <?php echo $address["address_1"]; ?><br/>
              <?php echo $address["address_2"]." ".$address["postcode"] ; ?><br/>
              <?php echo $address["custom_field"][1]; ?><br/>
          </span>
        </a>
        <?php } ?>
      </div>
  </div>
</div>
<script type="text/javascript">
  var textNo 
  $(document).ready(function(){

    $("#shipping_addresschange .btn_closepagefix").click(function(){
      $("#shipping_addresschange").hide();
    });
     $("#shipping-existing .btn_openpagefix").click(function(){
      textNo = $(this).parent().parent().parent().attr("id").replace("recipent","");
      console.log(textNo)
      $("#shipping_addresschange").show();
    });
     $("#shipping_addresschange .address_box_list .address_box").click(function(){
      $("#shipping_addresschange").hide();
       $("#recipent"+textNo+" #shipping-existing .address_selected input").val($(this).attr("data-id"));
       $("#recipent"+textNo+" #shipping-existing .address_selected p").html($(this).find("span").html());
       postcodechange(textNo);
    });
     $('input.shipping_address').trigger("change");
     

  })


</script>
<?php } ?>
<script type="text/javascript"><!--
$('input.shipping_address').on('change', function() {
  textNo = $(this).parent().parent().parent().parent().attr("id").replace("recipent","");
  if (this.value == 'new') {
    $('#recipent'+textNo+' #shipping-existing').hide();
    $('#recipent'+textNo+' #shipping-new').show();
  } else {
    $('#recipent'+textNo+' #shipping-existing').show();
    $('#recipent'+textNo+' #shipping-new').hide();
    postcodechange(textNo);
  }
});
//--></script>
<script type="text/javascript"><!--
var totalreceipnt = <?php echo sizeof($a_products);?>;
$('#collapse-shipping-address .form-group[data-sort]').detach().each(function() {
  if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#collapse-shipping-address .form-group').length-2) {
    $('#collapse-shipping-address .form-group').eq(parseInt($(this).attr('data-sort'))+2).before(this);
  }

  if ($(this).attr('data-sort') > $('#collapse-shipping-address .form-group').length-2) {
    $('#collapse-shipping-address .form-group:last').after(this);
  }

  if ($(this).attr('data-sort') == $('#collapse-shipping-address .form-group').length-2) {
    $('#collapse-shipping-address .form-group:last').after(this);
  }

  if ($(this).attr('data-sort') < -$('#collapse-shipping-address .form-group').length-2) {
    $('#collapse-shipping-address .form-group:first').before(this);
  }
});
//--></script>
<script type="text/javascript"><!--
$('#collapse-shipping-address button[id^=\'button-shipping-custom-field\']').on('click', function() {
  var node = this;

  $('#form-upload').remove();

  $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

  $('#form-upload input[name=\'file\']').trigger('click');

  if (typeof timer != 'undefined') {
      clearInterval(timer);
  }

  timer = setInterval(function() {
    if ($('#form-upload input[name=\'file\']').val() != '') {
      clearInterval(timer);

      $.ajax({
        url: 'index.php?route=tool/upload',
        type: 'post',
        dataType: 'json',
        data: new FormData($('#form-upload')[0]),
        cache: false,
        contentType: false,
        processData: false,
        beforeSend: function() {
          $(node).button('loading');
        },
        complete: function() {
          $(node).button('reset');
        },
        success: function(json) {
          $(node).parent().find('.text-danger').remove();

          if (json['error']) {
            $(node).parent().find('input[name^=\'custom_field\']').after('<div class="text-danger">' + json['error'] + '</div>');
          }

          if (json['success']) {
            alert(json['success']);

            $(node).parent().find('input[name^=\'custom_field\']').val(json['code']);
          }
        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });
    }
  }, 500);
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
  pickTime: false
});

$('.time').datetimepicker({
  pickDate: false
});

$('.datetime').datetimepicker({
  pickDate: true,
  pickTime: true
});
//--></script>
<script type="text/javascript"><!--
$('#collapse-shipping-address select[name=\'country_id\']').on('change', function() {
  $.ajax({
    url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
    dataType: 'json',
    beforeSend: function() {
      $('#collapse-shipping-address select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
    },
    complete: function() {
      $('.fa-spin').remove();
    },
    success: function(json) {
      if (json['postcode_required'] == '1') {
        $('#collapse-shipping-address input[name=\'postcode\']').parent().parent().addClass('required');
      } else {
        $('#collapse-shipping-address input[name=\'postcode\']').parent().parent().removeClass('required');
      }

      html = '<option value=""><?php echo $text_select; ?></option>';

      if (json['zone'] && json['zone'] != '') {
        for (i = 0; i < json['zone'].length; i++) {
          html += '<option value="' + json['zone'][i]['zone_id'] + '"';

          if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
            html += ' selected="selected"';
          }

          html += '>' + json['zone'][i]['name'] + '</option>';
        }
      } else {
        html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
      }

      $('#collapse-shipping-address select[name=\'zone_id\']').html(html);
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});
var creceiptno;
$('#collapse-shipping-address select[name=\'country_id\']').trigger('change');
function postcodechange(receiptno) {
  creceiptno = receiptno;
    $.ajax({
        url: 'index.php?route=checkout/multiple_shipping_address/getshippingethodcost',
        type: 'post',
        data: $('#collapse-shipping-address #recipent'+creceiptno+' input[type=\'hidden\'], #collapse-shipping-address #recipent'+creceiptno+' input[type=\'text\'], #collapse-shipping-address #recipent'+creceiptno+' input[type=\'date\'], #collapse-shipping-address #recipent'+creceiptno+' input[type=\'datetime-local\'], #collapse-shipping-address #recipent'+creceiptno+' input[type=\'time\'], #collapse-shipping-address #recipent'+creceiptno+' input[type=\'password\'], #collapse-shipping-address #recipent'+creceiptno+' input[type=\'checkbox\']:checked, #collapse-shipping-address #recipent'+creceiptno+' input[type=\'radio\']:checked, #collapse-shipping-address #recipent'+creceiptno+' textarea, #collapse-shipping-address #recipent'+creceiptno+' select'),
        dataType: 'json',
        beforeSend: function() {
        },
        complete: function() {
        },
        success: function(json) {
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                $('#button-shipping-address').button('reset');

                if (json['error']['warning']) {
                    $('#collapse-shipping-address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }

                for (i in json['error']) {
                    var element = $('#input-shipping-' + i.replace('_', '-'));

                    if ($(element).parent().hasClass('input-group')) {
                        $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
                    } else {
                        $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
                    }
                }

                // Highlight any found errors
                $('.text-danger').parent().parent().addClass('has-error');
            } else {
                if(!json.pricetext){
                    $("#recipent"+creceiptno+" .overall_shippingcost_text").show();
                    $("#recipent"+creceiptno+" .overall_shippingcost").hide();
                    $("#recipent"+creceiptno+" .overall_shippingcost .can_shipping").val("false");

                }else{
                    $("#recipent"+creceiptno+" .overall_shippingcost_text").hide();
                    $("#recipent"+creceiptno+" .overall_shippingcost").show();
                    $("#recipent"+creceiptno+" .overall_shippingcost .can_shipping").val("true");
                    $("#recipent"+creceiptno+" .overall_shippingcost .shipping_cost").html(json.pricetext);
                    $("#recipent"+creceiptno+" #shipping-method .ishipping_method").val(json.dcode);
                }
                getordersummary();

        }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}


$(document).delegate('#button-shipping-address', 'click', function() {
   
    for(var i =0;i<totalreceipnt;i++){
       if($("#recipent"+i+" .overall_shippingcost .can_shipping").val()=="false"){return;}
    }
    var recipents = [];
    for(var i =0;i<totalreceipnt;i++){
        postcodechange((i+1));
    }
    $.ajax({
        url: 'index.php?route=checkout/multiple_shipping_address/save',
        type: 'post',
        dataType: 'html',
        beforeSend: function() {
            $('#button-shipping-address').button('loading');
        },
        success: function(json) {
            $('.alert, .text-danger').remove();

            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                $('#button-shipping-address').button('reset');

                if (json['error']['warning']) {
                    $('#collapse-shipping-address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }

                for (i in json['error']) {
                    var element = $('#input-shipping-' + i.replace('_', '-'));

                    if ($(element).parent().hasClass('input-group')) {
                        $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
                    } else {
                        $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
                    }
                }

                // Highlight any found errors
                $('.text-danger').parent().parent().addClass('has-error');
            } else {
                callsaveshipmethod();
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});

function callsaveshipmethod(){
  $.ajax({
      url: 'index.php?route=checkout/payment_method',
      dataType: 'html',
      complete: function() {
          $('#button-shipping-method').button('reset');
      },
      success: function(html) {
          $('#collapse-payment-method .panel-body').html(html);
          savepaymentmethod();
          $(".securedpayment").addClass("active");
          $(".securedpayment").show();
          $(".delivery_method").hide();
          
      },
      error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
  });
}

function savepaymentmethod() {
    $.ajax({
        url: 'index.php?route=checkout/payment_method/save',
        type: 'post',
        data: $('#collapse-payment-method input[type=\'radio\']:checked, #collapse-payment-method input[type=\'checkbox\']:checked, #collapse-payment-method textarea'),
        dataType: 'json',
        beforeSend: function() {
            $('#button-payment-method').button('loading');
        },
        success: function(json) {
            $('.alert, .text-danger').remove();

            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                $('#button-payment-method').button('reset');
                
                if (json['error']['warning']) {
                    $('#collapse-payment-method .panel-body').prepend('<div class="alert alert-danger">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }
            } else {
                $.ajax({
                    url: 'index.php?route=checkout/multiple_shipping_address/confirm',
                    dataType: 'html',
                    complete: function() {
                        $('#button-payment-method').button('reset');
                    },
                    success: function(html) {
                        finishpayment();
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}


function finishpayment(){
    $.ajax({
        type: 'get',
        url: 'index.php?route=extension/payment/cod/confirm',
        cache: false,
        beforeSend: function() {
            $('#button-confirm').button('loading');
        },
        complete: function() {
            $('#button-confirm').button('reset');
        },
        success: function(json) {
            console.log(json);

            location = json["payment_link"]+"&order_id="+json["order_id"];
        }
    });
}

//--></script>
