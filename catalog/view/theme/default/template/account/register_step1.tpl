<?php 
$hasfacebook =false;
$isgoogle =false;
$facebookid ="";
$googleid="";
if(isset($facebookdata)){
  $hasfacebook = true;
  $googleid = "";
  $facebookid = $facebookdata["id"];
  $firstname = $facebookfirst = $facebookdata["first_name"];
  $lastname = $facebooklast = $facebookdata["last_name"];
  $email = $facebookemail = $facebookdata["email"];
  $confirm = $password = $facebookpassword = substr($facebookid,0,15);
  //echo $password;
}else if(isset($googledata)){
  $hasfacebook = true;
  $isgoogle = true;
  $facebookid = "";
  $googleid = $googledata["id"];
  $name = explode(" ",$googledata["name"]);
  if(sizeof($name) >0  ){
    $first = array_shift($name);
    $last = join(" ",$name);
  }
  $firstname = $facebookfirst = $first;
  $lastname = $facebooklast = $last;
  $email = $facebookemail = $googledata["email"];
  $confirm = $password = $facebookpassword = substr($googleid,0,15);
  //echo $password;
}
?>

<?php echo $header; ?>
<div class="container">
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> registerpage"><?php echo $content_top; ?>
        <div class="register_content">
      <h1><?php echo $heading_title; ?></h1>
      <div class="row titletab">
          <div class="col-sm-4 step1 active"><span>Step 1</span>Create Account</div>
          <div class="col-sm-5 step2"><span>Step 2</span>Personal Information</div>
          <div class="col-sm-3 step3"><span>Step 3</span>Complete</div>
      </div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset  id="account">
          <div class="form-group required">
            <label class="col-sm-12 control-label" for="input-email"><?php echo $entry_email; ?></label>
            <div class="col-sm-12">
              <input type="email" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php }else{ ?>
              <div class="text-dangerd" style="display: none">Email is required</div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-12 control-label" for="input-password"><?php echo $entry_password; ?></label>
            <div class="col-sm-12">
              <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
              
              <?php if ($error_password) { ?>
              <div class="text-danger"><?php echo $error_password; ?></div>
              <?php }else{ ?>
                <div class="text-dangerd" style="display: none">Password is required</div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-12 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
            <div class="col-sm-12">
              <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
              
              <?php if ($error_confirm) { ?>
              <div class="text-danger"><?php echo $error_confirm; ?></div>
              <?php }else{ ?>
              <div class="text-dangerd" style="display: none">Password must be matched</div>
              <?php } ?>
            </div>
          </div>
          <div class="">
            <input type="submit" value="SIGN UP" class="btn btn-primary"/>
          </div>
          <p class="logintext_social">or connect with your social media account</p>
    <div class="row socialbuttons">
      <div class="col-sm-6"><a class="button-facebook"><i class="fa fa-facebook"></i>Facebook</a></div>
      <div class="col-sm-6">
        <div class="g-signin2" data-onsuccess="onSignIn"></div>
      </div>
    
    </div>
        </fieldset>
      </form>
    </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<style type="text/css">
#content{margin-bottom: 40px; }
        #page{background-color: #fff5e1;}#header-bottom{display: none;}#header-main{padding-bottom: 0px;border-bottom: solid 1px #e3e3e3;}
     </style>
<script type="text/javascript"><!--
// Sort the custom fields
$('#account .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#account .form-group').length) {
		$('#account .form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('#account .form-group').length) {
		$('#account .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') == $('#account .form-group').length) {
		$('#account .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('#account .form-group').length) {
		$('#account .form-group:first').before(this);
	}
});

$('#address .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#address .form-group').length) {
		$('#address .form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('#address .form-group').length) {
		$('#address .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') == $('#address .form-group').length) {
		$('#address .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('#address .form-group').length) {
		$('#address .form-group:first').before(this);
	}
});

