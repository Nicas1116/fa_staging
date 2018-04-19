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
      <h2 class="faq_header"><?php echo $heading_title; ?></h2>
      <div class="bline"></div>
      <ul class="shipping_detail">
        <li>Delivery arrangement is made upon confirmation of payment received within seven (7) working days.</li>
        <li>During festive seasons whereby delivery commitments are at its peak, you will be advised the next best delivery time.   If the recipient is not at home, has returned to his or her hometown, changed address or gone overseas, the hamper  will be delivered after the festive season.</li>
        <li>Any re-direct zone or re-send product will be charged with a minimum fee of RM20.</li>
        <li>Any cancellation of orders after confirmation will be subjected to a surcharge of 100% of the confirmed orders.</li>
        <li>All items paid are non-refundable and non-exchangeable.</li>
        <li>As all daily deliveries are scheduled to multiple locations, specific time delivery requested might vary from time to   time.</li>
        <li>Free delivery service per address for hamper worth RM299 and above is applicable within Free Delivery Zone.</li>
        <li>Delivery schedule does not apply to Sunday and gazetted Public Holidays.</li>
        <li>Delivery outside Free Delivery Zone, please refer to delivery charges guideline. Destinations not stated, please  contact our customer service.</li>
        <li>All payments by cheque or others must be cleared prior to delivery or collection of goods.</li>
      </ul>
    </div>
     <h3 class="faq_header">Delivery Zones</h3>
      <div class="cline"></div>
       <?php echo $delivery_zone ?>
      <?php echo $content_bottom; ?></div>
   </section>	
		<?php echo $column_right; ?></div>
</div>
<style type="text/css">#header-bottom{display: none;}#header-main{padding-bottom: 0px;border-bottom: solid 1px #e3e3e3;}</style>
<?php echo $footer; ?>
