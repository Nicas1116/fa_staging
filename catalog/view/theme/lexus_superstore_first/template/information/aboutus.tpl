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
  	 <section id="sidebar-main" class="col-md-12"><div id="content" class="paboutus">
      <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
  	<img class="about_main" src="/image/others/about_main.jpg"/>
      </div>

</div></section>
  </div>
</div>
<div class="fa_aboutus_orange">
    <div class="container">
      <h3>Famous Amos Malaysia</h3>
          <div class="row">
        <div class="col-lg-4 col-md-4 col-xs-12">
          <p>Famous Amos was incorporated in Malaysia as a private limited company under the Companies Act, 1965 on 9 November 1983. It is the franchise holder of "THE FAMOUS AMOS C.C.C.C.(M) SDN BHD" in Malaysia. It was acquired by DKSH Holdings (Malaysia) Berhad in January 1997.</p>
          <p>Its first Hot-baked store was opened in Sungei Wang Plaza and officiated by the founder himself, Wally Amos on November 30, 1984. Today, it operates over 60 successful Hot-baked stores in shopping malls and airports in Malaysia.</p>
        </div>
         <div class="col-lg-4 col-md-4 col-xs-12">
          <p>Currently, there are nine varieties of chocolate chip cookies which are freshly baked throughout the day in each of this Hot-baked store. By using the best ingredients, like semi-sweet chocolate chips and flavorful nuts, these homemade tasting cookies became famous just by word of mouth. The "Free Smell" from our Hot-baked store has been an irresistible aroma of our freshly baked cookies to be enjoyed by true cookie lovers everywhere.</p>
        </div>
         <div class="col-lg-4 col-md-4 col-xs-12">
          <p>We have also introduce "Soft & Chewy Cookies" with variety of flavor for cookies lovers who indulge in freshly baked soft cookies . Muffins, Brownies, Chocolate, Confectionery pick and mix are complimentary products commonly found in Famous Amos outlets. Readily packed and customized gifts hampers are also ever available. </p>
        </div>
      </div>
    </div>
</div>
<div class="fa_aboutus_grey">
    <div class="container">
        <h3>Gifts For All Occasion </h3>
         <div class="row">
        <div class="col-lg-6 col-md-6 col-xs-12">
          <p>Famous Amos has been transformed to a cookies boutique with a selected range of cookies gift tins and wide variety of gift packaging. All gift packaging are also complimented with selected imported chocolates and premium mugs which are creatively packed into unique gifts.</p>
          <p>Our exclusive hampers are always available throughout the year and festival hampers for Chinese New Year, Hari Raya, Deepavali and Christmas.</p>
          <p>We cater for all private and corporate functions for occasions such as parties, picnics, dinners and social gatherings of all kinds.</p>
          <p><a href="/index.php?route=product/category&path=25" class="btn btn-yellow">ORDER NOW</a></p>
        </div>
      </div>
    </div>
</div>
<style type="text/css">
.btn.btn-yellow{background: #FFF200;
    border-radius: 10px;
    padding: 7px 20px;
    color: #000;
    box-shadow: none;
    font-weight: bold;
    margin-top: 10px;}
#content.paboutus .row{margin-top: 0px;}
#content.paboutus{min-height:0px;}
.about_main{display: block;width:100%;}
#header-bottom{display: none;}#header-main{padding-bottom: 0px;border-bottom: solid 1px #e3e3e3;}
  .fa_aboutus_orange{background:#FFFAC2;padding: 20px 0}
  .fa_aboutus_grey{background:#fff;}
    .fa_aboutus_grey .container{    background: #FFF url(/image/others/fa_aboutus_grey.jpg) center right no-repeat;
    background-size: cover;
    padding: 50px 0;
    max-height: 544px;
    background-size: 50% auto;}
</style>
    <?php //end contact map ?>
<?php echo $footer; ?>