<?php
	//call by framework Auto Search
	// $configsearch = $this->config->get('pavautosearch_module');
	// $autosearch = empty($configsearch)?'':$helper->renderModule( 'extension/module/pavautosearch' );
	//$autosearch = null;

	// $verticalmenu = $this->config->get('pavverticalmenu_module');
	// $verticalmenu = empty($configsearch)?'':$helper->renderModule( 'extension/module/pavverticalmenu' );
	
 	
	$autosearch = $helper->renderModule( 'pavautosearch' );
	//$megamenu = $helper->renderModule('pavmegamenu');

?>
<nav id="topbar">
  	<div class="inner">
  		<div class="row">
  			<div class="col-lg-4 col-md-4 col-sm-3 col-xs-4">
  				<div class="links hidden-sm hidden-xs">
  					<a href="<?php echo $stores; ?>"><?php echo $text_stores; ?></a>
				</div>	
				<div class="show-mobile hidden-lg hidden-md">
					<div class="quick-user pull-left">
						<div class="quickaccess-toggle">
							<i class="fa fa-user"></i>															
						</div>	
						<div class="inner-toggle">
							<ul class="links pull-left">
								<?php if ($logged) { ?>
									<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
									<li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
								<?php } else { ?>
				    				<li><a href="<?php echo $login; ?>"><span class="fa fa-unlock"></span><?php echo $text_login; ?></a> | <a href="<?php echo $signup; ?>"><span class="fa fa-unlock"></span><?php echo $text_signup; ?></a></li> 			
			    				<?php } ?>		
							</ul>
						</div>						
					</div>	
				</div>			
  			</div>
  			<div class="col-lg-4 col-md-4 col-sm-9 col-xs-8">
  				<a href="<?php echo $home; ?>"><img class="logo" src="/fa/staging/image/others/logo.png"/></a>
  			</div>
  			<div class="col-lg-4 col-md-4 col-sm-9 col-xs-8">
  				<div class="pull-right">
	  				<ul class="links pull-left">
	  					<!--<li><a href="<?php echo $wishlist; ?>"><i class=" fa-fw fa fa-heart-o"></i><span class="title-setting"><span id="wishlist-total"><?php echo $text_wishlist; ?></span></span></a></li>-->

	  					
	  					<?php if ($logged) { ?>
	  						<li><a href="<?php echo $account; ?>"><span class="title-setting"><?php echo $text_account; ?></span></a> | <a href="<?php echo $logout; ?>"><span><?php echo $text_logout; ?></span></a></li>
	  					<?php } else { ?>
		    				<li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a> | <a href="<?php echo $signup; ?>"><?php echo $text_signup; ?></a></li> 			
	    				<?php } ?>		
	  					<li class="shopping-cart"><?php echo $cart; ?></li>
	  				</ul>  				
				</div>
  			</div>
	    </div>
  </div>
</nav>
<header id="header-main">
	<div class="row">	
		<div class="container">
			<div class="col-lg-9 col-md-3 col-sm-12 col-xs-12 logo inner">					
				<!-- menu -->  		 
				<div id="pav-mainnav">
					<div class="container">
						<div class="mainnav-wrap">			
							<button data-toggle="offcanvas" class="btn btn-theme-default canvas-menu hidden-lg hidden-md" type="button"><span class="fa fa-bars"></span></button>
							<?php
							/**
							 * Main Menu modules: as default if do not put megamenu, the theme will use categories menu for main menu
							 */
							$modules = $helper->renderModule('pavmegamenu');

							if (count($modules) && !empty($modules)) { ?>

							    
							<?php echo $modules; ?>
							 

							<?php } elseif ($categories) { ?>

						    <div class="navbar navbar-inverse"> 
						        <nav id="mainmenutop" class="megamenu" role="navigation"> 
						            <div class="navbar-header">
						                <button type="button" class="navbar-toggle" data-toggle="offcanvas" data-target=".navbar-ex1-collapse">
						                    <span class="sr-only">Toggle navigation</span>
						                    <span class="fa fa-bars"></span>
						                </button>
						            </div>

						            <div class="offcanvas navbar-collapse navbar-ex1-collapse hidden-sm hidden-xs">
						                <ul class="nav navbar-nav">
						                    <li><a href="<?php echo $home; ?>" title="<?php echo $objlang->get('text_home'); ?>"><?php echo $objlang->get('text_home'); ?></a></li>
							                    <?php foreach ($categories as $category) { ?>
							                        <?php if ($category['children']) { ?>			
							                            <li class="parent dropdown deeper ">
							                                <a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?>
							                                    <b class="fa fa-angle-down"></b>
							                                    <span class="triangles"></span>
							                                </a>
							                            </li>
							                            <?php } else { ?>
							                            <li>
							                                <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
							                            <?php } ?>
							                            <?php if ($category['children']) { ?>
							                                <ul class="dropdown-menu">
							                                    <?php for ($i = 0; $i < count($category['children']);) { ?>
							                                        <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
							                                        <?php for (; $i < $j; $i++) { ?>
							                                            <?php if (isset($category['children'][$i])) { ?>
							                                                <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
							                                            <?php } ?>
							                                        <?php } ?>
							                                    <?php } ?>
							                                </ul>
							                            <?php } ?>
							                        </li>
							                    <?php } ?>		                    
						                </ul>
						            </div>	
						        </nav>
						    </div>   
						<?php } ?>
						</div>
					</div>
				</div>
			</div>
			<div id="search" class="col-lg-3 col-md-6 col-sm-6 col-xs-12">									
				<?php
			 	if(isset($autosearch) &&  !empty($autosearch)) { ?>
			 	<div class="input-group">
					<div id="search-auto" class="search-auto search-wrappe">
						<?php echo $autosearch ?>
					</div> 
				</div>
				<?php } else { ?>
					<?php echo $search; ?>		
				<?php }  ?>				
			</div>
			
		</div>
	</div>
</header>
<div id="header-bottom">
	<div class="row">	
		<div class="container">

			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 inner">
				<span class="hasborderright"><img src="<?php  echo $base; ?>/image/others/delivery.png"/><span class="semibold">FREE DELIVERY ABOVE RM100</span></span>
				<span><img src="<?php  echo $base; ?>/image/others/address.png"/><span class="semibold">CORPORATE ORDER CALL <a href="#">+603 7882 6161</a> or <a href="#">EMAIL</a> </span></span>
				<span class="hasborderleft"><img src="<?php  echo $base; ?>/image/others/call.png"/><span class="semibold">HAMPER HOTLINE  <a href="#">+603 7966 9595</a></span></span>
			</div>
		</div>
	</div>
</div>


	





