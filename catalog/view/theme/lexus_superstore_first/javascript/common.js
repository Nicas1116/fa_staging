// offcanvas menu 
$(document).ready(function () {
  

$(document.body).on('click', '.megamenu [data-toggle="dropdown"], .verticalmenu [data-toggle="dropdown"]' ,function(){
        if(!$(this).parent().hasClass('open') && this.href && this.href != '#'){
            window.location.href = this.href;
        }
    });


    $('[data-toggle="offcanvas"]').click(function () {
        $('.row-offcanvas').toggleClass('active')
    });
    $('#offcanvasmenu a.dropdown-toggle').parent().prepend('<i class="click-canavs-menu fa fa-plus-square"></i>');
    $( "body" ).on( "click", "i.click-canavs-menu.fa-plus-square", function() {
        $this = $(this);
        $this.removeClass('fa-plus-square').addClass('fa-minus-square');
        $this.parent().find('.dropdown-menu:first').toggle();
    });

    $( "body" ).on( "click", "i.click-canavs-menu.fa-minus-square", function() {
        $(this).removeClass('fa-minus-square').addClass('fa-plus-square');
        $(this).parent().find('.dropdown-menu:first').toggle();
    });

  /* Search */
  $('#offcanvas-search input[name=\'search\']').parent().find('button').on('click', function() {
    url = $('base').attr('href') + 'index.php?route=product/search';

    var value = $('header input[name=\'search\']').val();

    if (value) {
      url += '&search=' + encodeURIComponent(value);
    }

    location = url;
  });

  $('#offcanvas-search input[name=\'search\']').on('keydown', function(e) {
    if (e.keyCode == 13) {
      $('header input[name=\'search\']').parent().find('button').trigger('click');
    }
  });
});

$(document).ready(function() {
    // Click top scroll
    // scroll-to-top button show and hide

    jQuery(document).ready(function(){
        jQuery(window).scroll(function(){
            if (jQuery(this).scrollTop() > 100) {
                jQuery('.scrollup').fadeIn();
            } else {
                jQuery('.scrollup').fadeOut();
        }
    });
    // scroll-to-top animate
    jQuery('.scrollup').click(function(){
        jQuery("html, body").animate({ scrollTop: 0 }, 600);
            return false;
        });
    });
$("#cart .thecarttext").click(function(){
            $(".shopping-cart #cart .thecartside").show();
          })
          $("#topbar .thecartside .btnclosecart").click(function(){
             $(".shopping-cart #cart .thecartside").hide();
          });
  // Currency
  $('.currency .currency-select').on('click', function(e) {
    e.preventDefault();

    $('.currency input[name=\'code\']').attr('value', $(this).attr('data-name'));

    $('.currency').submit();
  });

  // Language
  $('.language a').on('click', function(e) {
    e.preventDefault();

    $('.language input[name=\'code\']').attr('value', $(this).attr('href'));

    $('.language').submit();
  });


	$('.product-zoom').magnificPopup({
		  type: 'image',
          closeOnContentClick: true,
 
          image: {
            verticalFit: true
          }
	});

	  $('.iframe-link').magnificPopup({
      type:'iframe'
    });
});


$(document).ready(function(){

    $('.dropdown-menu input').click(function(e) {
        e.stopPropagation();
    });

    // grid list switcher
    $("button.btn-switch").bind("click", function(e){
        e.preventDefault();
        var theid = $(this).attr("id");
        var row = $("#products");

        if($(this).hasClass("active")) {
            return false;
        } else {
            if(theid == "list-view"){
                $('#list-view').addClass("active");
                $('#grid-view').removeClass("active");

                // remove class list
                row.removeClass('product-grid');
                // add class gird
                row.addClass('product-list');
                
            }else if(theid =="grid-view"){
                $('#grid-view').addClass("active");
                $('#list-view').removeClass("active");

                // remove class list
                row.removeClass('product-list');
                // add class gird
                row.addClass('product-grid');

            }
        }
    });


    $(".quantity-adder .add-action").click( function(){
        if( $(this).hasClass('add-up') ) {  
            $("[name=quantity]",'.quantity-adder').val( parseInt($("[name=quantity]",'.quantity-adder').val()) + 1 );
        }else {
            if( parseInt($("[name=quantity]",'.quantity-adder').val())  > 1 ) {
                $("input",'.quantity-adder').val( parseInt($("[name=quantity]",'.quantity-adder').val()) - 1 );
            }
        }
    } );


    /****/
    $(document).ready(function() {
        $('.popup-with-form').magnificPopup({
              type: 'inline',
              preloader: false,
              focus: '#input-name',

              // When elemened is focused, some mobile browsers in some cases zoom in
              // It looks not nice, so we disable it:
              callbacks: {
                beforeOpen: function() {
                  if($(window).width() < 700) {
                    this.st.focus = false;
                  } else {
                    this.st.focus = '#input-name';
                  }
                }
              }
        });
    });

    
});

