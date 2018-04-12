<?php 

 echo $header; ?> <?php require( ThemeControlHelper::getLayoutPath( 'common/mass-header.tpl' )  ); ?>
<div class="container">
  <?php //require( ThemeControlHelper::getLayoutPath( 'common/mass-container.tpl' )  ); ?>

  
				<?php echo $column_left; ?> 
  
   <div id="sidebar-main" class="col-md-<?php echo $SPAN[1];?>">
    <div id="content"><?php echo $content_top; ?>
      <div class="row">
        <div class="col-xs-12 promotion_content">
   <h2 class="head_title">Promotion</h2>
      <?php if ($products) { ?>
      <?php //require( ThemeControlHelper::getLayoutPath( 'product/product_filter.tpl' ) );   ?>
     
      <?php require( ThemeControlHelper::getLayoutPath( 'common/promotion_collection.tpl' ) );  ?> 
   
      <?php } else { ?>
      <div class="content"><div class="wrapper"><?php echo $text_empty; ?></div></div>
        <div class="buttons">
          <div class="right"><a href="<?php echo $continue; ?>" class="button btn btn-default"><?php echo $button_continue; ?></a></div>
        </div>
        <?php } ?>
</div>
      
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>