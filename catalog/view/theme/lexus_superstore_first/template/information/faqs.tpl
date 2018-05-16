<?php
    $config = $sconfig;
    $theme  = $themename;
    $themeConfig = (array)$config->get('themecontrol');
?>
<?php  echo $header; ?> <?php require( ThemeControlHelper::getLayoutPath( 'common/mass-header.tpl' )  ); ?>

<?php  $config = $sconfig;   

        $themeConfig = (array)$config->get('themecontrol') ?>
<div class="container">
    <style type="text/css">
      #sidebar-main p.faq_answer{text-align: center;line-height: 30px;font-size: 18px;font-weight: bold;}
    </style>
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
      <p class="faq_answer">
        Don’t find answer to your questions?<br/>
Please drop us an email at <a href="mailto:enquiry@famousamos.com.my">enquiry@famousamos.com.my</a><br/>
Our team works 9am to 5pm, Mondays to Fridays,<br/>
and we will get back you as soon as we can.

      </p>
    </div>
      <?php echo $content_bottom; ?></div>
   </section>	
		<?php echo $column_right; ?></div>
</div>
<style type="text/css">#header-bottom{display: none;}#header-main{padding-bottom: 0px;border-bottom: solid 1px #e3e3e3;}</style>
<?php echo $footer; ?>
