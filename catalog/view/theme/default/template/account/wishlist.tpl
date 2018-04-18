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
      <div class="category_image_small"><p>Wishlist</p></div>
      <?php if ($products) { ?>
            <div>
              <p class="purchased_topco"><label><input class="producheckboxall form-control" type="checkbox" name="product-id-all">Select All</label> | <a onclick="onclickreorder();"><img src="/fa/staging/image/others/icon_snackbag.png"/>Re-Order</a></p>
            </div>
            <div class="purchased_container">
            <?php $m=0;foreach ($products as $product) { ?>
              <div class="row <?php if($m%2==0){echo "oddbox";} ?>">
                  <div class="col-sm-7">
                    <div class="row">
                         <div class="col-sm-1 checkboxtpd"><div class="checkboxtpd"><input class="producheckbox form-control" type="checkbox" name="product-id-<?php echo $product["product_id"]; ?>"></div></div>
                         <div class="col-sm-3"><a href="<?php echo $product["href"]; ?>"><img src="<?php echo $product["thumb"]; ?>" alt="<?php echo $product["name"]; ?>" class="img-thumbnail"></a></div>
                         <div class="col-sm-8">
                            <p class="wishlitname"><a href="<?php echo $product["href"]; ?>"><?php echo $product["name"]; ?></a></p><p class="wishlitprice"><?php echo $product["price"]; ?></p>
                         </div>
                    </div>
                  </div>
                  <div class="col-sm-5 text-right">
                    <a href="<?php echo $product["href"] ?>" class="btnordersnow">RE-ORDER</a>
                    <a href="<?php echo $product["remove"] ?>" class="btnordersnow">REMOVE</a>
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
<script type="text/javascript">
  $(document).ready(function(){
    $(".producheckboxall ").click(function(){
      $(".producheckbox").click();
    })
  })
  function onclickreorder() {
    $.each($(".producheckbox"),function(i,a){
      if($(a).prop("checked")==1){
        $.each($(a).parent().parent().parent().parent().parent().find(".btnordersnow"),function(i,b){
          console.log(b)
           $.ajax({
              url:$(b).attr("href"),
              type: 'post',
              dataType: 'html',
              beforeSend: function() {
                
              },
              complete: function() {
                  
              },
              success: function(json) {
                 
              },
              error: function(xhr, ajaxOptions, thrownError) {
                  alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
              }
          });
        });
      }
      window.location.reload();
     })
  }
  function onclickaddtowishlist() {
    $.each($(".producheckbox"),function(i,a){
      if($(a).prop("checked")==1){
        $(a).parent().parent().parent().parent().parent().find(".btnwishlit").click();
      }
    })
     window.location = "index.php?route=account/wishlist";
  }
</script>
<style type="text/css">#header-bottom{display: none;}#header-main{padding-bottom: 0px;border-bottom: solid 1px #e3e3e3;}</style>
<style type="text/css">
.account-wishlist .purchased_container{padding: 0 9px;}
.account-wishlist .purchased_container > .row{background: #fff;margin-bottom: 0px;}
.account-wishlist .purchased_container > .row.oddbox{background:#FFF3DA;}
.purchased_topco label{margin-right: 10px;font-size: 16px;line-height: 20px;color:#4a4a4a;font-weight: 600;margin-bottom: 0px;}
.purchased_topco a img{display: inline-block;margin-right: 10px;}
.purchased_topco a{display: inline-block;padding: 5px 20px;font-size: 16px;line-height: 20px;color:#9b9b9b;font-weight: 600;}
.purchased_topco{padding: 10px 0;margin-bottom: 0px;}
.account-wishlist .category_image_small{margin-bottom: 0px;}
.account-wishlist .purchased_topco .producheckboxall{margin: 3px 5px 4px 10px;display: inline-block;width: 15px;}
.account-wishlist #content{margin-bottom: 40px;}
.account-wishlist .purchased_container .row{border-bottom: 0px;}
.account-wishlist .img-thumbnail{margin-top: 20px;}
.account-wishlist .purchased_container .checkboxtpd{padding: 7px;margin-top:7px;}
.account-wishlist .purchased_container .checkboxtpd .producheckbox{margin-left: 5px;}
.account-wishlist .purchased_container .wishlitname,
.account-wishlist .purchased_container .wishlitprice{font-size: 13px;line-height: 17px;color:#000;margin-bottom: 0px;}
.account-wishlist .purchased_container .wishlitprice{font-weight: bold;}
.account-wishlist .purchased_container .wishlitname{margin-top: 30px;}
.account-wishlist .purchased_container .btnwishlit,
.account-wishlist .purchased_container .btnordersnow{background: #ffa000;color:#fff;font-size: 15px;line-height: 20px;font-weight: bold;text-align: center;display: inline-block;padding: 10px 40px;border-radius: 20px;margin-top: 20px;margin-right: 20px;}
.account-wishlist .purchased_container .btnwishlit{background: transparent;font-size: 14px;color: #000;border:solid 1px #ffa000;margin: 0 20px;padding: 10px 20px;}
</style>
<?php echo $footer; ?>
