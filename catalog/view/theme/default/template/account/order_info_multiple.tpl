<?php echo $header; ?>
<div class="container">
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> account_detail_content"><?php echo $content_top; ?>
      <p><?php //echo json_encode($full_order_info); ?></p>
      <a href="<?php echo $orderlist_link ?>" class="btnreturn">Return to Order History »</a>
      <h2><?php echo $text_order_detail; ?></h2>
      <div class="row topdetail">
          <div class="col-sm-2"><?php if ($invoice_no) { ?>
              <b><?php echo $text_invoice_no; ?></b><?php echo $invoice_no; ?><br />
              <?php } ?>
              <b><?php echo $text_order_id; ?></b>#<?php echo $order_id; ?>
              </div>
          <div class="col-sm-2"><b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?></div>
          <div class="col-sm-2"><b>Order Total</b><?php echo $totals[2]["text"]; ?></div>
          <div class="col-sm-3"><b>Status</b><?php echo $full_order_info["order_status"]; ?></div>
          <div class="col-sm-3 trackinglinks"><?php if($full_order_info["order_status_id" ]==5){$i=0;foreach ($trackinglist as $comment) { ?>
                       <div class="row">
                          <div class="col-sm-6">Tracking No. #<?php echo ++$i; ?></div>
                          <div class="col-sm-6 comments"><?php echo $comment["trackingno"]; ?></div>
                       </div>
                       <div><a href="<?php echo $comment["trackinglink"]; ?>" class="trackinglink"><img src="/fa/staging/image/others/btntrackorder.png"/>&nbsp;Track Order</a></div>
                     <?php }}else if($full_order_info["order_status_id" ]==17){ ?>
                     <a href="<?php echo $order["payment"]; ?>" class="btnvieworder">Make Payment</a>
                     <?php } ?></div>
      </div>
      <div class="row topaddress">
        <div class="col-sm-4">
          <b><?php echo $text_payment_address; ?></b>
          <p><?php echo $payment_address; ?></p>
        </div>
        <?php if ($shipping_address) { ?>
        <div class="col-sm-4">
          <b><?php echo $text_shipping_address; ?></b>
          <p><?php echo $shipping_address; ?></p>
        </div>
          <?php } ?>
        
        <div class="col-sm-4">
          <p><b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?></p>
        </div>
      </div>
      <h3>Ordered Items</h3>
      <div class="row topproducts">
        <?php
            $m=0;
             foreach ($products as $product) { ?>
               
                <div class="row productinfo <?php if($m%2==0){echo "oddbox";} ?>">
                  <div class="col-sm-2"><img src="<?php echo $product["thumb"]; ?>" alt="<?php echo $product["name"]; ?>" class="img-thumbnail"></div>
                  <div class="col-sm-3"><p class="productname"><?php echo $product["name"]; ?></p></div>
                  <div class="col-sm-2"><p class="productprice"><?php echo $product["price"]; ?></p></div>
                  <div class="col-sm-2"><p class="productqty">QTY<?php echo $product["quantity"]; ?></p></div>
                  <div class="col-sm-3"><a href="<?php echo $product["reorder"] ?>" class="btnordersnow">RE-ORDER</a></div>
               </div>
              <?php $m++;
              if($m>=2){

                break;
              }
              } 
            ?>
      </div>
      <?php if($vouchers) { ?>
      <h3>Vouchers</h3>
      <?php foreach ($vouchers as $voucher) { ?>
            <div>
              <div class="text-left"><?php echo $voucher['description']; ?></div>
              <div class="text-left"></div>
              <div class="text-right">1</div>
              <div class="text-right"><?php echo $voucher['amount']; ?></div>
              <div class="text-right"><?php echo $voucher['amount']; ?></div>
              <?php if ($products) { ?>
              <div></div>
              <?php } ?>
            </div>
            <?php } ?>
      <?php } ?>
            <div class="toptotal">
            <?php foreach ($totals as $total) { ?>
            <div class="row tt_<?php echo $total['code']; ?>">
              <div class="col-sm-6 text-left"><?php echo $total['title']; ?></div>
              <div class="col-sm-6 text-right"><?php echo $total['text']; ?></div>
            </div>
            <?php } ?>
          </div>
      <?php if ($histories) { ?>
      <h3><?php echo $text_history; ?></h3>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left"><?php echo $column_date_added; ?></td>
            <td class="text-left"><?php echo $column_status; ?></td>
            <td class="text-left"><?php echo $column_comment; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php if ($histories) { ?>
          <?php foreach ($histories as $history) { ?>
          <tr>
            <td class="text-left"><?php echo $history['date_added']; ?></td>
            <td class="text-left"><?php echo $history['status']; ?></td>
            <td class="text-left"><?php echo $history['comment']; ?></td>
          </tr>
          <?php } ?>
          <?php } else { ?>
          <tr>
            <td colspan="3" class="text-center"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<style type="text/css">#header-bottom{display: none;}#header-main{padding-bottom: 0px;border-bottom: solid 1px #e3e3e3;}</style>
<?php echo $footer; ?>