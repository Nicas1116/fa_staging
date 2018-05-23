<?php 
    
    $mode = 'default';
    $cols = array( 'default' => array(5,7),
                   'horizontal' => array(4,6)
    ); 
    $cols = $cols[$mode];   
?>
<style type="text/css">
    .thumbnail{border:none;}
</style>
<div class="product-info promotion-info">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <h1 class="title-product"><?php echo $heading_title; ?></h1> 
</div>
</div>
    <div class="row">
        <?php if ($thumb || $images) { ?>
<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 image-container">
    <?php if ($thumb) { ?>
    <div id="img-detail" class="image thumbnail">
        <?php if( isset($date_available) && $date_available == date('Y-m-d')) {   ?>            
        <span class="product-label product-label-new">
            <span><?php echo 'New'; ?></span>  
        </span>                                             
        <?php } ?>  
        <?php if( $special )  { ?>          
            <span class="product-label product-label-special exist">
                <span class="product-label-special"><?php echo 'Sale'; ?></span>
            </span>
        <?php } ?>

        <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="imagezoom ">
            <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-zoom-image="<?php echo $popup; ?>" class="product-image-zoom img-responsive"/>
        </a>

    </div>
    <?php } ?>

     <div class="thumbs-preview">
        <?php if ($images) { ?>
         <div class="image-additional slide carousel horical" id="image-additional">
            <div id="image-additional-carousel" class="carousel-inner thumbnails">
                <?php 
                if( $productConfig['product_zoomgallery'] == 'slider' && $thumb ) {  
                    $eimages = array( 0=> array( 'popup'=>$popup,'thumb'=> $thumb )  ); 
                    $images = array_merge( $eimages, $images );
                }
                $icols = 4; $i= 0;
                foreach ($images as  $image) { ?>
                    <?php if( (++$i)%$icols == 1 ) { ?>
                    <div class="item clearfix">
                    <?php } ?>
                        <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="imagezoom ">
                            <img src="<?php echo $image['thumb']; ?>" style="max-width:<?php echo $config->get('theme_default_image_additional_width');?>px"  title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-zoom-image="<?php echo $image['popup']; ?>" class="product-image-zoom img-responsive" />
                        </a>
                    <?php if( $i%$icols == 0 || $i==count($images) ) { ?>
                    </div>
                  <?php } ?>
                <?php } ?>      
            </div>

            <!-- Controls -->
            <?php
            if(count($images)>$icols){
            ?>
            <a class="left carousel-control" href="#image-additional" data-slide="prev">
                <i class="fa fa-angle-right"></i>
            </a>
            <a class="carousel-control right" href="#image-additional" data-slide="next">
                <i class="fa fa-angle-left"></i>
            </a>
            <?php } ?>
        </div>     

        <script type="text/javascript">
            $('#image-additional .item:first').addClass('active');
            $('#image-additional').carousel({interval:false})
        </script>
        <?php } ?> 
    </div>
    
</div>          
<?php } ?>


   
    <div class="product-view col-xs-12 col-sm-12 col-md-5 col-lg-5 ?>">
        <p class="description"><?php echo $description; ?></p>
        
    </div>
</div>

</div>

