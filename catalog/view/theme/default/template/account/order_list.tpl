<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="category_image_small"><p>Orders</p></div>
      <?php if ($orders) { ?>
      <div class="order_listing">
      
            <div class="row order_listing_title hidden-xs">
              <div class="col-sm-2 text-left">Order No.</div>
              <div class="col-sm-2 text-left">Order Date</div>
              <div class="col-sm-4 text-left">Items</div>
              <div class="col-sm-2 text-left">Total</div>
              <div class="col-sm-2 text-left">Status</div>
            </div>
            <?php $m =0;foreach ($orders as $order) { ?>
            <div id="<?php echo $m; ?>" class="row order_listing_detail <?php if($m%2==0){echo "oddbox";} ?>">
              <div class="col-sm-2 text-left"><b class="hidden-lg hidden-md">Order No.</b><a href="<?php echo $order['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btnorder">#<?php echo $order['order_id']; ?></a></div>
              <div class="col-sm-2 text-left"><b class="hidden-lg hidden-md">Order Date</b><p><?php echo $order['date_added']; ?></p></div>
              <div class="col-sm-4 text-left order_listing_product">
                <b class="hidden-lg hidden-md">Items</b>
                <?php foreach ($order["products_list"] as $product) { ?>
                  <div class="row">
                    <div class="col-sm-5 text-left"><a href="<?php echo $product["href"]; ?>"><img src="<?php echo $product["thumb"]; ?>" alt="<?php echo $product["name"]; ?>" class="img-thumbnail"></a></div>
                    <div class="col-sm-7 text-left"><p class="wishlitname"><a href="<?php echo $product["href"]; ?>"><?php echo $product["name"]; ?></a></p></div>
                </div>
                <?php } ?>
            </div>
              <div class="col-sm-2 text-left"><b class="hidden-lg hidden-md">Total</b><p><?php echo $order['total']; ?></p></div>
              <div class="col-sm-2 text-left order_listing_status"><b class="hidden-lg hidden-md">Status</b><p><?php echo $order['status']; ?></p>
                <?php if($order["order_status_id" ]==5){$i=0;foreach ($order["comments"] as $comment) { ?>
                       <div class="row">
                          <div class="col-sm-12">Tracking No. #<?php echo ++$i; ?></div>
                          <div class="col-sm-12 comments"><?php echo $comment["trackingno"]; ?><a href="<?php echo $comment["trackinglink"]; ?>" class="trackinglink"><img src="/fa/staging/image/others/btntrackorder.png"/>&nbsp;Track Order</a></div>
                       </div>
                     <?php }}else if($order["order_status_id" ]==17){ ?>
                     <a href="<?php echo $order["payment"]; ?>" class="btnvieworder">Make Payment</a>
                     <a href="<?php echo $order["remove"]; ?>" class="btnremoveorder">Remove Order</a>
                     <?php } ?>
              </div>
            </div>
            <?php $m++;} ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
      <p class="emptytext"><?php echo $text_empty; ?></p>
      <?php } ?>

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<style type="text/css">#content{margin-bottom: 40px;}#header-bottom{display: none;}#header-main{padding-bottom: 0px;border-bottom: solid 1px #e3e3e3;}</style>
<style type="text/css">.category_image_small{margin-bottom: 0px;}
.account-order .order_listing{padding: 0 9px;}
.account-order .order_listing > .row{background: #fff;margin-bottom: 0px;}
.account-order .order_listing > .row.oddbox{background:#FFF3DA;}
</style>
<?php echo $footer; ?>
