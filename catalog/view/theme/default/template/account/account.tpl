<?php echo $header; ?>
<div class="container">
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> accountaccountpage"><?php echo $content_top; ?>
      <div class="category_image_small" style="padding:0px;background-image: none;"><img src="/image/banner_myaccount.png"/></div>
      
      <div class="row">
          <div class="col-sm-6">
            <h2>RECENT ORDER <a href="<?php echo $orderslink; ?>" class="btnorders">View All Orders »</a></h2>
            <div class="bline"></div>
            <div class="orders_content">
              <?php if($orders){foreach ($orders as $order) { ?>
                <div class="order_content">
                    <div class="row">
                        <div class="col-sm-4">Order No.</div>
                        <div class="col-sm-8"><?php echo $order["order_id"]; ?></div>
                     </div>
                     <div class="row">
                        <div class="col-sm-4">Order Date</div>
                        <div class="col-sm-8"><?php echo $order["date_added"]; ?></div>
                     </div>
                     <div class="row">
                        <div class="col-sm-4">Status</div>
                        <div class="col-sm-8 statustext"><?php echo $order["status"]; ?></div>
                     </div>
                     <?php $i=0;foreach ($order["comments"] as $comment) { ?>
                       <div class="row">
                          <div class="col-sm-4">Tracking No. #<?php echo ++$i; ?></div>
                          <div class="col-sm-8 comments"><?php echo $comment["trackingno"]; ?><a href="<?php echo $comment["trackinglink"]; ?>" class="trackinglink"><img src="/image/others/btntrackorder.png"/>&nbsp;Track Order</a></div>
                       </div>
                     <?php } ?>
                      <div class="row">
                        <div class="col-sm-12"><a href="<?php echo $order["view"]; ?>" class="btnvieworder">View Order</a>
                        <?php  if($order["order_status_id"] == 17){ ?>
                          <a href="<?php echo $order["payment"]; ?>" class="btnvieworder">Make Payment</a>
                        <?php } ?></div>
                      </div>
                </div>
              <?php break;}}else{ ?>
                  <p class="emptytext">You have not made any previous orders!</p>
              <?php } ?>
            </div>
          </div>
          <div class="col-sm-6 purchased_content">
            <h2>RECENT PURCHASED ITEMS <a href="<?php echo $purchasedhistorylink; ?>" class="btnorders">View All  »</a></h2>
            <div class="bline"></div>
            <div class="purchased_container">
            <?php
            if($products){
            $m=0;
             foreach ($products as $product) { ?>
               
                <div class="row">
                  <div class="col-sm-3"><img src="<?php echo $product["thumb"]; ?>" alt="<?php echo $product["name"]; ?>" class="img-thumbnail"></div>
                  <div class="col-sm-6"><p class="wishlitname"><?php echo $product["name"]; ?></p><p class="wishlitprice"><?php echo $product["price"]; ?></p></div>
                  <div class="col-sm-3"><a href="<?php echo $product["reorder"] ?>" class="btnordersnow">RE-ORDER</a></div>
               </div>
              <?php $m++;
              if($m>=2){

                break;
              }
              } 
            }else{ ?>
              <p class="emptytext">Your purchased history is empty.</p>
            <?php }
            ?>
          </div>
          </div>
      </div>
      <div class="row">
          <div class="col-sm-6">
            <h2>ACCOUNT DETAILS <a href="<?php echo $editlink; ?>" class="btnorders">Edit Account Details »</a></h2>
            <div class="bline"></div>
            <div class="account_detail_content">
               <div class="row">
                  <div class="col-sm-4">First Name</div>
                  <div class="col-sm-8"><?php echo $customer_info["firstname"]; ?></div>
               </div>
               <div class="row">
                  <div class="col-sm-4">Last Name</div>
                  <div class="col-sm-8"><?php echo $customer_info["lastname"]; ?></div>
               </div>
               <div class="row">
                  <div class="col-sm-4">Email</div>
                  <div class="col-sm-8"><?php echo $customer_info["email"]; ?></div>
               </div>
               <div class="row">
                  <div class="col-sm-4">Password</div>
                  <div class="col-sm-8">********</div>
               </div>
            </div>
          </div>
          <div class="col-sm-6 wishlist_content">
            <h2>WISHLIST <a href="<?php echo $wishlistlink; ?>" class="btnorders">View All Wish List »</a></h2>
            <div class="bline"></div>
            <div class="wishlists_container">
            <?php
            if($wishlists){
            $m=0;
             foreach ($wishlists as $wishlist) { ?>
               
                <div class="row">
                  <div class="col-sm-3"><img src="<?php echo $wishlist["thumb"]; ?>" alt="<?php echo $product["name"]; ?>" class="img-thumbnail"></div>
                  <div class="col-sm-6"><p class="wishlitname"><?php echo $wishlist["name"]; ?></p><p class="wishlitprice"><?php echo $wishlist["price"]; ?></p></div>
                  <div class="col-sm-3"><a href="<?php echo $wishlist["href"] ?>" class="btnordersnow">ORDER NOW</a></div>
               </div>
              <?php $m++;
              if($m>=2){

                break;
              }
              } 
            }else{ ?>
            <p class="emptytext">Your wish list is empty.</p>
            <?php }
            ?>
          </div>
          </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<style type="text/css">#header-bottom{display: none;}#header-main{padding-bottom: 0px;border-bottom: solid 1px #e3e3e3;}</style>
<?php echo $footer; ?> 