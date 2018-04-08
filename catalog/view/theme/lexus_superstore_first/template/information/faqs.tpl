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
      <h2 class="faq_header">FAQ</h2>
      <div class="bline"></div>
      <div class="faqcontainer">
          <?php 
          foreach ($data_faq as $faq) { ?>
             <div class="faq_question"><?php echo $faq["faq_title"]; ?>
          </div>
          <div class="faq_answer"><?php echo $faq["faq_ans"]; ?>
          </div>
          <?php  }
          ?>
         
      </div>
    </div>
      <?php echo $content_bottom; ?></div>
   </section>	
		<?php echo $column_right; ?></div>
</div>
<style type="text/css">#header-bottom{display: none;}#header-main{padding-bottom: 0px;border-bottom: solid 1px #e3e3e3;}</style>
<?php echo $footer; ?>
