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
      #sidebar-main h1{font-size: 24px;line-height: 30px;font-weight: bold;color:#000;}
      #sidebar-main h2.privacy_header{font-size: 16px;line-height: 24px;font-weight: bold;}
      #sidebar-main div.privacycontainer{font-size: 14px;line-height: 20px;}
      #sidebar-main div.privacycontainer ul, #sidebar-main div.privacycontainer ol{margin-left: 20px;}
      #sidebar-main div.privacycontainer ol{list-style-type: lower-alpha;}
      
    </style>
  <?php require( ThemeControlHelper::getLayoutPath( 'common/mass-container.tpl' )  ); ?>
  <div class="row">
    <?php echo $column_left; ?>
   <section id="sidebar-main" class="col-md-<?php echo $block[0];?>"><div id="content"><?php echo $content_top; ?>
   <h1>PRIVACY POLICY</h1>
<div class="privacycontainer">The company treats your personal data seriously. In connection with your product purchase from the Company, it is necessary for you to provide to us data about yourself and/or your business entity.</div>
<h2 class="privacy_header"> NATURE OF PERSONAL DATA</h2>
<div class="privacycontainer">The Personal Data in relation to you may include but not limited to your name, telephone number, home address, email address, credit card information, bank account number, etc. </div>
<h2 class="privacy_header"> PROCESSING OF PERSONAL DATA</h2>
<div class="privacycontainer">Personal Data you provide will be collected, used and otherwise processed by the Company for the following purposes:
  <ol>
<li>the delivery of services or products</li>
<li>our internal record keeping</li>
<li>investigation of complaints, and suspected suspicious transactions</li>
<li>disclosure as required by law</li>
<li>conducting marketing and client profiling activities in connection with our services and related products</li>
<li> user or customer relationship management procedures</li>
<li>prevention of crime (including but not limited to fraud, money-laundering, bribery)</li>
<li>enforcing our legal rights</li>
</ol>
We would also like to use your Personal Data (including your name, telephone number, address, email address and other information provided to us when you register) for direct marketing to you (whether by post, email, phone, SMS or the like) in relation to:
<ol>
<li>offers and promotions from us</li>
<li>offers and promotions offered by our subsidiaries and our affiliates</li>
<li>offers and promotions from the third party merchants that we cooperate with to provide benefits to our customers in relation to the following types of products or services:
<ul>
<li>Retails Goods or Services</li>
<li>Financial, insurance, banking and credit cards</li>
<li>Transportation, travel and accommodation</li>
<li>Sports, leisure, recreation and entertainment</li>
<li>E-commerce (including trading and payment platforms and online auctions)</li></ul></li>
</ol>
</div>
<h2 class="privacy_header"> DISCLOSURE</h2>
<div class="privacycontainer">Personal Data provided to the Company by you will generally be kept confidential but you hereby consent and authorize us to provide or disclose your Personal Information for the purposes stated above to the following persons:
  <ol>
a.  any person to whom the Company is compelled or required to do so under law or in response to a competent or government agency
b.  any person where public interest or our interests require disclosure, as permitted by law; or
c.  such sub-contractors or third party service or product providers as the Company may determine to be necessary or appropriate
</ol>
</div>
<h2 class="privacy_header">SAFEGUARDS</h2>
<div class="privacycontainer">We shall endeavor to implement the appropriate administrative and security safeguards and procedures in accordance with the applicable laws and regulations to prevent the unauthorized or unlawful processing of your Personal Data and the accidental loss or destruction of, or damage to, your Personal Data.</div>
<h2 class="privacy_header"> DATA TRANSFER AND SHARING</h2>
<div class="privacycontainer">Where we consider it necessary or appropriate for the purposes of data storage or processing or human resource management, we may transfer your Personal Data to another member of the Group or third party service or product providers within or outside the country in which the Company is established, under conditions of confidentiality and similar levels of security safeguards.</div>
<h2 class="privacy_header">YOUR RIGHTS OF ACCESS AND CORRECTION</h2>
<div class="privacycontainer">You have the right to request access to and correction of information about you held by the Company and you may:
  <ol>
<li>check whether the Company holds or uses your Personal Data and request access to such data</li>
<li>request that the Company correct any of your Personal Data that is inaccurate, incomplete or out-of-date</li>
<li>request that the Company specify or explain its policies and procedures in relation to data and types of Personal Data handled by the Company</li>
</ol>
Any request in relation to the above shall be in writing sent by email and addressed to:
Email Address: enquiry@famousamos.com.my
Phone: +60 3 7882 6161,   Fax: +60 3 7882 6160</div>

<h2 class="privacy_header">CONSENT</h2>
<div class="privacycontainer">By continuing to use Website, you consent to the processing of your Personal Data in accordance with the Privacy Policy and Terms and Conditions by the Company.
</div>





    </div>
      <?php echo $content_bottom; ?></div>
   </section>	
		<?php echo $column_right; ?></div>
</div>
<style type="text/css">#content{margin-bottom: 40px;}#header-bottom{display: none;}#header-main{padding-bottom: 0px;border-bottom: solid 1px #e3e3e3;}</style>
<?php echo $footer; ?>
