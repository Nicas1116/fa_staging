<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-product" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $atitle; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product" class="form-horizontal">
        	<div class="form-group">
            <label class="col-sm-2 control-label" for="input-status">Status</label>
            <div class="col-sm-10">
              <select name="store_status" id="input-status" class="form-control">
               	<?php if ($outlet_status) { ?>
                    <option value="1" selected="selected">Enabled</option>
                	<option value="0">Disabled</option>
                    <?php } else { ?>
                    <option value="1">Enabled</option>
                	<option value="0"  selected="selected">Disabled</option>
                    <?php } ?>
                
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status">Outlet Name</label>
            <div class="col-sm-10">
    			<input type="text" name="outlet_name" value="<?php echo $outlet_name; ?>"  class="form-control" placeholder="Outlet Name">
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status">Outlet Address</label>
            <div class="col-sm-10">
    			<input type="text" name="outlet_address" onchange="getCoordinate();" value="<?php echo $outlet_address; ?>" class="form-control outlet_address" placeholder="Outlet Address">
    			<a onclick="getCoordinate();" class="btn btn-success">GET COORDINATE</a>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status">Outlet Contact</label>
            <div class="col-sm-10">
    			<input type="text" name="outlet_contact" value="<?php echo $outlet_contact; ?>" class="form-control" placeholder="Outlet Contact">
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status">Outlet Operating Hours</label>
            <div class="col-sm-10">
    			<input type="text" name="outlet_ophour" value="<?php echo $outlet_ophour; ?>" class="form-control" placeholder="Outlet Operating Hours">
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status">Outlet Coordinate </label>
            <div class="col-sm-10">
    			<input type="text" name="outlet_coord" value="<?php echo $outlet_coordinate; ?>" class="form-control outlet_coordinate" placeholder="Outlet Coordinate X, Coordinate Y">
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status">Outlet States </label>
            <div class="col-sm-10">
    			<input type="text" name="outlet_states" value="<?php echo $outlet_states; ?>" class="form-control" placeholder="Outlet States">
            </div>
          </div>
          <div id="map"></div>
        </form>
    </div>

    </div>
</div>
</div>

<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
  <script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>
  <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC8kYEryxSm7uJ05-TKKKiXr3MMCusdenA&callback=initMap">
    </script>
    <script type="text/javascript">
    	var geocoder;
  	function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 8,
          center: {lat: -34.397, lng: 150.644}
        });
        geocoder = new google.maps.Geocoder();
      }
    	function getCoordinate(){
    		var address = $(".outlet_address").val();
    		geocoder.geocode({'address': address}, function(results, status) {
	          if (status === 'OK') {
	          	console.log(results[0].geometry.location);

	          	var location = results[0].geometry.location;
	          	$(".outlet_coordinate").val(location.lat()+","+location.lng());
	            /*resultsMap.setCenter(results[0].geometry.location);
	            var marker = new google.maps.Marker({
	              map: resultsMap,
	              position: results[0].geometry.location
	            });*/
	          } else {
	            alert('Geocode was not successful for the following reason: ' + status);
	          }
	        });
    	}
    </script>