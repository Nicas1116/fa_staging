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
           <div class="col-lg-4 col-md-4 col-xs-12">
            <div class="locateus_box">
             <h2>Locate us</h2>
             <p>By State 
              <select  class="state">
                <?php foreach ($states as $key => $value) { ?>
                 <option value="<?php echo $value["value"] ?>" <?php echo ($value["value"]=="selangor") ? "selected" : ""; ?>><?php echo $value["name"] ?></option>
                <?php } ?>
             </select>
             </p>
           </div>
           <div class="locateus_storeslist">
              <?php 
              $m=0;
              foreach ($products as $key => $value) { ?>
                 <div class="marker-<?php echo $value["outlet_id"]; ?> <?php echo $value["class"]; ?> locateus_store <?php echo ($m==0) ? "active" : ""; ?>" data-marker-id="marker-<?php echo $value["outlet_id"]; ?>">
                <h4><?php echo $value["outlet_name"]; ?></h4>
                <p><?php echo $value["outlet_address"]; ?></p>
                <i class="fa fa-angle-right"></i>
              </div>
              <?php $m++;}
              ?>
           </div>
           </div>
          <div class="col-lg-8 col-md-8 col-xs-12">
      <div class="contact-location">
        <div id="contact-map"></div>
      </div></div>
</div>
    </div>
      <?php echo $content_bottom; ?></div>
   </section>	
		<?php echo $column_right; ?></div>
</div>
<style type="text/css">.locateus_storeslist{}#header-bottom{display: none;}#header-main{padding-bottom: 0px;border-bottom: solid 1px #e3e3e3;}.borderlo > div{padding: 0px;}</style>

 <?php // Jquery googlemap api v3?>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDj2QuD0yW1Kk3t_lgToAQkbdjjpGHVYho&v=3.exp&sensor=false&language=en"></script>
    <script type="text/javascript" src="catalog/view/javascript/gmap/gmap3.min.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/gmap/gmap3.infobox.js"></script>
    <script type="text/javascript">
      $(document).ready(function(){
        $(".state").change(function(){
          $(".locateus_store").hide();
          $("."+$(".state").val()).show()
        })
         

        $(".locateus_store").click(function(){
          $(".locateus_store").removeClass("active");
          $(this).addClass("active");
          $("#contact-map").gmap3({
              get: {
                name:"marker",
                tag: $(this).attr("data-marker-id"),
                all: true,
                callback: function(objs){
                  console.log(objs);
                  if(objs.length>0){
                    google.maps.event.trigger(objs[0], 'click');
                  }
                }
              }
            });
          //google.maps.event.trigger(ourMarker, 'click');
        })
      })
        var mapDiv, map, infobox;
        var lat ='3.0726';
        var lon ='101.6068';
        jQuery(document).ready(function($) {
            mapDiv = $("#contact-map");
            mapDiv.height(800).gmap3({
                map:{
                    options:{
                        center:[lat,lon],
                        zoom: 15
                    }
                },
                marker:
                {
                    values:[
                    <?php foreach ($products as $key => $value) { ?>
                      {tag:"marker-<?php echo $value["outlet_id"]; ?>",latLng:[<?php echo $value["outlet_coordinate"]; ?>], data:"<div class='mapstores'><h3><?php echo $value["outlet_name"]; ?></h3><p><?php echo $value["outlet_address"]; ?></p><img src='/image/others/storesphoto.jpg'/><div class='dphone'><?php echo $value["outlet_contact"]; ?></div><div class='optime'><?php echo $value["outlet_ophour"]; ?></div><a href='https://www.google.com.my/maps/search/<?php echo $value["outlet_address"]; ?>' target='_blank' class='buttongetdirection'>Get Directions</a></div>"},
                    <?php } ?>
                        
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
            $(".locateus_store").hide();
          $("."+$(".state").val()).show()
          $(".locateus_store").removeClass("active");
          $(".marker-6").addClass("active");
          $("#contact-map").gmap3({
              get: {
                name:"marker",
                tag: "marker-6",
                all: true,
                callback: function(objs){
                  if(objs.length>0){
                    google.maps.event.trigger(objs[0], 'click');
                  }
                }
              }
            });
        });
    </script>
    <?php //end contact map ?>
<?php echo $footer; ?>
