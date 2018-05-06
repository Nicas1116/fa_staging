<?php 
  /*
  * @package Framework for Opencart 2.0
  * @version 2.0
  * @author http://www.pavothemes.com
  * @copyright Copyright (C) Feb 2013 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
  * @license   GNU General Public License version 2
  */
  require_once(DIR_SYSTEM . 'pavothemes/loader.php');


  $helper->loadFooterModules();
  $layoutID = 1 ;
?>
 
<!-- 
  $ospans: allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
 -->

<?php if( !($helper->getConfig('enable_pagebuilder') && $helper->isHomepage())  ){ ?>

<?php
  $blockid = 'mass_bottom';
  $blockcls = '';
  $modules = $helper->getModulesByPosition( $blockid ); 
  $ospans = array();
  require( ThemeControlHelper::getLayoutPath( 'common/block-cols.tpl' ) );
?>

<?php } ?>
 
<footer id="footer">
 
  <?php
  
    $blockid = 'footer_top';
    $blockcls = '';
    $ospans = array();
    require( ThemeControlHelper::getLayoutPath( 'common/block-footcols.tpl' ) );
  
  ?>



  <?php
    $blockid = 'footer_center';
    $blockcls = '';
    $ospans = array(1=>3,2=>3,3=>3,4=>3);
    require( ThemeControlHelper::getLayoutPath( 'common/block-footcols.tpl' ) );
  ?>
  <?php if( count($modules) <=0 ) { ?>
  <div class="footer-link">
    <div class="container">
        <div class="row">
          <div class="col-md-3 col-sm-6 col-xs-12">
              <ul class="list-unstyled">
                 <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                  <li><a href="<?php echo $faq; ?>"><?php echo $text_faq; ?></a></li>
                  <li><a href="<?php echo $shipping; ?>"><?php echo $text_shipping; ?></a></li>
            </ul>
          </div>
          <div class="col-md-3 col-sm-6 col-xs-12">
            <ul class="list-unstyled">
              <li><a href="<?php echo $aboutus; ?>"><?php echo $text_aboutus; ?></a></li>
              <li><a href="<?php echo $storelocator; ?>"><?php echo $text_storelocator; ?></a></li>
              <li><a href="<?php echo $career; ?>"><?php echo $text_career; ?></a></li>
               <?php foreach($forms as $form){ ?>
      <li><a href="<?php echo $form['href']; ?>"><?php echo $form['name']; ?></a></li>
      <?php } ?>
              <!-- <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
              <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li> -->
            </ul>
          </div>


          <div class="col-md-3 col-sm-6 col-xs-12">
              <ul class="list-unstyled">
               <li><a href="<?php echo $newsletter; ?>">SUBSCRIBE TO NEWSLETTER</a></li>
                <li><a href="<?php echo $terms; ?>">TERMS & CONDITIONS</a></li>
                <li><a href="<?php echo $privacy; ?>">PRIVACY POLICY</a></li>
              </ul>
          </div>
          <div class="col-md-3 col-sm-6 col-xs-12 right-align">
            <h5><?php echo $text_connectwithus; ?></h5>
            <div>
              <a class="buttonfooter" href="<?php echo $facebooklink; ?>"><img src="/fa/staging/image/others/btnfacebook.png" alt="facebook"/></a>
              <a class="buttonfooter" href="<?php echo $instagramlink; ?>"><img src="/fa/staging/image/others/btninstagram.png" alt="instagram"/></a>
            </div>
          </div>
        </div>
      </div>
      <div class="paymentoption container">
        <div class="row">
            <div class=" col-md-12 col-sm-12 col-xs-12">
                <h5>PAYMENT OPTIONS</h5>
                <img src="/fa/staging/image/others/paymentoption.png"/>
            </div>
        </div>
      </div>
    </div>
  <?php } ?> 

  <?php
    $blockid = 'footer_bottom';
    $blockcls = '';
    $ospans = array();
    require( ThemeControlHelper::getLayoutPath( 'common/block-footcols.tpl' ) );
  ?>

</footer>

<div id="powered">
  <div class="container">
    <div class="copyright pull-left">
    <?php if( $helper->getConfig('enable_custom_copyright', 0) ) { ?>
        <?php echo $helper->getConfig('copyright'); ?>
      <?php } else { ?>
        <?php echo $powered; ?>. 
      <?php } ?>
    </div>
    <?php if( $content=$helper->getLangConfig('widget_paypal_data') ) {?>
      <div class="paypal pull-right">
        <img src="/fa/staging/image/others/dksh.png"/>
      </div>
    <?php } ?>
  </div>
</div>

<div id="top"><a class="scrollup" href="#"><i class="fa fa-angle-up"></i>Top</a></div>

<?php if( $helper->getConfig('enable_paneltool',0) ){  ?>
  <?php  echo $helper->renderAddon( 'panel' );?>
<?php } ?>
  
  <?php
  $offcanvas = $helper->getConfig('offcanvas','category');
if($offcanvas == "megamenu") {
echo $helper->renderAddon( 'offcanvas');
} else {
echo $helper->renderAddon( 'offcanvas-category');
}
?> 

</div>

</div>
<script type="text/javascript">
  $(document).ready(function(){
    $(".parent >a").removeAttr("href");
    if($(window).width()<1000){
    $.each($(".tp-simpleresponsive >ul >li"),function(i,a){
      $(a).css("background-image","url("+$(a).attr("data-thumb")+")")
    });
    $(".box.producttabs .product-items").bxSlider({pager:false,controls:true,auto:false});
    <?php if ($logined==true) {?>
    $(".islog a").html("MY ACCOUNT");
    $(".islog a").attr("href","index.php?route=account/account");
    $(".issig a").html("LOG OUT");
    $(".issig a").attr("href","index.php?route=account/logout");
    <?php }else{ ?>
    $(".islog a").html("LOG IN");
    $(".islog a").attr("href","index.php?route=account/login");
    $(".issig a").html("SIGN UP");
    $(".issig a").attr("href","index.php?route=account/register");
    <?php } ?>
    }
  });

  function resizeWin(){
    
  }
</script>
</body></html>