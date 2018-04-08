<?php
    $config = $sconfig;
    $theme  = $themename;
    $themeConfig = (array)$config->get('themecontrol');
?>
<?php  echo $header; ?> <?php //require( ThemeControlHelper::getLayoutPath( 'common/mass-header.tpl' )  ); ?>

<?php  $config = $sconfig;   

        $themeConfig = (array)$config->get('themecontrol') ?>
<div class="container">
    
  <?php //require( ThemeControlHelper::getLayoutPath( 'common/mass-container.tpl' )  ); ?>
  <div class="row">
				<?php echo $column_left; ?>
  
   <section id="sidebar-main" class="col-md-12"><div id="content"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <div class="wrapper">
        <div class="row borderlo">
           <div class="col-xs-4">
            <div class="locateus_box">
             <h2>Locate us</h2>
             <p>By State 
              <select  class="state">
                <option value="selangor">Selangor</option>
             </select>
             </p>
           </div>
           <div class="locateus_storeslist">
              <div class="locateus_store active">
                <h4>Sunway Pyramid</h4>
                <p>LG2.K12 & LG2.K12A, Lower Ground Two, No 3, Jalan PJS 11/15, Bandar Sunway, 46151 Petaling Jaya, Selangor.</p>
                <i class="fa fa-angle-right"></i>
              </div>
              <div class="locateus_store">
                <h4>Sunway Pyramid</h4>
                <p>LG2.K12 & LG2.K12A, Lower Ground Two, No 3, Jalan PJS 11/15, Bandar Sunway, 46151 Petaling Jaya, Selangor.</p>
                <i class="fa fa-angle-right"></i>
              </div>
              <div class="locateus_store">
                <h4>Sunway Pyramid</h4>
                <p>LG2.K12 & LG2.K12A, Lower Ground Two, No 3, Jalan PJS 11/15, Bandar Sunway, 46151 Petaling Jaya, Selangor.</p>
                <i class="fa fa-angle-right"></i>
              </div>
              <div class="locateus_store">
                <h4>Sunway Pyramid</h4>
                <p>LG2.K12 & LG2.K12A, Lower Ground Two, No 3, Jalan PJS 11/15, Bandar Sunway, 46151 Petaling Jaya, Selangor.</p>
                <i class="fa fa-angle-right"></i>
              </div>
              <div class="locateus_store">
                <h4>Sunway Pyramid</h4>
                <p>LG2.K12 & LG2.K12A, Lower Ground Two, No 3, Jalan PJS 11/15, Bandar Sunway, 46151 Petaling Jaya, Selangor.</p>
                <i class="fa fa-angle-right"></i>
              </div>
              <div class="locateus_store">
                <h4>Sunway Pyramid</h4>
                <p>LG2.K12 & LG2.K12A, Lower Ground Two, No 3, Jalan PJS 11/15, Bandar Sunway, 46151 Petaling Jaya, Selangor.</p>
                <i class="fa fa-angle-right"></i>
              </div>
           </div>
           </div>
          <div class="col-xs-8">
      <div class="contact-location">
        <div id="contact-map"></div>
      </div></div>
</div>
    </div>
      <?php echo $content_bottom; ?></div>
   </section>	
		<?php echo $column_right; ?></div>
</div>
<style type="text/css">#header-bottom{display: none;}#header-main{padding-bottom: 0px;border-bottom: solid 1px #e3e3e3;}</style>

 <?php // Jquery googlemap api v3?>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDj2QuD0yW1Kk3t_lgToAQkbdjjpGHVYho&v=3.exp&sensor=false&language=en"></script>
    <script type="text/javascript" src="catalog/view/javascript/gmap/gmap3.min.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/gmap/gmap3.infobox.js"></script>
    <script type="text/javascript">
        var mapDiv, map, infobox;
        var lat = <?php echo isset($themeConfig['location_latitude'])?$themeConfig['location_latitude']:'40.705423'; ?>;
        var lon = <?php echo isset($themeConfig['location_longitude'])?$themeConfig['location_longitude']:'-74.008616'; ?>;
        jQuery(document).ready(function($) {
            mapDiv = $("#contact-map");
            mapDiv.height(800).gmap3({
                map:{
                    options:{
                        center:[lat,lon],
                        zoom: 15
                    }
                },
                marker:{
                    values:[
                        {latLng:[lat, lon], data:"<div class='mapstores'><h3>Sunway Pyramid</h3><p>LG2.K12 & LG2.K12A, Lower Ground Two, No 3, Jalan PJS 11/15, Bandar Sunway, 46151 Petaling Jaya, Selangor.</p><img src='/fa/staging/image/others/storesphoto.jpg'/><div class='dphone'>03-56365187</div><div class='optime'>10am - 10pm</div><button>Get Directions</button></div>"},
                    ],
                    options:{
                        draggable: false
                    },
                    events:{
                          click: function(marker, event, context){
                            var map = $(this).gmap3("get"),
                                infowindow = $(this).gmap3({get:{name:"infowindow"}});
                            if (infowindow){
                                infowindow.open(map, marker);
                                infowindow.setContent(context.data);
                            } else {
                                $(this).gmap3({
                                infowindow:{
                                    anchor:marker, 
                                    options:{content: context.data}
                                }
                              });
                            }
                        }/*,
                        mouseout: function(){
                            var infowindow = $(this).gmap3({get:{name:"infowindow"}});
                            if (infowindow){
                                infowindow.close();
                            }
                        }*/
                    }
                }
            });
        });
    </script>
    <?php //end contact map ?>
<?php echo $footer; ?>
