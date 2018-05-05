<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-module" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a> <?php echo $text_extension_doc;?></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-module" class="form-horizontal">
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if (isset($error_name) && $error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_zipcode; ?></label>
            <div class="col-sm-10">
            	<textarea name="zipcode" rows="10" id="input-zipcode" class="form-control"><?php echo $zipcode; ?></textarea>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_customer_group; ?></label>
            <div class="col-sm-10">
              <div class="well well-sm" style="height: 150px; overflow: auto;">
                <?php foreach ($customer_groups as $cgrp) { ?>
                <div class="checkbox">
                  <label>
                    <?php if (isset($customer_group) && in_array($cgrp['customer_group_id'], $customer_group)) { ?>
                    <input type="checkbox" name="customer_group[]" value="<?php echo $cgrp['customer_group_id']; ?>" checked="checked" />
                    <?php echo $cgrp['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="customer_group[]" value="<?php echo $cgrp['customer_group_id']; ?>" />
                    <?php echo $cgrp['name']; ?>
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
            <div class="col-sm-10">
              <div class="well well-sm" style="height: 150px; overflow: auto;">
                <div class="checkbox">
                  <label>
                    <?php if (isset($store) && in_array(0, $store)) { ?>
                    <input type="checkbox" name="store[]" value="0" checked="checked" />
                    <?php echo $text_default; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="store[]" value="0" />
                    <?php echo $text_default; ?>
                    <?php } ?>
                  </label>
                </div>
                <?php foreach ($stores as $store_data) { ?>
                <div class="checkbox">
                  <label>
                    <?php if (isset($store) && in_array($store_data['store_id'], $store)) { ?>
                    <input type="checkbox" name="store[]" value="<?php echo $store_data['store_id']; ?>" checked="checked" />
                    <?php echo $store_data['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="store[]" value="<?php echo $store_data['store_id']; ?>" />
                    <?php echo $store_data['name']; ?>
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-date_start"><?php echo $entry_date_start; ?></label>
            <div class="col-sm-3">
              <div class="input-group date">
                <input type="text" name="date_start" value="<?php echo $date_start; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" id="input-date_start" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-date_end"><?php echo $entry_date_end; ?></label>
            <div class="col-sm-3">
              <div class="input-group date">
                <input type="text" name="date_end" value="<?php echo $date_end; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" id="input-date_end" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div style="clear:both"></div>
          <div class="table-responsive">
            <table id="mulflatshpzip_cost" class="table table-striped table-bordered table-hover">
              <thead>
                <tr>
                  <td class="text-left"><?php echo $entry_order_total_text; ?></td>
                  <td class="text-left"><?php echo $entry_totfrom; ?></td>
                  <td class="text-left"><?php echo $entry_totto; ?></td>
                  <td class="text-left"><?php echo $entry_costtype; ?></td>
                  <td class="text-left"><?php echo $entry_cost; ?></td>                  
                  <td></td>
                </tr>
              </thead>
              <tbody>
                <?php $row = 0; ?>
                <?php foreach ($mulflatshpzip_cost_data as $mulflatshpzip_cost_info) { ?>
                <tr id="mulflatshpzip-row<?php echo $row; ?>">
                  <td class="text-left" style="width: 30%;"><?php foreach ($languages as $language) { ?>
                    <div class="input-group pull-left"><span class="input-group-addon"><img src="<?php echo $language['imgsrc'];?>" /> </span>
                      <input type="text" name="mulflatshpzip_cost_info[<?php echo $row; ?>][order_total_text][<?php echo $language['language_id'];?>]" value="<?php echo isset($mulflatshpzip_cost_info['order_total_text'][$language['language_id']]) ? $mulflatshpzip_cost_info['order_total_text'][$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_order_total_text; ?>" class="form-control" />
                    </div>
                    <?php } ?></td>
                  <td class="text-left"><input type="text" name="mulflatshpzip_cost_info[<?php echo $row; ?>][totfrom]" value="<?php echo $mulflatshpzip_cost_info['totfrom']; ?>" placeholder="<?php echo $entry_totfrom; ?>" class="form-control" /></td>
                  <td class="text-left"><input type="text" name="mulflatshpzip_cost_info[<?php echo $row; ?>][totto]" value="<?php echo $mulflatshpzip_cost_info['totto']; ?>" placeholder="<?php echo $entry_totto; ?>" class="form-control" /></td>
                  
                  
                  <td class="text-left"><select name="mulflatshpzip_cost_info[<?php echo $row; ?>][costtype]" id="input-costtype" class="form-control">
                <?php if ($mulflatshpzip_cost_info['costtype']) { ?>
                <option value="1" selected="selected"><?php echo $text_fixed_amount; ?></option>
                <option value="0"><?php echo $text_percentage; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_fixed_amount; ?></option>
                <option value="0" selected="selected"><?php echo $text_percentage; ?></option>
                <?php } ?>
              </select></td>
                  
                  <td class="text-left"><input type="text" name="mulflatshpzip_cost_info[<?php echo $row; ?>][cost]" value="<?php echo $mulflatshpzip_cost_info['cost']; ?>" placeholder="<?php echo $entry_cost; ?>" class="form-control" /></td>
                  <td class="text-left"><button type="button" onclick="$('#mulflatshpzip-row<?php echo $row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                </tr>
                <?php $row++; ?>
                <?php } ?>
              </tbody>
              <tfoot>
                <tr>
                  <td colspan="5"></td>
                  <td class="text-left"><button type="button" onclick="mulflatshpzip_add();" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                </tr>
              </tfoot>
            </table>
          </div>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript"> 
function loadajaxprocatmanu(typeset, inptname) { 
$('input[name=\''+inptname+'\']').autocomplete({
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/'+typeset+'/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item[''+typeset+'_id']
					}
				}));
			}
		});
	},
	select: function(item) {
		$('input[name=\''+inptname+'\']').val('');
		
		$('#'+inptname+ item['value']).remove();
		
		$('#'+inptname).append('<div id="'+inptname+'-' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="'+inptname+'[]" value="' + item['value'] + '" /></div>');	
	}
});
	
$('#'+inptname).delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
}); 
}
</script> 
  <script language="javascript"> 
