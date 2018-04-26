 <div class="sidebar-offcanvas sidebar  visible-xs visible-sm">
      <div class="offcanvas-inner panel panel-offcanvas">
          <div class="offcanvas-heading panel-heading">
              <button type="button" class="btn btn-primary" data-toggle="offcanvas"> <span class="fa fa-times"></span></button>
          </div>
          <div class="offcanvas-body panel-body">
                <div id="offcanvasmenu"></div> 
                <div id="offcanvassubmenu"></div> 
                <div id="offcanvassubmenurefine" class="refine-search">
                  <p>REFINE BY</p>
                  <p>Price</p>
                  <ul>
                    <li><a href="/fa/staging/index.php?route=product/category/all&amp;path=33&amp;price=11">Under RM30</a></li>
                    <li><a href="/fa/staging/index.php?route=product/category/all&amp;path=33&amp;price=12">RM30 — RM50</a></li>
                    <li><a href="/fa/staging/index.php?route=product/category/all&amp;path=33&amp;price=13">RM50 and above</a></li>
                  </ul>
              </div>
              </div>
          </div>
       </div> 
<script type="text/javascript">
  $("#offcanvasmenu").html($("#bs-megamenu").html());
  if($(".subcategories ").length > 0){
  $("#offcanvassubmenu").html($(".subcategories ").html());
  }else if($(".homepage_sidemenu ").length > 0){
  $("#offcanvassubmenu").html($(".homepage_sidemenu ").html());
  }else if($(".accountlefmenu ").length > 0){
    $("#offcanvassubmenu").html($(".accountlefmenu ").html());
  }else if($(".info_leftmenu").length > 0){
    $("#offcanvassubmenu").html($(".info_leftmenu ").html());
  }  else{
     $("#offcanvassubmenu").hide();
  }
  

</script>
