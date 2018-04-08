<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
		<button type="submit" form="form-formbuilder" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i> <?php echo $text_save; ?></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i> <?php echo $text_cancel; ?></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <style>
  .panel-primary .panel-heading{
	  background-color: #1e91cf !important;
	  color:#fff;
  }
  .form_fields .panel-heading{
	  border:0;
  }
  .form_fields .panel-group .panel-heading h3{
	  width:90%;
  }
  </style>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-formbuilder" class="form-horizontal">
		<ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><i class="fa fa-edit"></i>  <?php echo $tab_general; ?></a></li>
            <li><a href="#tab-language" data-toggle="tab"><i class="fa fa-language"></i>  <?php echo $tab_language; ?></a></li>
            <li><a href="#tab-field" data-toggle="tab"><i class="fa fa-cogs"></i> <?php echo $tab_field; ?></a></li>
            <li><a href="#tab-mail" data-toggle="tab"><i class="fa fa-envelope"></i> <?php echo $tab_mail; ?></a></li>
           <li><a href="#tab-success" data-toggle="tab"><i class="fa fa-file"></i> <?php echo $tab_successpage; ?></a></li>
            <li><a href="#tab-support" data-toggle="tab"><i class="fa fa-life-ring" aria-hidden="true"></i> <?php echo $tab_support; ?></a></li>
         </ul>
		 <div class="tab-content">
             <div class="tab-pane" id="tab-support">
					<div style="margin:0 auto; width: 50%;" class="table-responsive">
						<table class="table table-bordered table-hover">
						  <tr>
							<th>Extension Name</th>
							<td><?php echo $heading_title; ?></td>
						  </tr>
						  <tr>
							<th>Version</th>
							<td>3.1</td>
						  </tr>
						  <tr>
							<th>Authur</th>
							<td>Webx It Solutions</td>
						  </tr>
						  <tr>
							<th>Website</th>
							<td><a target="_new" href="http://webxitsolutions.com">http://webxitsolutions.com</a></td>
						  </tr>
						  <tr>
							<th>For Support</th>
							<td><a href="mailto:support@webxitsolutions.com">support@webxitsolutions.com</a></td>
						  </tr>
						  <tr>
							<th>Get More Extensions</th>
							<td><a target="_new" href="https://www.opencart.com/index.php?route=marketplace/extension&sort=date_added&filter_member=webx">More Extensions</a></td>
						  </tr>
						</table>
					</div>
			</div>
            <div class="tab-pane active" id="tab-general">
				<div class="form-group">
					<input type="hidden" name="savestay" value="0"/>
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
				<div class="form-group required">
					<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
					<div class="col-sm-10">
					  <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
					  <?php if($error_name){ ?>
					  <div class="text-danger"><?php echo $error_name; ?></div>
					  <?php } ?>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="input-recordresponse"><span  data-toggle="tooltip" title="<?php echo $help_recordresponse; ?>"><?php echo $entry_recordresponse; ?></span></label>
					<div class="col-sm-10">
					  <label class="radio-inline">
						<?php if ($formbuilder_recordresponse) { ?>
						<input type="radio" name="formbuilder_recordresponse" value="1" checked />
						<?php }else{ ?>
						<input type="radio" name="formbuilder_recordresponse" value="1" />
						<?php } ?>
						<?php echo $text_yes; ?>
					  </label>
					  <label class="radio-inline">
						<?php if (!$formbuilder_recordresponse) { ?>
						<input type="radio" name="formbuilder_recordresponse" value="0" checked />
						<?php }else{ ?>
						<input type="radio" name="formbuilder_recordresponse" value="0" />
						<?php } ?>
						<?php echo $text_no; ?>
					  </label>
					</div>
				</div>
				 <div class="form-group">
					<label class="col-sm-2 control-label" for="input-recordresponse"><span  data-toggle="tooltip" title="<?php echo $help_guest; ?>"><?php echo $entry_guest; ?></span></label>
					<div class="col-sm-10">
					  <label class="radio-inline">
						<?php if ($formbuilder_guest) { ?>
						<input type="radio" name="formbuilder_guest" value="1" checked />
						<?php }else{ ?>
						<input type="radio" name="formbuilder_guest" value="1" />
						<?php } ?>
						<?php echo $text_yes; ?>
					  </label>
					  <label class="radio-inline">
						<?php if (!$formbuilder_guest) { ?>
						<input type="radio" name="formbuilder_guest" value="0" checked />
						<?php }else{ ?>
						<input type="radio" name="formbuilder_guest" value="0" />
						<?php } ?>
						<?php echo $text_no; ?>
					  </label>
					</div>
				 </div>
				 <div class="form-group">
					<label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
					<div class="col-sm-10">
					  <div class="well well-sm" style="height: 100px; overflow: auto;">
						<div class="checkbox">
						  <label>
							<?php if (in_array(0, $formbuilder_store)) { ?>
							<input type="checkbox" name="formbuilder_store[]" value="0" checked="checked" />
							<?php echo $text_default; ?>
							<?php } else { ?>
							<input type="checkbox" name="formbuilder_store[]" value="0" />
							<?php echo $text_default; ?>
							<?php } ?>
						  </label>
						</div>
						<?php foreach ($stores as $store) { ?>
						<div class="checkbox">
						  <label>
							<?php if (in_array($store['store_id'], $formbuilder_store)) { ?>
							<input type="checkbox" name="formbuilder_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
							<?php echo $store['name']; ?>
							<?php } else { ?>
							<input type="checkbox" name="formbuilder_store[]" value="<?php echo $store['store_id']; ?>" />
							<?php echo $store['name']; ?>
							<?php } ?>
						  </label>
						</div>
						<?php } ?>
					  </div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><?php echo $entry_customer_group; ?></label>
					<div class="col-sm-10">
					<div class="well well-sm" style="height: 100px; overflow: auto;">
					  <?php $customer_group_row = 0; ?>
					  <?php foreach ($customer_groups as $customer_group) { ?>
					  <div class="checkbox checkbox-inline" style="padding-left:0;">
						<label>
						  <?php if (in_array($customer_group['customer_group_id'], $formbuilder_customer_group)) { ?>
						  <input type="checkbox" name="formbuilder_customer_group[<?php echo $customer_group_row; ?>][customer_group_id]" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
						  <?php echo $customer_group['name']; ?>
						  <?php } else { ?>
						  <input type="checkbox" name="formbuilder_customer_group[<?php echo $customer_group_row; ?>][customer_group_id]" value="<?php echo $customer_group['customer_group_id']; ?>" />
						  <?php echo $customer_group['name']; ?>
						  <?php } ?>
						</label>
					  </div>
					  <?php $customer_group_row++; ?>
					  <?php } ?>
					</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="input-top"><span data-toggle="tooltip" title="<?php echo $help_top; ?>"> <?php echo $text_top; ?></span></label>
					<div class="col-sm-10">
					  <div class="checkbox">
						<label>
						  <?php if ($top) { ?>
						  <input type="checkbox" name="top" value="1" checked="checked" id="input-top" />
						  <?php } else { ?>
						  <input type="checkbox" name="top" value="1" id="input-top" />
						  <?php } ?>
						  &nbsp; </label>
					  </div>
					</div>
                </div>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="input-top"><span data-toggle="tooltip" title="<?php echo $help_bottom; ?>"> <?php echo $text_bottom; ?></span></label>
					<div class="col-sm-10">
					  <div class="checkbox">
						<label>
						  <?php if ($bottom) { ?>
						  <input type="checkbox" name="bottom" value="1" checked="checked" id="input-top" />
						  <?php } else { ?>
						  <input type="checkbox" name="bottom" value="1" id="input-top" />
						  <?php } ?>
						  &nbsp; </label>
					  </div>
					</div>
                </div>
				 <div class="form-group">
					<label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
						<div class="col-sm-10">
							<input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
						</div>
				 </div>
			</div>
			<div class="tab-pane" id="tab-language">
				<ul class="nav nav-tabs" id="languages">
                <?php foreach ($languages as $language) { ?>
                <li><a href="#languages<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                <?php } ?>
				</ul>
				<div class="tab-content">
                <?php foreach ($languages as $language) { ?>
                <div class="tab-pane" id="languages<?php echo $language['language_id']; ?>">
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-heading<?php echo $language['language_id']; ?>"><?php echo $entry_heading; ?></label>
						<div class="col-sm-10">
						  <input type="text" name="formbuilder_desc[<?php echo $language['language_id']; ?>][heading]" value="<?php echo isset($formbuilder_desc[$language['language_id']]) ? $formbuilder_desc[$language['language_id']]['heading'] : ''; ?>" placeholder="<?php echo $entry_heading; ?>" id="input-heading<?php echo $language['language_id']; ?>" class="form-control" />
						  <?php if($error_heading){ ?>
						  <div class="text-danger"><?php echo $error_heading[$language['language_id']]; ?></div>
						  <?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-subheading<?php echo $language['language_id']; ?>"><?php echo $entry_subheading; ?></label>
						<div class="col-sm-10">
						  <input type="text" name="formbuilder_desc[<?php echo $language['language_id']; ?>][sub_heading]" value="<?php echo isset($formbuilder_desc[$language['language_id']]) ? $formbuilder_desc[$language['language_id']]['sub_heading'] : ''; ?>" placeholder="<?php echo $entry_subheading; ?>" id="input-subheading<?php echo $language['language_id']; ?>" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
						<div class="col-sm-10">
						  <textarea name="formbuilder_desc[<?php echo $language['language_id']; ?>][description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($formbuilder_desc[$language['language_id']]) ? $formbuilder_desc[$language['language_id']]['description'] : ''; ?></textarea>
						</div>
					</div>
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-meta_tag<?php echo $language['language_id']; ?>"><?php echo $entry_meta_tag; ?></label>
						<div class="col-sm-10">
						  <input type="text" name="formbuilder_desc[<?php echo $language['language_id']; ?>][meta_tag]" value="<?php echo isset($formbuilder_desc[$language['language_id']]) ? $formbuilder_desc[$language['language_id']]['meta_tag'] : ''; ?>" placeholder="<?php echo $entry_meta_tag; ?>" id="input-meta_tag<?php echo $language['language_id']; ?>" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-meta_description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
						<div class="col-sm-10">
						  <textarea name="formbuilder_desc[<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta_description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($formbuilder_desc[$language['language_id']]) ? $formbuilder_desc[$language['language_id']]['meta_description'] : ''; ?></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-meta_keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
						<div class="col-sm-10">
						  <textarea name="formbuilder_desc[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta_keyword<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($formbuilder_desc[$language['language_id']]) ? $formbuilder_desc[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-submit<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_submit ; ?>"><?php echo $entry_submit; ?></span></label>
						<div class="col-sm-10">
						  <input type="text" name="formbuilder_desc[<?php echo $language['language_id']; ?>][submit]" value="<?php echo isset($formbuilder_desc[$language['language_id']]) ? $formbuilder_desc[$language['language_id']]['submit'] : ''; ?>" placeholder="<?php echo $entry_submit; ?>" id="input-submit<?php echo $language['language_id']; ?>" class="form-control" />
						</div>
					</div>
				</div>
				<?php } ?>
				</div>
			</div>
			<div class="tab-pane" id="tab-success">
				<ul class="nav nav-tabs" id="successlanguage">
					<?php foreach ($languages as $language) { ?>
					<li><a href="#successlanguage<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
					<?php } ?>
				</ul>
				<div class="tab-content">
					<?php foreach ($languages as $language) { ?>
					<div class="tab-pane" id="successlanguage<?php echo $language['language_id']; ?>">
						<div class="form-group required">
							<label class="col-sm-2 control-label" for="input-success-heading<?php echo $language['language_id']; ?>"><?php echo $entry_heading; ?></label>
							<div class="col-sm-10">
							  <input type="text" name="formbuilder_success_page[<?php echo $language['language_id']; ?>][heading]" value="<?php echo isset($formbuilder_success_page[$language['language_id']]) ? $formbuilder_success_page[$language['language_id']]['heading'] : ''; ?>" placeholder="<?php echo $entry_heading; ?>" id="input-heading<?php echo $language['language_id']; ?>" class="form-control" />
							  <?php if($error_success_heading){ ?>
							  <div class="text-danger"><?php echo $error_success_heading[$language['language_id']]; ?></div>
							  <?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-success-subheading<?php echo $language['language_id']; ?>"><?php echo $entry_subheading ; ?></label>
							<div class="col-sm-10">
							  <input type="text" name="formbuilder_success_page[<?php echo $language['language_id']; ?>][sub_heading]" value="<?php echo isset($formbuilder_success_page[$language['language_id']]) ? $formbuilder_success_page[$language['language_id']]['sub_heading'] : ''; ?>" placeholder="<?php echo $entry_subheading ; ?>" id="input-subheading<?php echo $language['language_id']; ?>" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-success-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
							<div class="col-sm-10">
							  <textarea name="formbuilder_success_page[<?php echo $language['language_id']; ?>][description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($formbuilder_success_page[$language['language_id']]) ? $formbuilder_success_page[$language['language_id']]['description'] : ''; ?></textarea>
							</div>
						</div>
					</div>
					<?php } ?>
				</div>
			</div>
			<div class="tab-pane" id="tab-field">	
				<div class="form-group">
					<label class="col-sm-2 control-label" for="input-Captcha"><?php echo $show_captcha; ?></label>
					<div class="col-sm-10">
					  <select name="formbuilder_captcha" id="input-recordresponse" class="form-control">
						<?php if ($formbuilder_captcha) { ?>
						<option value="1" selected="selected"><?php echo $text_yes; ?></option>
						<option value="0"><?php echo $text_no; ?></option>
						<?php } else { ?>
						<option value="1"><?php echo $text_yes; ?></option>
						<option value="0" selected="selected"><?php echo $text_no; ?></option>
						<?php } ?>
					  </select>
					</div>
				 </div>
					<div class="row">
						<div class="col-sm-6">
							<?php $field_row = 0; ?>
							<?php $sub_row = 0; ?>
							
							<div  class="form_fields" id="accordion" role="tablist" aria-multiselectable="true">
									<?php foreach($formbuilder_field as $fields){
											
									?>
						<div class="panel-group" id="accordion<?php echo $field_row; ?>">
							<div class="panel panel-primary">
										<div class="panel-heading">
										<h3 class="panel-title pull-left">
										<a data-toggle="collapse" href="#collapse<?php echo $field_row; ?>" aria-controls="collapse<?php echo $field_row; ?>"><i class="fa fa-minus-circle" onclick="$('#accordion<?php echo $field_row; ?>').remove(); $('#accordion<?php echo $field_row; ?> a:first').tab('show');"></i> <?php echo (isset($fields[$language_id]['name']) ? $fields[$language_id]['name'] : ''); ?></a>
										</h3><div class="pull-right" style="padding:0 6px; margin-top:6px;"><i class="fa fa-arrows"></i></div>
										<div class="clearfix"></div>
										</div>
										<div id="collapse<?php echo $field_row; ?>" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading<?php echo $field_row; ?>">
										<div class="panel-body">
									
									<ul class="nav nav-tabs" id="language<?php echo $field_row; ?>">
											<?php foreach ($languages as $language) { ?>
											<li class="active"><a href="#tab-field-<?php echo $field_row; ?>-language<?php echo $language['language_id']; ?>" data-toggle="tab"><?php if(VERSION >= '2.2.0.0') { ?>
											<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
											<?php } else { ?> 
											<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> 
											<?php } ?>  <?php echo $language['name']; ?></a></li>
											
											<?php } ?>
									</ul>
									<div class="tab-content">
									 <?php foreach ($languages as $language){ ?>
									 
									   <div class="tab-pane active" id="tab-field-<?php echo $field_row; ?>-language<?php echo $language['language_id']; ?>">
											<div class="form-group">
												<label class="col-sm-2 control-label" for="input-name<?php echo $field_row; ?>-language<?php echo $language['language_id']; ?>"><?php echo $entry_field; ?></label>
												<div class="col-sm-10">
												  <input name="formbuilder_field[<?php echo $field_row; ?>][<?php echo $language['language_id']; ?>][name]" type="text" placeholder="<?php echo $entry_field; ?>" id="input-name<?php echo $field_row; ?>-language<?php echo $language['language_id']; ?>" value="<?php echo $fields[$language['language_id']]['name']; ?>" class="form-control" />
												</div>
											</div>
											
											<div class="form-group">
												<label class="col-sm-2 control-label" for="input-placeholder<?php echo $field_row; ?>-language<?php echo $language['language_id']; ?>"><?php echo $entry_placeholder; ?></label>
												<div class="col-sm-10">
												  <input name="formbuilder_field[<?php echo $field_row; ?>][<?php echo $language['language_id']; ?>][placeholder]" type="text" placeholder="<?php echo $entry_placeholder; ?>" id="input-placeholder<?php echo $field_row; ?>-language<?php echo $language['language_id']; ?>" value="<?php echo $fields[$language['language_id']]['placeholder']; ?>" class="form-control" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label" for="input-errormsg<?php echo $field_row; ?>-language<?php echo $language['language_id']; ?>"><?php echo $entry_errormsg; ?></label>
												<div class="col-sm-10">
												  <input name="formbuilder_field[<?php echo $field_row; ?>][<?php echo $language['language_id']; ?>][errormsg]" type="text" placeholder="<?php echo $entry_errormsg; ?>" id="input-errormsg<?php echo $field_row; ?>-language<?php echo $language['language_id']; ?>" value="<?php echo $fields[$language['language_id']]['errormsg']; ?>" class="form-control" />
												</div>
											</div>
										</div>
										<?php } ?>
									</div>
									<div class="form-group">
											<label class="col-sm-2 control-label" for="input-column<?php echo $field_row; ?>"><?php echo $entry_column; ?></label>
											<div class="col-sm-10">
											  <select name="formbuilder_field[<?php echo $field_row; ?>][column]" id="input-column<?php echo $field_row; ?>" class="form-control">
												<?php if ($fields['column']== 1) { ?>
												<option value="1" selected="selected">Column 1</option>
												<option value="2" >Column 2</option>
												<option value="3">Column 3</option>
												<?php } elseif ($fields['column'] ==2) { ?>
												<option value="1">Column 1</option>
												<option value="2" selected="selected">Column 2</option>
												<option value="3">Column 3</option>
												<?php } else { ?>
												<option value="1">Column 1</option>
												<option value="2">Column 2</option>
												<option value="3" selected="selected">Column 3</option>
												<?php } ?>
											  </select>
											</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="input-status<?php echo $field_row; ?>"><?php echo $entry_status; ?></label>
										<div class="col-sm-10">
										  <select name="formbuilder_field[<?php echo $field_row; ?>][status]" id="input-status<?php echo $field_row; ?>" class="form-control">
											<?php if ($fields['status']) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										  </select>
										</div>
									</div>
									<input type="hidden" name="formbuilder_field[<?php echo $field_row; ?>][sort_order]" value="" class="form-control setsortorder"/>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="input-type"><?php echo $entry_type; ?></label>
										<div class="col-sm-10">
										  <select rel="<?php echo $field_row; ?>" name="formbuilder_field[<?php echo $field_row; ?>][type]" id="input-type<?php echo $field_row; ?>" class="form-control">
											<optgroup label="<?php echo $text_choose; ?>">
											<?php if ($fields['type'] == 'select') { ?>
											<option value="select" selected="selected"><?php echo $text_select; ?></option>
											<?php } else { ?>
											<option value="select"><?php echo $text_select; ?></option>
											<?php } ?>
											<?php if ($fields['type'] == 'radio') { ?>
											<option value="radio" selected="selected"><?php echo $text_radio; ?></option>
											<?php } else { ?>
											<option value="radio"><?php echo $text_radio; ?></option>
											<?php } ?>
											<?php if ($fields['type'] == 'checkbox') { ?>
											<option value="checkbox" selected="selected"><?php echo $text_checkbox; ?></option>
											<?php } else { ?>
											<option value="checkbox"><?php echo $text_checkbox; ?></option>
											<?php } ?>
											</optgroup>
											<optgroup label="<?php echo $text_input; ?>">
											<?php if ($fields['type'] == 'text') { ?>
											<option value="text" selected="selected"><?php echo $text_text; ?></option>
											<?php } else { ?>
											<option value="text"><?php echo $text_text; ?></option>
											<?php } ?>
											<?php if ($fields['type'] == 'textarea') { ?>
											<option value="textarea" selected="selected"><?php echo $text_textarea; ?></option>
											<?php } else { ?>
											<option value="textarea"><?php echo $text_textarea; ?></option>
											<?php } ?>
											<?php if ($fields['type'] == 'number') { ?>
											<option value="number" selected="selected"><?php echo $text_number; ?></option>
											<?php } else { ?>
											<option value="number"><?php echo $text_number; ?></option>
											<?php } ?>
											<?php if ($fields['type'] == 'email') { ?>
											<option value="email" selected="selected"><?php echo 'Email'; ?></option>
											<?php } else { ?>
											<option value="email"><?php echo 'Email'; ?></option>
											<?php } ?>
											<?php if ($fields['type'] == 'password') { ?>
											<option value="password" selected="selected"><?php echo $text_password; ?></option>
											<?php } else { ?>
											<option value="password"><?php echo $text_password; ?></option>
											<?php } ?>
											</optgroup>
											<optgroup label="<?php echo $text_file; ?>">
											<?php if ($fields['type'] == 'file') { ?>
											<option value="file" selected="selected"><?php echo $text_file; ?></option>
											<?php } else { ?>
											<option value="file"><?php echo $text_file; ?></option>
											<?php } ?>
											</optgroup>
											<optgroup label="<?php echo $text_date; ?>">
											<?php if ($fields['type'] == 'date') { ?>
											<option value="date" selected="selected"><?php echo $text_date; ?></option>
											<?php } else { ?>
											<option value="date"><?php echo $text_date; ?></option>
											<?php } ?>
											<?php if ($fields['type'] == 'time') { ?>
											<option value="time" selected="selected"><?php echo $text_time; ?></option>
											<?php } else { ?>
											<option value="time"><?php echo $text_time; ?></option>
											<?php } ?>
											<?php if ($fields['type'] == 'datetime') { ?>
											<option value="datetime" selected="selected"><?php echo $text_datetime; ?></option>
											<?php } else { ?>
											<option value="datetime"><?php echo $text_datetime; ?></option>
											<?php } ?>
											</optgroup>
											<optgroup label="<?php echo $text_localisation; ?>">
											<?php if ($fields['type'] == 'country') { ?>
											<option value="country" selected="selected"><?php echo $text_country; ?></option>
											<?php }else{ ?>
											<option value="country"><?php echo $text_country; ?></option>
											<?php } ?>
											<?php if ($fields['type'] == 'zone') { ?>
											<option value="zone" selected="selected"><?php echo $text_zone; ?></option>
											<?php }else{ ?>
											<option value="zone"><?php echo $text_zone; ?></option>
											<?php } ?>
											</optgroup>
										  </select>
										</div>
									</div>
									<?php if($fields['type'] == 'select' || $fields['type'] == 'radio' || $fields['type'] == 'checkbox'){ 
											$ohide = '';
										 } else {
											$ohide = 'hide';	
										 } ?>
									<div class="optionvalue_<?php echo $field_row; ?> <?php echo $ohide; ?>">
										<div class="form-group ">
											<label class="col-sm-2 control-label" for="input-field-value"><?php echo 'Field Value'; ?></label>
											<div class="table-responsive">
												<table class="table table-bordered">
													<thead>
														<tr>
															<td><?php echo $text_field_value_name; ?></td>
															<td><?php echo $text_sortorder; ?></td>
															<td><?php echo $text_action; ?></td>
														</tr>
													</thead>
													<tbody>
													<?php if(isset($fields['optionvalue'])){ ?>
													<?php if($fields['type'] == 'select' || $fields['type'] == 'radio' || $fields['type'] == 'checkbox'){  ?>
													 <?php foreach($fields['optionvalue'] as $optionvalue){ ?>
														<tr id="sub_row<?php echo $field_row; ?>-<?php echo $sub_row; ?>">
														<td>
															<?php foreach ($languages as $language) { ?>
															<div class="input-group"><span class="input-group-addon">
															<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
																</span>
																<input type="text" class="form-control" name="formbuilder_field[<?php echo $field_row; ?>][optionvalue][<?php echo $sub_row; ?>][<?php echo $language['language_id']; ?>][value]" placeholder="Value" value="<?php echo $optionvalue[$language['language_id']]['value']; ?>" />
															</div>
															<?php } ?>
															</td>
															<td><input type="text" class="form-control" name="formbuilder_field[<?php echo $field_row; ?>][optionvalue][<?php echo $sub_row; ?>][sort_order]" placeholder="Sort Order" value="<?php echo $optionvalue['sort_order']; ?>" /></td>
															<td><a onclick="$(this).tooltip('destroy');$('#sub_row<?php echo $field_row; ?>-<?php echo $sub_row; ?>').remove();" data-toggle="tooltip" rel="tooltip" class="btn btn-danger"><i class="fa fa-trash"></i></a></td>
														</tr>
														<?php $sub_row++; ?>
													 <?php } ?>
													 <?php } ?>
													 <?php } ?>
													</tbody>
													<tfoot>
														<tr>
															<td colspan="2"><a onclick="addChild('optionvalue_<?php echo $field_row; ?>','<?php echo $field_row; ?>');" class="btn btn-primary"><i class="fa fa-plus"></i></a></td>
														</tr>
													</tfoot>
												</table>
											</div>
										</div>
									</div>
									<input type="hidden" id="input-value<?php echo $field_row; ?>" value="<?php echo (isset($fields['value']) ? $fields['value'] : ''); ?>"/>
									<div class="hide form-group otherfeilds_<?php echo $field_row; ?>">
										<label class="col-sm-2 control-label" for="input-value"><?php echo $entry_value; ?></label>
										<div class="col-sm-10 otherfeild_<?php echo $field_row; ?>">
										  <input type="text" name="formbuilder_field[<?php echo $field_row; ?>][value]" value="<?php echo (isset($fields['value']) ? $fields['value'] : ''); ?>" placeholder="<?php echo $entry_value; ?>" id="input-value<?php echo $field_row; ?>" class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="input-required"><?php echo $entry_required; ?></label>
										<div class="col-sm-10">
										  <select name="formbuilder_field[<?php echo $field_row; ?>][required]" id="input-required" class="form-control">
											<?php if (isset($fields['required']) && $fields['required']) { ?>
											<option value="1" selected="selected"><?php echo $text_yes; ?></option>
											<option value="0"><?php echo $text_no; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_yes; ?></option>
											<option value="0" selected="selected"><?php echo $text_no; ?></option>
											<?php } ?>
										  </select>
										</div>
									 </div>
									
									</div>
									
								</div>
							</div>
							
						</div>
						<?php $field_row++; ?>
						<?php } ?>
						</div>
					
					<div id="field-add"><a style="cursor:pointer;" class="btn btn-primary" onclick="addproducttab();"><i class="fa fa-plus-circle"></i> <?php echo $button_module_add; ?></a></div>
					</div>
					<div class="col-sm-6">
						<table class="table table-bordered">
							</thead>
								<tr>
									<td><strong><?php echo $text_field_type; ?></strong></td>
									<td><strong><?php echo $text_validation_info; ?></strong></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Text</td>
									<td>Error message when field is empty or less than 1 and greater then 255</td>
								</tr>
								<tr>
									<td>Textarea</td>
									<td>Error message when field is empty or characters are less then 1 </td>
								</tr>
								<tr>
									<td>Numbers</td>
									<td>Error message when field is empty or  Numbers are less then 1 </td>
								</tr>
								<tr>
									<td>Email</td>
									<td>Error message when email is incorrect </td>
								</tr>
								<tr>
									<td>Password</td>
									<td>Error message when password is less than 6 </td>
								</tr>
								<tr>
									<td>Select</td>
									<td>Error message when no option selected </td>
								</tr>
								<tr>
									<td>Radio</td>
									<td>Error message when no Radio Button choose </td>
								</tr>
								<tr>
									<td>Checkbox</td>
									<td>Error message when none of checkbox checked. </td>
								</tr>
								<tr>
									<td>File</td>
									<td>Error message when none of file selected. </td>
								</tr>
								<tr>
									<td>Date</td>
									<td>Error message when Date not selected. </td>
								</tr>
								<tr>
									<td>Time</td>
									<td>Error message when Time not added. </td>
								</tr>
								<tr>
									<td>Date & Time</td>
									<td>Error message when Both Date & Time not selected. </td>
								</tr>
								<tr>
									<td>Country</td>
									<td>Error message when none of country Added. </td>
								</tr>
								<tr>
									<td>Zone</td>
									<td>Error message when none of country Added. </td>
								</tr>
							</tbody>
						</table>
					
						
					</div>
				</div>
			</div>
			<div class="tab-pane" id="tab-mail">
				
				
				
				
				
				
				<div class="tab-content">
				<div class="row">
					<div class="col-sm-9">
						
							<div class="adminmail">
								<fieldset>
									<legend><?php echo $text_adminmail_setting; ?></legend>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="input-recordresponse"><span data-toggle="tooltip" title="<?php echo $entry_adminmail; ?>"><?php echo $entry_status; ?></span></label>
										<div class="col-sm-10">
										  <label class="radio-inline">
											<?php if ($formbuilder_adminmail) { ?>
											<input type="radio" name="formbuilder_adminmail" value="1" checked />
											<?php }else{ ?>
											<input type="radio" name="formbuilder_adminmail" value="1" />
											<?php } ?>
											<?php echo $text_yes; ?>
										  </label>
										  <label class="radio-inline">
											<?php if (!$formbuilder_adminmail) { ?>
											<input type="radio" name="formbuilder_adminmail" value="0" checked />
											<?php }else{ ?>
											<input type="radio" name="formbuilder_adminmail" value="0" />
											<?php } ?>
											<?php echo $text_no; ?>
										  </label>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="input-adminemail<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_adminemail; ?>"><?php echo $entry_email; ?></span></label>
										<div class="col-sm-10">
										  <input type="text" name="adminemail" value="<?php echo $adminemail; ?>" placeholder="<?php echo $entry_email; ?>" id="input-adminemail<?php echo $language['language_id']; ?>" class="form-control" />
										</div>
									</div>
									<ul class="nav nav-tabs" id="admin_language">
									<?php foreach ($languages as $language) { ?>
									<li><a href="#admin_language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
									</ul>
									<?php foreach ($languages as $language) { ?>
										<div class="tab-pane" id="admin_language<?php echo $language['language_id']; ?>">
										<div class="form-group">
											<label class="col-sm-2 control-label" for="input-adminsubject<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $entry_adminsubject; ?>"><?php echo $entry_subject; ?></span></label>
											<div class="col-sm-10">
											  <input type="text" name="formbuilder_email[<?php echo $language['language_id']; ?>][adminsubject]" value="<?php echo isset($formbuilder_email[$language['language_id']]) ? $formbuilder_email[$language['language_id']]['adminsubject'] : ''; ?>" placeholder="<?php echo $entry_adminsubject; ?>" id="input-adminsubject<?php echo $language['language_id']; ?>" class="form-control" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="input-adminmsg<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $entry_adminmsg; ?>"><?php echo $entry_msg; ?></span></label>
											<div class="col-sm-10">
											  <textarea name="formbuilder_email[<?php echo $language['language_id']; ?>][adminmsg]" rows="5" placeholder="<?php echo $entry_adminmsg; ?>" id="input-adminmsg<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($formbuilder_email[$language['language_id']]['adminmsg']) ? $formbuilder_email[$language['language_id']]['adminmsg'] : ''; ?></textarea>
											</div>
										</div>
									<?php } ?>
								</fieldset>
								</div>
							<div class="customermail">
								<fieldset>
									<legend><?php echo $text_customermail_Setting; ?></legend>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="input-recordresponse"><span data-toggle="tooltip" title="<?php echo $entry_customermail; ?>"><?php echo $entry_status; ?></span></label>
										<div class="col-sm-10">
										  <label class="radio-inline">
											<?php if ($formbuilder_customermail) { ?>
											<input type="radio" name="formbuilder_customermail" value="1" checked />
											<?php }else{ ?>
											<input type="radio" name="formbuilder_customermail" value="1" />
											<?php } ?>
											<?php echo $text_yes; ?>
										  </label>
										  <label class="radio-inline">
											<?php if (!$formbuilder_customermail) { ?>
											<input type="radio" name="formbuilder_customermail" value="0" checked />
											<?php }else{ ?>
											<input type="radio" name="formbuilder_customermail" value="0" />
											<?php } ?>
											<?php echo $text_no; ?>
										  </label>
										</div>
									</div>
									<ul class="nav nav-tabs" id="customer_language">
									<?php foreach ($languages as $language) { ?>
									<li><a href="#customer_language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
									<?php } ?>
									</ul>
									<?php foreach ($languages as $language) { ?>
										<div class="tab-pane" id="customer_language<?php echo $language['language_id']; ?>">
											<div class="form-group">
												<label class="col-sm-2 control-label" for="input-customersubject<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $entry_customersubject; ?>"><?php echo $entry_subject; ?></span></label>
												<div class="col-sm-10">
												  <input type="text" name="formbuilder_email[<?php echo $language['language_id']; ?>][customersubject]" value="<?php echo isset($formbuilder_email[$language['language_id']]) ? $formbuilder_email[$language['language_id']]['customersubject'] : ''; ?>" placeholder="<?php echo $entry_subject; ?>" id="input-customersubject<?php echo $language['language_id']; ?>" class="form-control" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label" for="input-customermsg<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $entry_customermsg; ?>"><?php echo $entry_msg; ?></span></label>
												<div class="col-sm-10">
												  <textarea name="formbuilder_email[<?php echo $language['language_id']; ?>][customermsg]" rows="5" placeholder="<?php echo $entry_customermsg; ?>" id="input-customermsg<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($formbuilder_email[$language['language_id']]['customermsg']) ? $formbuilder_email[$language['language_id']]['customermsg'] : ''; ?></textarea>
												</div>
											</div>
										</div>
									<?php } ?>
								</fieldset>
							</div>
						</div>
						<div class="col-sm-3">
						<div class="well" style="margin-top:16px;">
						<h3>Short Codes</h3>
						<p style="font-size:13px; margin:0;">
							[store_name] = Store Name<br/>
							[store_email] = Store Email<br/>
							[store_url] = Store URL<br/>
							[store_owner] = Store Owner<br/>
							[store_address] = Store Address<br/>
							[store_telephone] = Store Telephone<br/>
							[forum_data] = Form Data<br/>
						</p>
						</div>
					</div>
					</div>
					
				</div>
                
				</div>
			</div>
		</div>
         <input type="hidden" name="formbuilder_module_id" value="<?php echo $formbuilder_module_id; ?>" />
		 
        </form>
      </div>
    </div>
  </div>
</div>
<style>
.form_fields .panel-heading { padding: 5px; border:1px solid #ddd; cursor:move;}
.form_fields .panel-title > a {
	display: block;
	padding: 0.4em 0.6em;
    outline: none;
    text-decoration: none;
}
.form_fields .panel-default{
	border:none;
}
.form_fields .panel-body{
	border:1px solid #ddd;
}

</style>
<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
  <script type="text/javascript">
  $(document).ready(function() {
	// Override summernotes image manager
	$('.summernote').each(function() {
		var element = this;
		
		$(element).summernote({
			disableDragAndDrop: true,
			height: 200,
			emptyPara: '',
			toolbar: [
				['style', ['style']],
				['font', ['bold', 'underline', 'clear']],
				['fontname', ['fontname']],
				['color', ['color']],
				['para', ['ul', 'ol', 'paragraph']],
				['table', ['table']],
				['insert', ['link', 'image', 'video']],
				['view', ['fullscreen', 'codeview', 'help']]
			],
			buttons: {
    			image: function() {
					var ui = $.summernote.ui;

					// create button
					var button = ui.button({
						contents: '<i class="note-icon-picture" />',
						tooltip: $.summernote.lang[$.summernote.options.lang].image.image,
						click: function () {
							$('#modal-image').remove();
						
							$.ajax({
								url: 'index.php?route=common/filemanager&token=' + getURLVar('token'),
								dataType: 'html',
								beforeSend: function() {
									$('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
									$('#button-image').prop('disabled', true);
								},
								complete: function() {
									$('#button-image i').replaceWith('<i class="fa fa-upload"></i>');
									$('#button-image').prop('disabled', false);
								},
								success: function(html) {
									$('body').append('<div id="modal-image" class="modal">' + html + '</div>');
									
									$('#modal-image').modal('show');
									
									$('#modal-image').delegate('a.thumbnail', 'click', function(e) {
										e.preventDefault();
										
										$(element).summernote('insertImage', $(this).attr('href'));
																	
										$('#modal-image').modal('hide');
									});
								}
							});						
						}
					});
				
					return button.render();
				}
  			}
		});
	});
});
</script>
<script type="text/javascript"><!--
 var field_row = <?php echo $field_row; ?>;
 var claop='';
function addproducttab(){
	
	html  = '<div class="panel-group"  id="accordion' + field_row + '" role="tablist" aria-multiselectable="true">';
	html += '<div class="panel panel-primary">';
	html += '<div class="panel-heading">';
	html += '<h3 class="panel-title pull-left">';
	html += '<a data-toggle="collapse" href="#collapse' + field_row + '" aria-controls="collapse' + field_row + '"><i class="fa fa-minus-circle" onclick="$(\'#accordion' + field_row + '\').remove(); $(\'#accordion' + field_row + ' a:first\').tab(\'show\');"></i> <?php echo $tab_field; ?> ' + field_row + ' </a>';
	html += '</h3><div class="pull-right" style="padding:0 6px; margin-top:6px;"><i class="fa fa-arrows"></i></div>';
	html += '<div class="clearfix"></div>';
	html += '</div>';
	html += '<div id="collapse' + field_row + '" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading' + field_row + '">';
	html += '<div class="panel-body">';
	html += '  <ul class="nav nav-tabs" id="language' + field_row + '">';
    <?php foreach ($languages as $language) { ?>
    html += '<li class="active"><a href="#tab-field-' + field_row + '-language<?php echo $language['language_id']; ?>" data-toggle="tab"><?php if(VERSION >= '2.2.0.0') { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /><?php } else { ?> <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php } ?>  <?php echo $language['name']; ?></a></li>';
	<?php } ?>
	html += '  </ul>';

	html += '  <div class="tab-content">';

	<?php foreach ($languages as $language){ ?>
	html += '    <div class="tab-pane active" id="tab-field-' + field_row + '-language<?php echo $language['language_id']; ?>">';
	html += '      <div class="form-group">';
	html += '        <label class="col-sm-2 control-label" for="input-heading' + field_row + '-language<?php echo $language['language_id']; ?>"><?php echo $entry_field; ?></label>';
	html += '        <div class="col-sm-10"><input type="text" name="formbuilder_field[' + field_row + '][<?php echo $language['language_id']; ?>][name]" placeholder="<?php echo $entry_field; ?>" id="input-heading' + field_row + '-language<?php echo $language['language_id']; ?>" value="" class="form-control"/></div>';
	html += '      </div>';
	html += '      <div class="form-group">';
	html += '        <label class="col-sm-2 control-label" for="input-placeholder' + field_row + '-language<?php echo $language['language_id']; ?>"><?php echo $entry_placeholder; ?></label>';
	html += '        <div class="col-sm-10"><input type="text" name="formbuilder_field[' + field_row + '][<?php echo $language['language_id']; ?>][placeholder]" placeholder="<?php echo $entry_placeholder; ?>" id="input-placeholder' + field_row + '-language<?php echo $language['language_id']; ?>" value="" class="form-control"/></div>';
	html += '      </div>';
	html += '      <div class="form-group">';
	html += '        <label class="col-sm-2 control-label" for="input-errormsg' + field_row + '-language<?php echo $language['language_id']; ?>"><?php echo $entry_errormsg; ?></label>';
	html += '        <div class="col-sm-10"><input type="text" name="formbuilder_field[' + field_row + '][<?php echo $language['language_id']; ?>][errormsg]" placeholder="<?php echo $entry_errormsg; ?>" id="input-errormsg' + field_row + '-language<?php echo $language['language_id']; ?>" value="" class="form-control"/></div>';
	html += '      </div>';
	html += '    </div>';
	<?php } ?>

	html += '  </div> <input type="hidden" name="formbuilder_field[' + field_row + '][sort_order]" value="" class="form-control setsortorder"/>';
	html += '<div class="form-group">';
	html += '<label class="col-sm-2 control-label" for="input-column'+field_row+'"><?php echo $entry_column; ?></label>';
	html += '<div class="col-sm-10">';
	html += '<select name="formbuilder_field['+ field_row  +'][column]" id="input-column<?php echo $field_row; ?>" class="form-control">';
	html += '<option value="1" selected="selected">Column 1</option>';
	html += '<option value="2" >Column 2</option>';
	html += '<option value="3">Column 3</option>';
	html += ' </select>';
	html += ' </div>';
	html += ' </div>';
	html += ' <div class="form-group">';
	html += '<label class="col-sm-2 control-label" for="input-status'+field_row+'"><?php echo $entry_status; ?></label>';
	html += '<div class="col-sm-10">';
	html += '<select name="formbuilder_field['+ field_row  +'][status]" id="input-status<?php echo $field_row; ?>" class="form-control">';
	html += '<option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
	html += '<option value="0"><?php echo $text_disabled; ?></option>';
	html += ' </select>';
	html += ' </div>';
	html += ' </div>';
	html += ' <div class="form-group">';
	html += '<label class="col-sm-2 control-label" for="input-type'+field_row+'"><?php echo $entry_type; ?></label>';
	html += '<div class="col-sm-10">';
	html += '<select rel="'+field_row+'" name="formbuilder_field['+ field_row  +'][type]" id="input-type'+field_row+'" class="form-control">';
	html += '<optgroup label="<?php echo $text_choose; ?>">';
	html += '<option value="select"><?php echo $text_select; ?></option>';
	html += '<option value="radio"><?php echo $text_radio; ?></option>';
	html += '<option value="checkbox"><?php echo $text_checkbox; ?></option>';
	html += ' </optgroup>';
	html += ' <optgroup label="<?php echo $text_input; ?>">';
	html += ' <option value="text"><?php echo $text_text; ?></option>';
	html += ' <option value="textarea"><?php echo $text_textarea; ?></option>';
	html += ' <option value="number"><?php echo $text_number; ?></option>';
	html += ' <option value="email">Email</option>';
	html += ' <option value="password"><?php echo $text_password; ?></option>';
	html += ' </optgroup>';
	html += ' <optgroup label="<?php echo $text_file; ?>">';
	html += ' <option value="file"><?php echo $text_file; ?></option>';
	html += ' </optgroup>';
	html += ' <optgroup label="<?php echo $text_date; ?>">';
	html += ' <option value="date"><?php echo $text_date; ?></option>';
	html += ' <option value="time"><?php echo $text_time; ?></option>';
	html += ' <option value="datetime"><?php echo $text_datetime; ?></option>';
	html += ' </optgroup>';
	html += ' <optgroup label="<?php echo $text_localisation; ?>">';
	html += ' <option value="country"><?php echo $text_country; ?></option>';
	html += ' <option value="zone"><?php echo $text_zone; ?></option>';
	html += ' </optgroup>';
	html += ' </select>';
	html += ' </div>';
	html += ' </div>';
	html += '<div class="hide optionvalue_'+field_row+'">';
								html += '<div class="form-group ">';
									html += '<label class="col-sm-2 control-label" for="input-field-value"><?php echo 'Field Value'; ?></label>';
										html += '	<div class="table-responsive">';
											html += '	<table class="table table-bordered">';
											html += '		<thead>';
													html += '	<tr>';
														html += '	<td>Field Value Name</td>';
														html += '	<td>Sort Order</td>';
														html += '	<td>Action</td>';
														html += '</tr>';
												html += '	</thead>';
													html += '<tbody></tbody>';
													html += '<tfoot>';
														html += '<tr>';
														
														html += '	<td colspan="2"><a onclick="addChildx('+field_row+');" class="btn btn-primary"><i class="fa fa-plus"></i></a></td>';
														html += '</tr>';
													html += '</tfoot>';
												html += '</table>';
											html += '</div>';
										html += '</div>';
									html += '</div>';
									html += '<input type="hidden" id="input-value'+field_row+'" value=""/><div class="hide form-group otherfeilds_'+field_row+'">';
									html += '</div>';
	html += ' <div class="form-group">';
    html += ' <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_required; ?></label>';
    html += '<div class="col-sm-10">';
    html += '<select name="formbuilder_field['+ field_row  +'][required]" id="input-required" class="form-control">" id="input-sort-order" class="form-control" />';
    html += '<option value="1" selected="selected"><?php echo $text_yes; ?></option>';
    html += '<option value="0"><?php echo $text_no; ?></option>';
    html += '</select>';
    html += '</div>';
    html += '</div>';
	html += '</div>';
	html += '</div>';
	html += '</div>';
	html += '</div>';
	
	$('#tab-field .form_fields').append(html);
	
	
	$('select[id^=\'input-type\']').on('change', function() {
	 current_row = $(this).attr('rel');
	 if (this.value == 'select' || this.value == 'radio' || this.value == 'checkbox') {
		$('.optionvalue_'+current_row).removeClass('hide');
		$('.otherfeilds_'+current_row).addClass('hide');
	 } else {
		$('.optionvalue_'+current_row).addClass('hide');
		$('.otherfeilds_'+current_row).removeClass('hide');
		if (this.value == 'date') {
			$('.otherfeild_'+current_row).html('<label class="col-sm-2 control-label" for="input-value"><?php echo $entry_value; ?></label><div class="col-sm-10"><div class="input-group date"><input type="text" name="formbuilder_field['+current_row+'][value]" value="' + $('#input-value'+current_row).val() + '" placeholder="<?php echo $entry_value; ?>" data-date-format="YYYY-MM-DD"  class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>');
		} else if (this.value == 'time') {
			$('.otherfeild_'+current_row).html('<label class="col-sm-2 control-label" for="input-value"><?php echo $entry_value; ?></label><div class="col-sm-10"><div class="input-group time"><input type="text" name="formbuilder_field['+current_row+'][value]" value="' + $('#input-value'+current_row).val() + '" placeholder="<?php echo $entry_value; ?>" data-date-format="HH:mm"  class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>');
		} else if (this.value == 'datetime') {
			$('.otherfeild_'+current_row).html('<label class="col-sm-2 control-label" for="input-value"><?php echo $entry_value; ?></label><div class="col-sm-10"><div class="input-group datetime"><input type="text"name="formbuilder_field['+current_row+'][value]" value="' + $('#input-value'+current_row).val() + '" placeholder="<?php echo $entry_value; ?>" data-date-format="YYYY-MM-DD HH:mm" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>');
		} else if (this.value == 'textarea') {
			$('.otherfeild_'+current_row).html('<label class="col-sm-2 control-label" for="input-value"><?php echo $entry_value; ?></label><div class="col-sm-10"><textarea name="formbuilder_field['+current_row+'][value]" placeholder="<?php echo $entry_value; ?>"  class="form-control">' + $('#input-value'+current_row).val() + '</textarea></div>');
		} else if (this.value == 'country' || this.value == 'zone') {
			$('.otherfeilds_'+current_row).html('');
		} else {
			$('.otherfeild_'+current_row).html('<label class="col-sm-2 control-label" for="input-value"><?php echo $entry_value; ?></label><div class="col-sm-10"><input type="text" name="formbuilder_field['+current_row+'][value]" value="' + $('#input-value'+current_row).val() + '" placeholder="<?php echo $entry_value; ?>"  class="form-control" /></div>');
		}
		
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
	}
	});
	$('select[id^=\'input-type\']').trigger('change');
	
	$('#tab-field #language' + field_row + ' li:first-child a').tab('show');
	
	field_row++;
}

$(".form_fields").sortable({
	cursor: "move",
	stop: function() {
		$('.form_fields .panel-group').each(function() {
			$(this).find('.setsortorder').val($(this).index());
		});
	}
});

$('select[id^=\'input-type\']').on('change', function() {
	 current_row = $(this).attr('rel');
	 if (this.value == 'select' || this.value == 'radio' || this.value == 'checkbox') {
		$('.optionvalue_'+current_row).removeClass('hide');
		$('.otherfeilds_'+current_row).addClass('hide');
	 } else {
		$('.optionvalue_'+current_row).addClass('hide');
		$('.otherfeilds_'+current_row).removeClass('hide');
		if (this.value == 'date') {
			$('.otherfeild_'+current_row).html('<label class="col-sm-2 control-label" for="input-value"><?php echo $entry_value; ?></label><div class="col-sm-10"><div class="input-group date"><input type="text" name="formbuilder_field['+current_row+'][value]" value="' + $('#input-value'+current_row).val() + '" placeholder="<?php echo $entry_value; ?>" data-date-format="YYYY-MM-DD"  class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>');
		} else if (this.value == 'time') {
			$('.otherfeild_'+current_row).html('<label class="col-sm-2 control-label" for="input-value"><?php echo $entry_value; ?></label><div class="col-sm-10"><div class="input-group time"><input type="text" name="formbuilder_field['+current_row+'][value]" value="' + $('#input-value'+current_row).val() + '" placeholder="<?php echo $entry_value; ?>" data-date-format="HH:mm"  class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>');
		} else if (this.value == 'datetime') {
			$('.otherfeild_'+current_row).html('<label class="col-sm-2 control-label" for="input-value"><?php echo $entry_value; ?></label><div class="col-sm-10"><div class="input-group datetime"><input type="text"name="formbuilder_field['+current_row+'][value]" value="' + $('#input-value'+current_row).val() + '" placeholder="<?php echo $entry_value; ?>" data-date-format="YYYY-MM-DD HH:mm" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>');
		} else if (this.value == 'textarea') {
			$('.otherfeild_'+current_row).html('<label class="col-sm-2 control-label" for="input-value"><?php echo $entry_value; ?></label><div class="col-sm-10"><textarea name="formbuilder_field['+current_row+'][value]" placeholder="<?php echo $entry_value; ?>"  class="form-control">' + $('#input-value'+current_row).val() + '</textarea></div>');
		} else if (this.value == 'country' || this.value == 'zone') {
			$('.otherfeilds_'+current_row).html('');
		} else {
			$('.otherfeild_'+current_row).html('<label class="col-sm-2 control-label" for="input-value"><?php echo $entry_value; ?></label><div class="col-sm-10"><input type="text" name="formbuilder_field['+current_row+'][value]" value="' + $('#input-value'+current_row).val() + '" placeholder="<?php echo $entry_value; ?>"  class="form-control" /></div>');
		}
		
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
	}
});

$('select[id^=\'input-type\']').trigger('change');

var sub_row	= '<?php $sub_row; ?>';
function addChild(cls,row){
	html = '<tr id="sub_row'+ row +'-'+ sub_row+'">';
	html += '<td>';
	 <?php foreach ($languages as $language) { ?>
	html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span><input type="text" class="form-control" name="formbuilder_field['+ row +'][optionvalue]['+ sub_row +'][<?php echo $language['language_id']; ?>][value]" placeholder="Value" />';
	 <?php } ?>
	html += '</td>';
	html += '<td><input type="text" class="form-control" name="formbuilder_field['+ row +'][optionvalue]['+ sub_row +'][sort_order]" placeholder="sort_order" value="" /></td>';
	html += '<td><a onclick="$(this).tooltip(\'destroy\');$(\'#sub_row' + row +'-'+ sub_row+'\').remove();" data-toggle="tooltip" rel="tooltip" class="btn btn-danger"><i class="fa fa-trash"></i></a></td></tr>';
	
	$('.'+cls+' tbody').append(html);
	sub_row++;
}
function addChildx(row){
	cls = 'optionvalue_'+row;
	html = '<tr id="sub_row'+ row +'-'+ sub_row+'">';
	html += '<td>';
	 <?php foreach ($languages as $language) { ?>
	html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span><input type="text" class="form-control" name="formbuilder_field['+ row +'][optionvalue]['+ sub_row +'][<?php echo $language['language_id']; ?>][value]" placeholder="Value" />';
	 <?php } ?>
	 html += '</td>';
	html += '<td><input type="text" class="form-control" name="formbuilder_field['+ row +'][optionvalue]['+ sub_row +'][sort_order]" placeholder="sort_order" value="" /></td>';
	html += '<td><a onclick="$(this).tooltip(\'destroy\');$(\'#sub_row' + row +'-'+ sub_row+'\').remove();" data-toggle="tooltip" rel="tooltip" class="btn btn-danger"><i class="fa fa-trash"></i></a></td></tr>';
	
	$('.'+cls+' tbody').append(html);
	sub_row++;
}

/* 
$('input[name="formbuilder_adminmail"]').on('change',function(){
	var value = this.value;
	simple(value);
});

function simple(value){
	if(value=='1'){
		$('.adminmail').removeClass('hide');
	}else{
		$('.adminmail').addClass('hide');
	}
}


$('input[name="formbuilder_customermail"]').on('change',function(){
	var values = this.value;
	simples(values);
});

function simples(values){
	if(values=='1'){
		$('.customermail').removeClass('hide');
	}else{
		$('.customermail').addClass('hide');
	}
} */

//--></script>
<script type="text/javascript"><!--
<?php foreach($formbuilder_field as $key => $fields){  ?>
$('#tab-field #language<?php echo $key; ?> li:first-child a').tab('show');
<?php } ?>
$('#tab-mail #language li:first-child a').tab('show');
$('#successlanguage li:first-child a').tab('show');
$('#admin_language li:first-child a').tab('show');
$('#customer_language li:first-child a').tab('show');
$('#languages li:first-child a').tab('show');
//--></script>
<?php echo $footer; ?>