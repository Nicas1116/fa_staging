<div id="cart" class="clearfix pull-right">
    <div data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>" class="dropdown-toggle">
      <div class="thecarttext">
        <span class=""><img src="/fa/staging/image/others/combinedbag.png"/><span>BAG</span></span>
        <span id="cart-total"><?php echo $text_items; ?></span>
      </div>
    </div>
    <div class="thecartside">
      <h2>Shopping Bag</h2>
      <a class="btnclosecart"><i class="fa fa-close"></i></a>
    <?php if ($products || $vouchers) { ?>
    <div>
      <div class="product_list">
        <?php foreach ($products as $product) { ?>
        <div class="row product_item">
          <div class="col-xs-3 text-center"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
            <?php } ?></div>
          <div class="col-xs-5 text-left product_name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            - <small><?php echo $option['name']; ?><br/><span><?php echo $option['value']; ?></span></small>
            <?php } ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
            <br />
            - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
            <?php } ?>
            <span class="product_price"><?php echo $product['total']; ?></span></div>
          <div class="col-xs-3 text-right"><div class="boxq"><a class="btn_minproucts" onclick="cart.update('<?php echo $product['cart_id']; ?>',<?php echo $product['quantity']-1; ?>);">-</a><span><?php echo $product['quantity']; ?></span><a class="btn_addproucts" onclick="cart.update('<?php echo $product['cart_id']; ?>',<?php echo $product['quantity']+1; ?>);">+</a></div></div>
          <div class="col-xs-1 text-right"><button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></button></div>
         
        </div>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="text-center"></td>
          <td class="text-left"><?php echo $voucher['description']; ?></td>
          <td class="text-right">x&nbsp;1</td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
          <td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
      </div>
    </div>
    <div>
      <div>
       
          <?php foreach ($totals as $total) { ?>
          <div class="row rototal rod<?php echo $total['title']; ?>">
            <div class="col-sm-6 text-left"><strong><?php echo $total['title']; ?></strong></div>
            <div class="col-sm-6 text-right"><?php echo $total['text']; ?></div>
            </div>
          <?php } ?>
        
        <p class="text-center"><a class="btn-viewbag" href="<?php echo $cart; ?>">VIEW BAG</a></p>
      </div>
    </div>
    <?php } else { ?>
    <div class="emptycart">
      <p class="text-center"><?php echo $text_empty; ?></p>
    </div>
    <?php } ?>
  </div>
</div>
