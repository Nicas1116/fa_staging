<?php
    $config = $sconfig;
    $theme  = $themename;
    $themeConfig = (array)$config->get('themecontrol');
?>
<?php  echo $header; ?> <?php require( ThemeControlHelper::getLayoutPath( 'common/mass-header.tpl' )  ); ?>

<?php  $config = $sconfig;   

        $themeConfig = (array)$config->get('themecontrol') ?>
<div class="container">
    
  <?php //require( ThemeControlHelper::getLayoutPath( 'common/mass-container.tpl' )  ); ?>
  <div class="row">
  	 <section id="sidebar-main" class="col-md-12"><div id="content">

     </div></section>
  </div>
</div>

<style type="text/css">
#header-bottom{display: none;}#header-main{padding-bottom: 0px;border-bottom: solid 1px #e3e3e3;}
</style>
    <?php //end contact map ?>
<?php echo $footer; ?>