<div id="deliverzone">
      <div class="row rowhead">
          <div class="col-xs-4">
             <p class="lin2 text-left">AREA</p>
          </div>
          <div class="col-xs-3">
             <p class="lin2 text-left">POSTCODE</p>
          </div>
          <div class="col-xs-5">
              <p class="lin1 text-center">CHARGES</p>
              <div class="row greybox">
          <div class="col-xs-6">
            <p class="lin1 text-center">Below RM299</p>
          </div>
          <div class="col-xs-6">
            <p class="lin1 text-center">RM299 and above</p>
          </div>
        </div>
          </div>
        </div>
        <div class="row whitebox">
          <div class="col-xs-4">
             <p class="lin1 text-left">PETALING JAYA </p>
          </div>
          <div class="col-xs-3">
             <p class="lin1 text-left">46000 - 46999</p>
          </div>
          <div class="col-xs-5">
              <div class="row">
          <div class="col-xs-6">
            <p class="lin1 text-center">RM 15.00</p>
          </div>
          <div class="col-xs-6">
            <p class="lin1 text-center">FREE</p>
          </div>
        </div>
          </div>
        </div>
        <?php $m=0;foreach ($shipping_list as $key => $value) { ?>
          <div class="row <?php echo ($m%2==0) ? "lightgrexbox" : "whitebox";$m++; ?>">
          <div class="col-xs-4">
             <p class="lin1 text-left" style="text-transform: uppercase;"><?php echo $value["name"]; ?></p>
          </div>
          <div class="col-xs-3">
             <p class="lin1 text-left">
                <?php echo $value["zipcode_text"]; ?>
              </p>
          </div>
          <div class="col-xs-5">
            <p class="lin1 text-center">RM<?php echo $value["cost"]; ?></p>
              
          </div>
        </div>
        <?php } ?>
        
      </div>