<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-enquery').submit() : false;"><i class="fa fa-trash-o"></i></button>
      </div>
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
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
		<div class="well">
          <div class="row">
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="input-name"><?php echo $text_formname; ?></label>
                <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $text_formname; ?>" id="input-name" class="form-control" />
              </div>
			  <div class="form-group">
                <label class="control-label" for="input-name"><?php echo $column_customer; ?></label>
                <input type="text" name="filter_customer" value="<?php echo $filter_customer; ?>" placeholder="<?php echo $column_customer; ?>" id="input-customer" class="form-control" />
              </div>
			</div>
			<div class="col-sm-4">
              <div class="form-group">
				<label class="control-label" for="input-name"><?php echo $text_from_date; ?></label>
				 <div class="input-group date">
					<input type="text" name="filter_from_date" value="<?php echo $filter_from_date; ?>" placeholder="<?php echo $text_from_date; ?>" data-date-format="YYYY-MM-DD" id="input-from_date" class="form-control" />
					<span class="input-group-btn">
					  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                    </span>
				 </div>
              </div>
			  <div class="form-group">
                <label class="control-label" for="input-name"><?php echo $text_ip; ?></label>
                <input type="text" name="filter_ip" value="<?php echo $filter_ip; ?>" placeholder="<?php echo $text_ip; ?>" id="input-ip" class="form-control" />
              </div>
			</div>
			<div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="input-name"><?php echo $text_todate; ?></label>
                 <div class="input-group date">
					<input type="text" name="filter_to_date" value="<?php echo $filter_to_date; ?>" placeholder="<?php echo $text_todate; ?>" data-date-format="YYYY-MM-DD" id="input-to_date" class="form-control" />
					<span class="input-group-btn">
					  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                    </span>
				 </div>
              </div>
			  <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
            </div>
          </div>
        </div>
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-enquery">
		  <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                    <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                    <td class="text-left"><?php echo $text_formname; ?></td>
                    <td class="text-left"><?php echo $column_customer; ?></td>
                    <td class="text-left"><?php echo $text_ip; ?></td>
                    <td class="text-right"><?php echo $text_dateadded; ?></td>
                    <td class="text-right"><?php echo $column_action; ?></td>
                </tr>
              </thead>
			  <tbody>
                <?php if ($enquiry_data) { ?>
				<?php foreach($enquiry_data as $enquiry){ ?>
				<tr>
					<td>
						<?php if (in_array($enquiry['forumbuilder_id'], $selected)) { ?>
						<input type="checkbox" name="selected[]" value="<?php echo $enquiry['forumbuilder_id']; ?>" checked="checked" />
						<?php } else { ?>
						<input type="checkbox" name="selected[]" value="<?php echo $enquiry['forumbuilder_id']; ?>" />
						<?php } ?>
					</td>
					<td><?php echo $enquiry['forumname']; ?></td>
					<td><?php echo $enquiry['customer']; ?></td>
					<td><?php echo $enquiry['ipaddress']; ?><br/>
					<a target="blank" href="<?php echo $enquiry['check_ip']; ?>" class="btn btn-default btn-xs"><small><i class="fa fa-info"></i> Check IP</small></a></td>
					<td class="text-right"><?php echo $enquiry['date_added']; ?></td>
					<td>
						<button type="button" class="btn btn-info pull-right" data-toggle="modal" data-target="#<?php echo $enquiry['forumbuilder_id']; ?>"><i class="fa fa-eye"></i> View</button>
						<!-- Modal -->
						<div class="modal fade" id="<?php echo $enquiry['forumbuilder_id']; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						  <div class="modal-dialog" role="document">
							<div class="modal-content">
							  <div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title" id="myModalLabel"><?php echo $form_details; ?></h4>
							  </div>
							  <div class="modal-body">
								<div class="row">
									<div class="col-sm-6">
										<div class="panel panel-default">
										  <div class="panel-heading">
											<h3 class="panel-title"><i class="fa fa-file"></i> <?php echo $form_detail; ?></h3>
										  </div>
										  <table class="table">
											<tbody>
											  <tr>
												<td style="width: 1%"><a data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="<?php echo $enquiry['forumname']; ?>"><i class="fa fa-file fa-fw"></i></a></td>
												<td><?php echo $enquiry['forumname']; ?></td>
											  </tr>
											  <tr>
												<td><a data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="<?php echo $enquiry['date_added']; ?>"><i class="fa fa-calendar fa-fw"></i></a></td>
												<td><?php echo $enquiry['date_added']; ?></td>
											  </tr>
											</tbody>
										  </table>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="panel panel-default">
										  <div class="panel-heading">
											<h3 class="panel-title"><i class="fa fa-file"></i> <?php echo $customer_details; ?></h3>
										  </div>
										  <table class="table">
											<tbody>
											  <tr>
												<td style="width: 1%"><a data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="<?php echo $customer_details; ?>"><i class="fa fa-user"></i></a></td>
												<td><?php echo $enquiry['customer']; ?></td>
											  </tr>
											  <tr>
												<td style="width: 1%"><a data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Form Page Title"><i class="fa fa-desktop"></i></a></td>
												<td><?php echo $enquiry['ipaddress']; ?></td>
											  </tr>
											</tbody>
										  </table>
										</div>
									</div>
								</div>
								<?php echo $enquiry['forumdata']; ?>
							  </div>
							</div>
						  </div>
						</div>
					</td>
				</tr>
				<?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="5"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	var url = 'index.php?route=catalog/forumbuilder&token=<?php echo $token; ?>';

	var filter_name = $('input[name=\'filter_name\']').val();

	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}
	
	var filter_customer = $('input[name=\'filter_customer\']').val();

	if (filter_customer) {
		url += '&filter_customer=' + encodeURIComponent(filter_customer);
	}
	
	var filter_from_date = $('input[name=\'filter_from_date\']').val();

	if (filter_from_date) {
		url += '&filter_from_date=' + encodeURIComponent(filter_from_date);
	}
	
	var filter_to_date = $('input[name=\'filter_to_date\']').val();

	if (filter_to_date) {
		url += '&filter_to_date=' + encodeURIComponent(filter_to_date);
	}
	
	var filter_ip = $('input[name=\'filter_ip\']').val();

	if (filter_ip) {
		url += '&filter_ip=' + encodeURIComponent(filter_ip);
	}

	location = url;
});
//--></script>
<script type="text/javascript"><!--
$('input[name=\'filter_customer\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=customer/customer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['customer_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter_customer\']').val(item['label']);
	}
});
//--></script>
<script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script>
<?php echo $footer; ?>