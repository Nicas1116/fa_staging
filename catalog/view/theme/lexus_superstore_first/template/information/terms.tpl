<?php
    $config = $sconfig;
    $theme  = $themename;
    $themeConfig = (array)$config->get('themecontrol');
?>
<?php  echo $header; ?> <?php require( ThemeControlHelper::getLayoutPath( 'common/mass-header.tpl' )  ); ?>

<?php  $config = $sconfig;   

        $themeConfig = (array)$config->get('themecontrol') ?>
<div class="container">
    
  <?php require( ThemeControlHelper::getLayoutPath( 'common/mass-container.tpl' )  ); ?>
  <div class="row">
    <?php echo $column_left; ?>
   <section id="sidebar-main" class="col-md-<?php echo $block[0];?>"><div id="content"><?php echo $content_top; ?>
      <h2 class="privacy_header"><?php echo $heading_title; ?></h2>
      <div class="termscontainer">
        <ul>
       <li>All hampers or gift packs will only be delivered after full payment being made and confirmed by our   management.</li>
        <li>For delivery service details, please click Delivery Service.</li>
        <li> All hampers or gift packs ordered must be at least RM199 for each delivery address.</li>
        <li> For bulk purchases, please contact our customer service.</li>
        <li> All prices stated are valid for cookie flavours of Chocolate Chip Pecan and Chocolate Chip No Nut only.   Other cookie flavours selected are subject to additional charges.</li>
        <li> In the event if a product or products are not available at time of order, Famous Amos reserves the rights to  substitute unavailable products with similar product of equal value.</li>
        <li> Famous Amos cannot be held responsible for any typographical errors or omission that may occurs and   such error or omission are subject to correction.</li>
        <li>All prices stated are correct and Famous Amos reserves the rights to change the prices without prior notice.</li>
        </ul>
         
      </div>
    </div>
      <?php echo $content_bottom; ?></div>
   </section>	
		<?php echo $column_right; ?></div>
</div>
<style type="text/css">#header-bottom{display: none;}#header-main{padding-bottom: 0px;border-bottom: solid 1px #e3e3e3;}</style>
<?php echo $footer; ?>
