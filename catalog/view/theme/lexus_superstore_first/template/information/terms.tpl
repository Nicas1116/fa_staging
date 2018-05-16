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
      #sidebar-main div.privacycontainer ol{list-style-type: decimal;}
      
    </style>
  <?php require( ThemeControlHelper::getLayoutPath( 'common/mass-container.tpl' )  ); ?>
  <div class="row">
    <?php echo $column_left; ?>
   <section id="sidebar-main" class="col-md-<?php echo $block[0];?>"><div id="content"><?php echo $content_top; ?>

         <h1>TERMS & CONDITIONS</h1>
<div class="privacycontainer">In these terms and conditions, the “Website” will mean famousamos.com.my and the “Company” will mean The Famous Amos Chocolate Chip Cookie Corporation (M) Sdn Bhd and the “Customer” will mean any person, firm, company or body which places an order with the Company. By accessing the Website, you agree that you have read and understand these terms and conditions and that you accept and agree to be bound by them.</div>
<h2 class="privacy_header"> GENERAL</h2>
<div class="privacycontainer"><ol><li>You agree that the Company reserves the right to amend, modify or change any of these terms and conditions at any time, in the Company’s sole and absolute discretion, by posting any such amendment(s) to the Website without prior and any form of notice.</li>
<li>Your continued use of the Website after amendments or modifications to these terms and conditions is posted will be deemed as full knowledge and acceptance of those changes. Please cease to use the Website if you are not agreeable to any amendments or modifications of the Terms and Conditions.</li>
</ol>
</div>
<h2 class="privacy_header"> PRICE AND PRODUCT</h2>
<div class="privacycontainer"><ol><li>The Company shall make every effort to ensure that prices and details stated on the Website are up to date. Prices are subject to change without prior notice and all orders are subject to Company’s acceptance at its sole discretion and stock availability.</li>
<li>In the event if a product or products are not available at time of order, the Company reserves the rights to substitute unavailable products to the Customer with similar product of equal value.</li>
<li>Prices charged for purchases on the Website may be different from those charged in our physical stores.</li>
<li>The price excludes delivery charges, which the Customer shall be liable to pay to the Company in addition to the product price.</li>
<li> All orders are subject to confirmation of final availability and the Company reserves the right to reject or cancel the order in the event that any of the products requested is unavailable. In the event that we are unable to fulfil any of the products in your order, we will notify you by phone or email.</li>
<li>All pictures and images of the products displayed on the Website are for illustration purposes only. The actual size, dimension and color of the products may differ.</li></ol></div>
<h2 class="privacy_header"> REGISTRATION AND ACCOUNT SECURITY</h2>
<div class="privacycontainer"><ol><li>To register with the Company, you must be over eighteen (18) years of age.</li>
  <ul>
<li> Customer is required to register before placing any order on this Website. During the registration:</li>
<li> You must provide us with accurate, complete and up to date registration information;</li>
<li> You must safeguard your username and password;</li></ul>
<li>  You authorize us to assume that any person using the Website with your username and password is either you or is authorized to act for you.</li>
<li> Customer must self-update in Website’s account immediately of any changes to the information that you provided so that we can communicate with you effectively.</li>
<li> The Company reserves the right to restrict, suspend or terminate your access to or use of the Website if in the Company’s sole and absolute opinion, you are in breach of any of the Terms and Conditions.</li></ol></div>
<h2 class="privacy_header"> ONLINE ORDER AND PAYMENT TERMS</h2>
<div class="privacycontainer"><ol><li> Once you have selected a product or products that you wish to order from the Website, you will then be shown the charges you must pay including taxes, if applicable, and any applicable delivery charges.</li>
<li> Customer shall pay for the order in full at the time of ordering. We accept payment by Visa, MasterCard, American Express and online bank transfers from Maybank, CIMB Bank, Hong Leong and Public Bank. Please note that additional charges may be incurred if you are using a non-Malaysian issues card due to Foreign Exchange. The Company shall not be liable for any credit card fraud. Please note that we do not receive cash on delivery. All payments by cheque or others must be cleared prior to delivery or collection of goods.</li>
<li> Full payment in respect of an order must be made upon placing of the order. If your payment cannot be processed, the order will not be accepted.</li>
<li> We shall not be obliged to supply the product to you until we have accepted your order. An order shall be formed and we shall be legally bound to supply the product to you when we accept your order. Acceptance shall take place when we expressly accept your order by email to you, in the form of a document called a “Confirmation of Order” stating that we are accepting your order.</li>
<li> All orders will be processed from Monday to Friday only. Orders placed on Monday to Friday after 12pm will be processed on the next working day. Orders placed on Weekends and Public Holidays will be processed on the next working day.</li></ol></div>
<h2 class="privacy_header"> CANCELLATION / REFUND / RETURN</h2>
<div class="privacycontainer"><ol><li>You are not allowed to cancel the order once a Confirmation of Order is issued. All items paid is non-refundable.</li>
<li> You shall examine the goods immediately upon delivery for any deficiencies and/or damages. If you discover any defect or damage inside the packaging after the delivery process, please contact our customer service hotline +603 7882 6161 for further assistance.</li>
<li> Exchange of the product can be arranged for the following reasons:
  <ul>
<li>If the product is obviously expired / damaged at the time of delivery.</li>
<li> If the product is expired / damaged inside packaging after delivery; and you contact customer service within three (3) working days.</li>
<li> If the product ordered is different from the item delivered.</li>
</ul></li>
<li> We will inspect the returned product upon return by you. If one or more of the conditions in paragraph 20 above is fulfilled, you are entitled to exchange of the product.</li></ol></div>
<h2 class="privacy_header"> DELIVERY</h2>
<div class="privacycontainer">Kindly refer to our Shipping which forms part of these Terms & Conditions.</div>
<h2 class="privacy_header"> FORCE MAJEURE</h2>
<div class="privacycontainer">We shall not be liable for any delay or failure in delivery caused by or resulting from acts of God, flood, accident, riot, fire, ware, strikes and other causes beyond our control.</div>
<h2 class="privacy_header"> DATA PROTECTION</h2>
<div class="privacycontainer"> Kindly refer to our Privacy Policy which forms part of these Terms & Conditions.
<h2 class="privacy_header"> APPLICABLE LAW</h2>
<div class="privacycontainer">These Terms and Conditions shall be governed by and construed in accordance with the laws of Malaysia and any disputes will be resolved exclusively only by the Courts of Malaysia.</div>
<br/><br/>

      </div>
    </div>
      <?php echo $content_bottom; ?></div>
   </section>	
		<?php echo $column_right; ?></div>
</div>
<style type="text/css">#header-bottom{display: none;}#header-main{padding-bottom: 0px;border-bottom: solid 1px #e3e3e3;}</style>
<?php echo $footer; ?>
