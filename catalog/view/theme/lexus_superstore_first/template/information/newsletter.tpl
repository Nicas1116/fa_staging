<?php
    $config = $sconfig;
    $theme  = $themename;
    $themeConfig = (array)$config->get('themecontrol');
?>
<?php  echo $header; ?> <?php require( ThemeControlHelper::getLayoutPath( 'common/mass-header.tpl' )  ); ?>

<?php  $config = $sconfig;   

        $themeConfig = (array)$config->get('themecontrol') ?>
<div class="container form-subscribe">
    
  <?php require( ThemeControlHelper::getLayoutPath( 'common/mass-container.tpl' )  ); ?>
  <div class="row">
    <?php echo $column_left; ?>
   <section id="sidebar-main" class="col-md-<?php echo $block[0];?>"><div id="content"><?php echo $content_top; ?>
     
     <form id="formNewLestter" method="post" action="http://localhost:81/fa/staging/index.php?route=extension/module/pavnewsletter/subscribe" class="formNewLestter" _lpchecked="1">
                  
                  <div class="clearfix input-group">
                    <div class="box-heading">
                      <div class="heading">
                         <h2 class="faq_header">Get our latest updates</h2>
                        <div class="description">New subs get 10% off! Sign up now!</div>
                      </div>
                    </div>
                      <label>EMAIL</label>
                      <input type="text" placeholder="Enter Your Email" class="inputNew form-control email" size="18" name="email">
                      <button type="submit" name="submitNewsletter" class="button_mini btn">NEXT</button>
                      <input type="hidden" value="1" name="action">
                      <div class="valid"></div>                
                  </div>            
          </form>
    </div>
      <?php echo $content_bottom; ?></div>
   </section>	
		<?php echo $column_right; ?></div>
</div>
<style type="text/css">#page{background-color: #fff5e1;}#header-bottom{display: none;}#header-main{padding-bottom: 0px;border-bottom: solid 1px #e3e3e3;}</style>
<?php echo $footer; ?>