loadajaxprocatmanu('product', 'product') ; 
loadajaxprocatmanu('category', 'category') ; 
loadajaxprocatmanu('manufacturer', 'manufacturer') ; 
</script> 
  <script type="text/javascript"><!--
var row = <?php echo $row; ?>;

function mulflatshpzip_add() {
	html  = '<tr id="mulflatshpzip-row' + row + '">';
	
	html += '<td class="text-left" style="width: 30%;">';
	<?php foreach ($languages as $language) { ?>
		html += '<div class="input-group pull-left"><span class="input-group-addon"><img src="<?php echo $language['imgsrc'];?>" /> </span> <input type="text" name="mulflatshpzip_cost_info[' + row + '][order_total_text][<?php echo $language['language_id'];?>]" placeholder="<?php echo $entry_order_total_text; ?>" class="form-control" /> </div>';
	<?php } ?>
	html += '</td>';
	
	html += '<td class="text-left"><input type="text" name="mulflatshpzip_cost_info[' + row + '][totfrom]" placeholder="<?php echo $entry_totfrom; ?>" class="form-control" /></td>';
	html += '<td class="text-left"><input type="text" name="mulflatshpzip_cost_info[' + row + '][totto]" placeholder="<?php echo $entry_totto; ?>" class="form-control" /></td>';
 	 	
  	html += '<td class="text-left"><select name="mulflatshpzip_cost_info[' + row + '][costtype]" id="input-costtype" class="form-control"> <option value="1"><?php echo $text_fixed_amount; ?></option> <option value="0" selected="selected"><?php echo $text_percentage; ?></option> </select></td>';
			  
	html += '<td class="text-left"><input type="text" name="mulflatshpzip_cost_info[' + row + '][cost]" placeholder="<?php echo $entry_cost; ?>" class="form-control" /></td>';
	  	
	html += '  <td class="text-left"><button type="button" onclick="$(\'#mulflatshpzip-row' + row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';

	$('#mulflatshpzip_cost tbody').append(html);

	$('.date').datetimepicker({
		pickTime: false
	});

	row++;
}
$('.date').datetimepicker({
	pickTime: false
});
//--></script> 
</div>
<?php echo $footer; ?>