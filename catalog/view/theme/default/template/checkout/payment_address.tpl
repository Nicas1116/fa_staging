<form class="form-horizontal ">
   <h2>Billing Information</h2>
   <div class="row pa_address_p">
  <div class="radio">
    <label>
      <input type="radio" name="payment_address" value="new" checked="checked" />New Address</label>
  </div>
  <div class="radio">
    <label>
      <input type="radio" name="payment_address" value="existing" <?php echo ($addresses) ? '' : 'disabled'; ?> />From Address Book</label>
  </div>
   </div>
  <div id="payment-existing" style="display: <?php echo ($addresses ? 'none' : 'block'); ?>;">
      <?php foreach ($addresses as $address) { ?>
      <?php if ($address['address_id'] == $address_id) { ?>
       <?php  $address_selected = $address; ?>
       <?php } ?>
      <?php } 
      if(!isset($address_selected)){
         $address_selected = $address;
      }
      ?>


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
  <div id="payment-new" style="display: <?php echo ($addresses ? 'block' : 'none'); ?>;">
    <div class="form-group required">
      <div class="col-sm-6">
        <input type="text" name="firstname" value="" placeholder="<?php echo $entry_firstname; ?>" id="input-payment-firstname" class="form-control alphabets-only" />
      </div>
      <div class="col-sm-6">
        <input type="text" name="lastname" value="" placeholder="<?php echo $entry_lastname; ?>" id="input-payment-lastname" class="form-control alphabets-only" />
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-12">
        <input type="text" name="company" value="" placeholder="<?php echo $entry_company; ?>" id="input-payment-company" class="form-control" />
      </div>
    </div>
    <div class="form-group required">
      <div class="col-sm-3">
        <input type="text" name="address_1" value="" placeholder="<?php echo $entry_address_1; ?>" id="input-payment-address-1" class="form-control" />
      </div>
      <div class="col-sm-9">
        <input type="text" name="address_2" value="" placeholder="<?php echo $entry_address_2; ?>" id="input-payment-address-2" class="form-control" />
      </div>
    </div>
    <div class="form-group required">

      <div class="col-sm-4">
        <input type="text" name="city" value="" placeholder="<?php echo $entry_city; ?>" id="input-payment-city" class="form-control" />
      </div>
      <div class="col-sm-4">
        <select name="zone_id" id="input-payment-zone" class="form-control">
        </select>
      </div>
       <div class="col-sm-4">
        <input type="text" name="postcode" value="" placeholder="<?php echo $entry_postcode; ?>" id="input-payment-postcode" class="form-control numberonly" />
      </div>
    </div>

    <div class="form-group required" style="display: none;">
      <div class="col-sm-10">
        <select name="country_id" id="input-payment-country" class="form-control">
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
    <?php foreach ($custom_fields as $custom_field) { ?>
    <?php if ($custom_field['location'] == 'address') { ?>
    <?php if ($custom_field['type'] == 'select') { ?>
    <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" >
      <div class="col-sm-12">
        <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
          <option value=""><?php echo $text_select; ?></option>
          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
          <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
          <?php } ?>
        </select>
      </div>
    </div>
    <?php } ?>
    <?php if ($custom_field['type'] == 'radio') { ?>
    <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" >
      <div class="col-sm-12">
        <div id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>">
          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
          <div class="radio">
            <label>
              <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
              <?php echo $custom_field_value['name']; ?></label>
          </div>
          <?php } ?>
        </div>
      </div>
    </div>
    <?php } ?>
    <?php if ($custom_field['type'] == 'checkbox') { ?>
    <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" >
      <div class="col-sm-12">
        <div id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>">
          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
          <div class="checkbox">
            <label>
              <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
              <?php echo $custom_field_value['name']; ?></label>
          </div>
          <?php } ?>
        </div>
      </div>
    </div>
    <?php } ?>
    <?php if ($custom_field['type'] == 'text') { ?>
    <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" >
      <div class="col-sm-12">
        <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control numberonly" />
      </div>
    </div>
    <?php } ?>
    <?php if ($custom_field['type'] == 'textarea') { ?>
    <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" >
      <div class="col-sm-12">
        <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo $custom_field['value']; ?></textarea>
      </div>
    </div>
    <?php } ?>
    <?php if ($custom_field['type'] == 'file') { ?>
    <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" >
      <div class="col-sm-12">
        <button type="button" id="button-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
        <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
      </div>
    </div>
    <?php } ?>
    <?php if ($custom_field['type'] == 'date') { ?>
    <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" >
      <div class="col-sm-12">
        <div class="input-group date">
          <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <span class="input-group-btn">
          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
          </span></div>
      </div>
    </div>
    <?php } ?>
    <?php if ($custom_field['type'] == 'time') { ?>
    <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" >
      <div class="col-sm-12">
        <div class="input-group time">
          <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <span class="input-group-btn">
          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
          </span></div>
      </div>
    </div>
    <?php } ?>
    <?php if ($custom_field['type'] == 'datetime') { ?>
    <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" >
      <div class="col-sm-12">
        <div class="input-group datetime">
          <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <span class="input-group-btn">
          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
          </span></div>
      </div>
    </div>
    <?php } ?>
    <?php } ?>
    <?php } ?>
  </div>
  <div class="buttons clearfix">
    <div class="pull-right">
      <input type="button" value="NEXT" id="button-payment-address" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-next" />
    </div>
  </div>
