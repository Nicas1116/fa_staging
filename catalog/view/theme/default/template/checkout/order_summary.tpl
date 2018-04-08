
        <h2>Order Summary</h2>
        <div class="lined"></div>
        <div class="product_list">
        <?php foreach ($products as $product) { ?>
          <div class="row product_item">
          <div class="col-xs-3 text-left">
             <img src="<?php echo $product["thumb"]; ?>" alt="<?php echo $product["name"]; ?>" class="img-thumbnail">
          </div>
          <div class="col-xs-9 text-left product_name">
              <p><?php echo $product["name"]; ?></p>
              <div class="row">
                <div class="col-xs-8 text-left"><?php echo $product["quantity"] ?>x</div>
                <div class="col-xs-4 text-right">RM<?php echo number_format($product["quantity"]*$product["price"], 2, '.', ',');; ?></div>
              </div>
              <?php $totalsidecost =0;foreach ($product["option"] as $key => $option) { ?>
              <?php if($option["name"] == "Giftbox Message"){ ?>
               <div class="row">
                <div class="col-xs-8 text-left"><strong>Giftbox Message</strong> :<br/><?php echo $option["value"]; ?> </div>
                <div class="col-xs-4 text-right"></div>
              </div>
              <?php }else if($option["price"] >0) { ?>    
                <div class="row">
                <div class="col-xs-8 text-left"><?php echo $product["quantity"] ?>x <?php echo $option["value"]; $totalsidecost+=$product["quantity"]*$option["price"]; ?> </div>
                <div class="col-xs-4 text-right">RM<?php echo number_format($product["quantity"]*$option["price"], 2, '.', ',');?></div>
              </div>
                <?php }else{ ?>
                   <div class="row">
                <div class="col-xs-8 text-left">1x <?php echo $option["value"]; ?> </div>
                <div class="col-xs-4 text-right"></div>
              </div>
               <?php   } ?>
             <?php   } ?>
             
              <div class="row total">
                <div class="col-xs-8 text-left">Total</div>
                <div class="col-xs-4 text-right">RM<?php echo number_format(($product["quantity"]*$product["price"])+$totalsidecost, 2, '.', ','); ?></div>
              </div>
              <span class="product_price"></span>
          </div>
          </div>
        <?php } ?>
      </div>
      <div class="lined"></div>
      <div class="row">
        <div class="col-sm-6">
          <p class="text-left"><strong><?php echo $totals[0]['title']; ?>:</strong></p>
        </div>
        <div class="col-sm-6">
          <p class="text-right"><strong class="subtotalprice"><?php echo $totals[0]['text']; ?></strong></p>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-6">
          <p class="text-left"><strong><?php echo $totals[1]['title']; ?>:</strong></p>
        </div>
        <div class="col-sm-6">
          <p class="text-right"><strong class="totalprice"><?php echo $totals[1]['text']; ?></strong></p>
        </div>
      </div>
      <div class="row total">
        <div class="col-sm-6">
          <p class="text-left"><strong><?php echo $totals[2]['title']; ?>:</strong></p>
        </div>
        <div class="col-sm-6">
          <p class="text-right"><strong class="totalprice"><?php echo $totals[2]['text']; ?></strong></p>
        </div>
      </div>
      <p class="small">GST included, where applicable</p>
    </div>