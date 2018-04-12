<?php 
?>
<div class="product-block item-default" itemtype="http://schema.org/Product" itemscope>
	<div class="image">
		<?php if ($product['thumb']) {    ?>
				<a class="img" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive" /></a>
		<?php } ?>
	</div>
	<div class="product-meta">
		<div class="warp-info">
			<h3 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
			<div class="description" itemprop="description"><?php echo utf8_substr( strip_tags($product['description']),0,220);?>...</div>
		</div>
	</div>

</div>