// Cart add remove functions
var cart = {
  'add': function(product_id, quantity) {
    $.ajax({
      url: 'index.php?route=checkout/cart/add',
      type: 'post',
      data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
      dataType: 'json',
      success: function(json) {
        $('.alert, .text-danger').remove();

        if (json['redirect']) {
          location = json['redirect'];
        }

        if (json['success']) {
          $('#notification').html('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

          $('#cart-total').html(json['total']);

          $('#cart-total', window.parent.document).html(json['total']);

          $('html, body').animate({ scrollTop: 0 }, 'slow');
      
          $('#topbar .shopping-cart #cart').load('index.php?route=common/cart/info #cart',function(){
             $("#cart .thecarttext").click(function(){
              $(".shopping-cart #cart .thecartside").show();
            })
            $("#topbar .thecartside .btnclosecart").click(function(){
               $(".shopping-cart #cart .thecartside").hide();
            });
          });
         
        }
      }
    });
  },
  'updateoption': function(key, option) {
    $.ajax({
      url: 'index.php?route=checkout/cart/editoption',
      type: 'post',
      data: {
       key: key,
       option: option
      },
      dataType: 'json',
      beforeSend: function() {
        $('#cart > button').button('loading');
      },
      success: function(json) {
        $('#cart > button').button('reset');

        $('#cart-total').html(json['total']);
        if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
          location = 'index.php?route=checkout/cart';
        } else {
          $('#topbar .shopping-cart #cart').load('index.php?route=common/cart/info #cart',function(){
            $("#cart .thecarttext").click(function(){
            $(".shopping-cart #cart .thecartside").show();
          })
          $("#topbar .thecartside .btnclosecart").click(function(){
             $(".shopping-cart #cart .thecartside").hide();
          });
          $(".shopping-cart #cart .thecartside").show();
          });

        }
        
      }
    });
  },
  'updateoptiontext': function(key, option) {
    $.ajax({
      url: 'index.php?route=checkout/cart/editoption',
      type: 'post',
      data: {
       key: key,
       option: option
      },
      dataType: 'json',
      beforeSend: function() {
        $('#cart > button').button('loading');
      },
      success: function(json) {
      
      }
    });
  },
  'update': function(key, quantity) {
    $.ajax({
      url: 'index.php?route=checkout/cart/edit',
      type: 'post',
      data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
      dataType: 'json',
      beforeSend: function() {
        $('#cart > button').button('loading');
      },
      success: function(json) {
        $('#cart > button').button('reset');

        $('#cart-total').html(json['total']);
        if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
          location = 'index.php?route=checkout/cart';
        } else {
          $('#topbar .shopping-cart #cart').load('index.php?route=common/cart/info #cart',function(){
            $("#cart .thecarttext").click(function(){
            $(".shopping-cart #cart .thecartside").show();
          })
          $("#topbar .thecartside .btnclosecart").click(function(){
             $(".shopping-cart #cart .thecartside").hide();
          });
          $(".shopping-cart #cart .thecartside").show();
          });

        }
        
      }
    });
  },
  'remove': function(key) {
    $.ajax({
      url: 'index.php?route=checkout/cart/remove',
      type: 'post',
      data: 'key=' + key,
      dataType: 'json',
      beforeSend: function() {
        $('#cart > button').button('loading');
      },
      success: function(json) {
        $('#cart > button').button('reset');

        $('#cart-total').html(json['total']);

        if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
          location = 'index.php?route=checkout/cart';
        } else {
          $('#topbar .shopping-cart #cart').load('index.php?route=common/cart/info #cart',function(){
             $("#cart .thecarttext").click(function(){
            $(".shopping-cart #cart .thecartside").show();
          })
          $("#topbar .thecartside .btnclosecart").click(function(){
             $(".shopping-cart #cart .thecartside").hide();
          });
          });
        }
       
      }
    });
  }
}

var wishlist = {
  'add': function(product_id) {
    $.ajax({
      url: 'index.php?route=account/wishlist/add',
      type: 'post',
      data: 'product_id=' + product_id,
      dataType: 'json',
      success: function(json) {
        $('.alert').remove();

        if (json['success']) {
          $('#notification').html('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        }

        if (json['info']) {
          $('#notification').html('<div class="alert alert-info"><i class="fa fa-info-circle"></i> ' + json['info'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        }

        $('#wishlist-total').html(json['total']);
        

        $('#wishlist-total', window.parent.document).html(json['total']);


        $('html, body').animate({ scrollTop: 0 }, 'slow');
      }
    });
  },
  'remove': function() {

  }
}

var compare = {
  'add': function(product_id) {
    $.ajax({
      url: 'index.php?route=product/compare/add',
      type: 'post',
      data: 'product_id=' + product_id,
      dataType: 'json',
      success: function(json) {
        $('.alert').remove();

        if (json['success']) {
          $('#notification').html('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

          $('#compare-total').html(json['total']);

             $('#compare-total', window.parent.document).html(json['total']);

          $('html, body').animate({ scrollTop: 0 }, 'slow');
        }
      }
    });
  },
  'remove': function() {

  }
}
