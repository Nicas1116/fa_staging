<div class="col-sm-3 accountlefmenu">
  <h2>MY BAG</h2>
  <ul class="list-unstyled">
    <li><a href="<?php echo $order; ?>" class="<?php if($active==$order){echo "active"; } ?>">Orders</a></li>
    <li><a href="<?php echo $purchased; ?>" class="<?php if($active==$purchased){echo "active"; } ?>">Purchased History</a></li>
    <li><a href="<?php echo $wishlist; ?>" class="<?php if($active==$wishlist){echo "active"; } ?>">Wishlist</a></li>
  </ul>
<h2>MY ACCOUNT</h2>
  <ul class="list-unstyled">
    <li><a href="<?php echo $account; ?>" class="<?php if($active==$account){echo "active"; } ?>">My Account</a></li>
    <li><a href="<?php echo $edit; ?>" class="<?php if($active==$edit){echo "active"; } ?>">Account Details</a></li>
    <li><a href="<?php echo $address; ?>" class="<?php if($active==$address){echo "active"; } ?>">Address Book</a></li>
    
  </ul>
  
</div>