$('input[name=\'customer_group_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=account/register/customfield&customer_group_id=' + this.value,
		dataType: 'json',
		success: function(json) {
			$('.custom-field').hide();
			$('.custom-field').removeClass('required');

			for (i = 0; i < json.length; i++) {
				custom_field = json[i];

				$('#custom-field' + custom_field['custom_field_id']).show();

				if (custom_field['required']) {
					$('#custom-field' + custom_field['custom_field_id']).addClass('required');
				}
			}


		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('input[name=\'customer_group_id\']:checked').trigger('change');
//--></script>
<script type="text/javascript"><!--
$('button[id^=\'button-custom-field\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$(node).parent().find('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.time').datetimepicker({
	pickDate: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});
//--></script>
<script type="text/javascript"><!--
$('select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=account/account/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('input[name=\'postcode\']').parent().parent().removeClass('required');
			}

			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
						html += ' selected="selected"';
					}

					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//--></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript"></script>
<script>
  $(document).ready(function(){
    <?php if($hasfacebook) { ?>
        openpersonal();
    <?php } ?>

  })
  var gotclick = false;
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1774996859228146',
      cookie     : true,
      xfbml      : true,
      version    : 'v2.12'
    });
      
    FB.AppEvents.logPageView();   
      
  };
 function onSignIn(googleUser) {
  if(gotclick){
    var profile = googleUser.getBasicProfile();
    var gu = {id:profile.getId(), name:profile.getName(), email:profile.getEmail()};
    logingoogle(gu);
    gotclick=false;
  }
}
  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
   $(document).ready(function(){
        $(".g-signin2").click(function(){
          gotclick=true;
        })
        $(".button-facebook").click(function(){
          FB.login(function(response){
              if (response.status === 'connected') {
                 FB.api('/me',{fields: 'email,first_name,last_name'}, function(response) {
           
                      loginfacebook(response);
                    });
              } else {
                // The person is not logged into this app or we are unable to tell. 
              }
          }, {scope: 'public_profile,email'});
        })
    })
   function validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
}
   function openpersonal(){
    var error=false;
    var a =$("#account .form-group.required input#input-email");
    var m = $(a).val()
    $(a).parent().find(".text-dangerd").hide();;
    if(m.length<=0){
      $(a).focus();
      $(a).parent().find(".text-dangerd").html("Email is required")
      $(a).parent().find(".text-dangerd").show();;
      error=true;
    }else{
      if (validateEmail(m)) {
      }else{
        $(a).focus();
        $(a).parent().find(".text-dangerd").html("Email must matched with format")
        $(a).parent().find(".text-dangerd").show();;
        error=true;
      }
    }
    var m1;
    var a =$("#account .form-group.required input#input-password");
    var m = m1 = $(a).val()
    $(a).parent().find(".text-dangerd").hide();;
    if(m.length<=0){
      $(a).focus();
      $(a).parent().find(".text-dangerd").show();;
      error=true;
    }
    var a =$("#account .form-group.required input#input-confirm");
    var m = $(a).val()
    $(a).parent().find(".text-dangerd").hide();;
    if(m != m1){
      $(a).focus();
      $(a).parent().find(".text-dangerd").show();;
      error=true; 
    }
    if(error){
      return;
    }
    $("#account").hide();
    $("#personal").show();
    $("#address").show();
    $("#terms").show();
    $("#buttonsall").show();
   }

   function logingoogle(response){
      $.ajax({
        url: 'index.php?route=account/login/loginwithgoogle',
        type: 'post',
        data: response,
        dataType: 'json',
        beforeSend: function() {
          
        },
        complete: function() {
            
        },
        success: function(json) {
            if (json['redirect']) {
                location = json['redirect'];
            } 
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
   }

   function loginfacebook(response){
      $.ajax({
        url: 'index.php?route=account/login/loginwithfacebook',
        type: 'post',
        data: response,
        dataType: 'json',
        beforeSend: function() {
          
        },
        complete: function() {
            
        },
        success: function(json) {
            if (json['redirect']) {
                location = json['redirect'];
            } 
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
   }
</script>
<?php echo $footer; ?>