</form>
<?php if($addresses){ ?>
<div id="payment_addresschange" class="pagefix" style="display: none;">
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
  $(document).ready(function(){
    $("#payment_addresschange .btn_closepagefix").click(function(){
      $("#payment_addresschange").hide();
    });
     $("#payment-existing .btn_openpagefix").click(function(){
      $("#payment_addresschange").show();
    });
     $("#payment_addresschange .address_box_list .address_box").click(function(){
       $("#payment-existing .address_selected input").val($(this).attr("data-id"));
       $("#payment_addresschange").hide();
       $("#payment-existing .address_selected p").html($(this).find("span").html());
    });
  })
</script>
<?php } ?>
<script type="text/javascript"><!--
$('input[name=\'payment_address\']').on('change', function() {
	if (this.value == 'new') {
		$('#payment-existing').hide();
		$('#payment-new').show();
	} else {
		$('#payment-existing').show();
		$('#payment-new').hide();
	}
});
//--></script>
<script type="text/javascript"><!--
// Sort the custom fields
$(document).ready(function(){
    $(".alphabets-only").keypress(function(e) {
        var key = e.keyCode;
        if (key >= 48 && key <= 57) {
            e.preventDefault();
        }
    });
  })
$('#collapse-payment-address .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#collapse-payment-address .form-group').length-2) {
		$('#collapse-payment-address .form-group').eq(parseInt($(this).attr('data-sort'))+2).before(this);
	}

	if ($(this).attr('data-sort') > $('#collapse-payment-address .form-group').length-2) {
		$('#collapse-payment-address .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') == $('#collapse-payment-address .form-group').length-2) {
		$('#collapse-payment-address .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('#collapse-payment-address .form-group').length-2) {
		$('#collapse-payment-address .form-group:first').before(this);
	}
});
//--></script>
<script type="text/javascript"><!--
$('#collapse-payment-address button[id^=\'button-payment-custom-field\']').on('click', function() {
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
$('#collapse-payment-address select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#collapse-payment-address select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#collapse-payment-address input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('#collapse-payment-address input[name=\'postcode\']').parent().parent().removeClass('required');
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

			$('#collapse-payment-address select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#collapse-payment-address select[name=\'country_id\']').trigger('change');
//--></script>

<script type="text/javascript">
  $(document).on("input", ".numberonly", function() {
      this.value = this.value.replace(/\D/g,'');
  });
</script>