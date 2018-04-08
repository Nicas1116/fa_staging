<?php
    $config = $sconfig;
    $theme  = $themename;
    $themeConfig = (array)$config->get('themecontrol');
?>
<?php  echo $header; ?> <?php require( ThemeControlHelper::getLayoutPath( 'common/mass-header.tpl' )  ); ?>

<?php  $config = $sconfig;   

        $themeConfig = (array)$config->get('themecontrol') ?>
<div class="container">
    
  <?php require( ThemeControlHelper::getLayoutPath( 'common/mass-container.tpl' )  ); ?>
  <div class="row form-contactus">
				
  <div class="col-md-<?php echo $block[0];?>">
      
      <h2 class="faq_header">Contact Us</h2>
      <div class="bline"></div>
      <p><strong>We would love to hear from you</strong></p>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
      <div class="form-horizontal form_<?php echo $module; ?>">
      <div class="row">
      
          <?php foreach($formbuilder as $key => $formbuilder_fields){ ?>
          <?php if($formbuilder_fields['status']) { ?>
          <?php $col=''; if($formbuilder_fields['column'] == '1'){
            $col = 'col-sm-12';
          }
          ?>
          <div class="<?php
            if($formbuilder_fields['column'] == '1'){
              echo 'col-sm-12';
            }elseif($formbuilder_fields['column'] == '2'){
              echo 'col-sm-12';
            }else{
              echo 'col-sm-12';
            } ?>">
            <div class="form-group <?php if($formbuilder_fields['required']) { ?> required <?php } ?>">
            <label class="control-label <?php echo $col; ?> display-block" for="input-review"><?php echo $formbuilder_fields['name']; ?></label>
            <?php if($col){ ?><div class="col-sm-12"><?php } ?>
            <?php if($formbuilder_fields['type'] == 'textarea'){ ?>
            <textarea id="field-<?php echo $module; ?>-<?php echo str_replace(' ','_', trim(strtolower($formbuilder_fields['name']))); ?>" name="field[<?php echo str_replace(' ','_', trim(strtolower($formbuilder_fields['name']))); ?>]" class="form-control" placeholder="<?php echo $formbuilder_fields['placeholder']; ?>"><?php echo $formbuilder_fields['value']; ?></textarea>
            
            <?php }elseif($formbuilder_fields['type'] == 'email'){ ?>
            <input id="field-<?php echo $module; ?>-<?php echo str_replace(' ','_', trim(strtolower($formbuilder_fields['name']))); ?>" type="text" name="field[<?php echo str_replace(' ','_', trim(strtolower($formbuilder_fields['name']))); ?>]" class="form-control" placeholder="<?php echo $formbuilder_fields['placeholder']; ?>" value="<?php echo $formbuilder_fields['value']; ?>" />
            
            <?php }elseif($formbuilder_fields['type'] == 'select'){ ?>
            <select id="field-<?php echo $module; ?>-<?php echo str_replace(' ','_', trim(strtolower($formbuilder_fields['name']))); ?>" class="form-control" name="field[<?php echo str_replace(' ','_', trim(strtolower($formbuilder_fields['name']))); ?>]">
              <?php if($formbuilder_fields['placeholder']){ ?><option><?php echo $formbuilder_fields['placeholder']; ?></option><?php } ?>
              <?php foreach ($formbuilder_fields['optionvalue'] as $optionvalue){ ?>
                <option value="<?php echo $optionvalue['value']; ?>"><?php echo $optionvalue['value']; ?></option>
              <?php } ?>
            </select>
            
            <?php }elseif($formbuilder_fields['type'] == 'radio'){ ?>
            
            <div id="field-<?php echo $module; ?>-<?php echo str_replace(' ','_', trim(strtolower($formbuilder_fields['name']))); ?>">
            <?php foreach ($formbuilder_fields['optionvalue'] as $optionvalue){ ?>
              <label class="radio-inline"><input type="radio" name="field[<?php echo str_replace(' ','_', trim(strtolower($formbuilder_fields['name']))); ?>]" value="<?php echo $optionvalue['value']; ?>" /> <?php echo $optionvalue['value']; ?></label>
            <?php } ?>
            </div>
            
            <?php }elseif($formbuilder_fields['type'] == 'checkbox'){ ?>
            
            <div id="field-<?php echo $module; ?>-<?php echo str_replace(' ','_', trim(strtolower($formbuilder_fields['name']))); ?>">
            <?php foreach ($formbuilder_fields['optionvalue'] as $optionvalue){ ?>
              <label class="radio-inline"><input type="checkbox" name="field[<?php echo str_replace(' ','_', trim(strtolower($formbuilder_fields['name']))); ?>][]" value="<?php echo $optionvalue['value']; ?>" /> <?php echo $optionvalue['value']; ?></label>
            <?php } ?>
            </div>
            
            <?php }elseif($formbuilder_fields['type'] == 'date'){ ?>

            <div class="input-group date" id="field-<?php echo $module; ?>-<?php echo str_replace(' ','_', trim(strtolower($formbuilder_fields['name']))); ?>">
              <input type="text" name="field[<?php echo str_replace(' ','_', trim(strtolower($formbuilder_fields['name']))); ?>]" class="form-control" placeholder="<?php echo $formbuilder_fields['placeholder']; ?>" data-date-format="YYYY-MM-DD" value="<?php echo $formbuilder_fields['value']; ?>" />
              <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
              </span>
            </div>
            
            <?php }elseif($formbuilder_fields['type'] == 'time'){ ?>

            <div class="input-group time" id="field-<?php echo $module; ?>-<?php echo str_replace(' ','_', trim(strtolower($formbuilder_fields['name']))); ?>">
              <input type="text" name="field[<?php echo str_replace(' ','_', trim(strtolower($formbuilder_fields['name']))); ?>]" class="form-control" placeholder="<?php echo $formbuilder_fields['placeholder']; ?>" data-date-format="HH:mm" value="<?php echo $formbuilder_fields['value']; ?>" />
              <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
              </span>
            </div>
            
            <?php }elseif($formbuilder_fields['type'] == 'datetime'){ ?>

            <div class="input-group datetime" id="field-<?php echo $module; ?>-<?php echo str_replace(' ','_', trim(strtolower($formbuilder_fields['name']))); ?>">
              <input type="text" name="field[<?php echo str_replace(' ','_', trim(strtolower($formbuilder_fields['name']))); ?>]" class="form-control" placeholder="<?php echo $formbuilder_fields['placeholder']; ?>" data-date-format="YYYY-MM-DD HH:mm" value="<?php echo $formbuilder_fields['value']; ?>" />
              <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
              </span>
            </div>
            
            <?php }elseif($formbuilder_fields['type'] == 'country'){ ?>
            <select id="field-<?php echo $module; ?>-<?php echo str_replace(' ','_', trim(strtolower($formbuilder_fields['name']))); ?>" class="form-control country" name="field[<?php echo str_replace(' ','_', trim(strtolower($formbuilder_fields['name']))); ?>]">
            <?php if($formbuilder_fields['placeholder']){ ?><option value=""><?php echo $formbuilder_fields['placeholder']; ?></option><?php } ?>
            <?php foreach($countries as $country){ ?>
              <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
            <?php } ?>
            </select>
            
            <?php }elseif($formbuilder_fields['type'] == 'zone'){ ?>
            <select id="field-<?php echo $module; ?>-<?php echo str_replace(' ','_', trim(strtolower($formbuilder_fields['name']))); ?>" class="form-control zone" name="field[<?php echo str_replace(' ','_', trim(strtolower($formbuilder_fields['name']))); ?>]">
            <?php if($formbuilder_fields['placeholder']){ ?><option value=""><?php echo $formbuilder_fields['placeholder']; ?></option><?php } ?>
            </select>
            
            <?php }elseif($formbuilder_fields['type'] == 'file'){ ?>
            <button type="button" id="field-<?php echo $module; ?>-<?php echo str_replace(' ','_', trim(strtolower($formbuilder_fields['name']))); ?>" data-loading-text="Loading.." class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $formbuilder_fields['name']; ?></button>
            <input type="hidden" name="field[<?php echo str_replace(' ','_', trim(strtolower($formbuilder_fields['name']))); ?>]" placeholder="<?php echo $formbuilder_fields['placeholder']; ?>" value="<?php echo $formbuilder_fields['value']; ?>" />
            <script>
              $('button[id^=\'field-<?php echo $module; ?>-<?php echo str_replace(' ','_', trim(strtolower($formbuilder_fields['name']))); ?>\']').on('click', function() {
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
                      $('.text-danger').remove();

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
            </script>
            <?php }else{ ?>
            <input id="field-<?php echo $module; ?>-<?php echo str_replace(' ','_', trim(strtolower($formbuilder_fields['name']))); ?>" type="<?php echo $formbuilder_fields['type']; ?>" name="field[<?php echo str_replace(' ','_', trim(strtolower($formbuilder_fields['name']))); ?>]" placeholder="<?php echo $formbuilder_fields['placeholder']; ?>" value="<?php echo $formbuilder_fields['value']; ?>" />
            <?php } ?>
            <?php if($col){ ?>  </div> <?php } ?>
            <div class="help-block"></div>
            </div>
          </div>
          <?php } ?>
        <?php } ?>
        <input type="hidden" name="forumsetting" value="<?php echo $forumsettings; ?>" />
        <input type="hidden" name="forumname" value="<?php echo $formbuilder_desc['heading']; ?>" />
        <input type="hidden" name="ipaddress" value="<?php echo $_SERVER['REMOTE_ADDR']; ?>" />
        <?php echo $captcha; ?>
        <div class="col-sm-12">
        <div class="buttons">
            <button class="btn btn-primary sendemail_<?php echo $module; ?>"><?php echo $formbuilder_desc['submit']; ?></button>
        </div>
        </div>
      </div>
    </div>
    </div>
  <div class="col-md-<?php echo $block[1];?>"></div>
   <section id="sidebar-main" class="col-md-<?php echo $block[2];?>"><div id="content"><?php echo $content_top; ?>
    <div class="contactinformationbox">
      <h2 class="contact_header">Contact Information</h2>
      <div class="faqcontainer">
         <p>THE FAMOUS AMOS CHOCOLATE CHIP COOKIE CORP. (M) SDN BHD (Co. No. 109518-U)</p>
          <p>
          <span>Head Office:</span>
          B-11-01, The Ascent, Paradigm<br/>
          No. 1, Jalan SS 7/26A, Kelana Jaya<br/>
          47301 Petaling Jaya<br/>
          Selangor Darul Ehsan
          </p>
          <p>
          <span>Email:</span>
          <a href="mailto:enquiry@famousamos.com.my">enquiry@famousamos.com.my</a>
          </p>
          <p>
          <span>Contact No:</span>
          <a>+603 7882 8888</a>
          </p>
          <p>
          <span>Fax No:</span>
          <a>+603 7882 6160</a>
          </p>
      </div>
    </div>
  </div>
      <?php echo $content_bottom; ?></div>
   </section>	
		<?php echo $column_right; ?></div>
</div>
<style type="text/css">#header-bottom{display: none;}#header-main{padding-bottom: 0px;border-bottom: solid 1px #e3e3e3;}</style>
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

$('.form_<?php echo $module; ?> select.country').on('change', function() {
  $.ajax({
    url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
    dataType: 'json',
    beforeSend: function() {
      $('.form_<?php echo $module; ?> select.country').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
    },
    complete: function() {
      $('.fa-spin').remove();
    },
    success: function(json) {

      html = '<option value=""><?php echo $text_select; ?></option>';
      
      if (json['zone'] && json['zone'] != '') {
        for (i = 0; i < json['zone'].length; i++) {
          html += '<option value="' + json['zone'][i]['zone_id'] + '"';

          /* if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
            html += ' selected="selected"';
          } */

          html += '>' + json['zone'][i]['name'] + '</option>';
        }
      } else {
        html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
      }

      $('.form_<?php echo $module; ?> select.zone').html(html);
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});

$('.sendemail_<?php echo $module; ?>').on('click',function(){
  sendemail_<?php echo $module; ?>('<?php echo str_replace('&amp;','&',$action); ?>');
});

function sendemail_<?php echo $module; ?>(url){
  $.ajax({
    url: url,
    type: 'post',
    data: $('.form_<?php echo $module; ?> input[type=\'text\'], .form_<?php echo $module; ?> input[type=\'hidden\'], .form_<?php echo $module; ?> input[type=\'number\'], .form_<?php echo $module; ?> input[type=\'password\'], .form_<?php echo $module; ?> input[type=\'radio\']:checked, .form_<?php echo $module; ?> input[type=\'checkbox\']:checked, .form_<?php echo $module; ?> select, .form_<?php echo $module; ?> textarea'),
    dataType: 'json',
    beforeSend: function() {
      $('.sendemail_<?php echo $module; ?>').button('loading');
    },
    complete: function() {
      $('.sendemail_<?php echo $module; ?>').button('reset');
    },
    success: function(json){
      $('.alert, .text-danger').remove();
      $('.form-group').removeClass('has-error');
      if(json['error']){
        for(i in json['error']){
          var element = $('.form_<?php echo $module; ?> #field-<?php echo $module; ?>-' + i);
          if ($(element).parent().hasClass('input-group')) {
            $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
          } else {
            $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
            $(element).parent().addClass('has-error');
          }
        }
      
        if(json['error']['captcha']){
          $('.g-recaptcha').after('<div class="text-danger">' + json['error']['captcha'] + '</div>');
          $('.g-recaptcha').parent().parent().addClass('has-error');
        }
      }
      
      if(json['success']){
        location = 'index.php?route=information/success&form_id=<?php echo $form_id; ?>';
      }
    },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
  });
}

//--></script>
<?php echo $footer; ?>
