<?php 

?>
<div class="product-block item-default" itemtype="http://schema.org/Product" itemscope>

	<div class="image">
		<?php if ($product['thumb']) {    ?>
	      	<?php if( $product['special'] ) {   ?>
	    	<span class="product-label product-label-special"><span class="special"><?php echo $objlang->get( 'text_sale' ); ?></span></span>
	    	<?php } ?>
				<a class="img" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive" /></a>
		<?php } ?>
	</div>
	
	<div class="product-meta">
		<div class="warp-info">
			<p class="date"><?php echo date("j M Y", strtotime($product['date']));?></p>
			<h3 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
			<div class="description" itemprop="description"><?php echo utf8_substr( strip_tags($product['description']),0,220);?>...</div>
		
		</div>

		<div class="action"> 				     

		    <?php if( !isset($listingConfig['catalog_mode']) || !$listingConfig['catalog_mode'] ) { ?>
				<div class="cart">
					<button data-loading-text="Loading..." type="button" value="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="btn btn-shopping-cart"><?php echo $button_cart; ?></button>		
				</div>
			<?php } ?>


		</div>
		

	</div>

</div>





