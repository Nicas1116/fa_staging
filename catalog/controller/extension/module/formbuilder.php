<?php
class ControllerExtensionModuleFormbuilder extends Controller {

	public function index($setting) {
		static $module = 0;
		
		$this->load->model('localisation/country');
		$this->load->model('localisation/zone');
		$this->load->language('extension/module/formbuilder');
		
		$data['text_select'] = $this->language->get('text_select');
		$data['text_none'] = $this->language->get('text_none');
		
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');
		
		$data['formbuilder_desc'] = $setting['formbuilder_desc'][$this->config->get('config_language_id')];
		$formbuilder_fields = $setting['formbuilder_field'];
		$data['formdescription'] = html_entity_decode($setting['formbuilder_desc'][$this->config->get('config_language_id')]['description']);
		$data['formbuilder'] = array();
		if(!empty($formbuilder_fields)){
		foreach($formbuilder_fields as $key => $formbuilder_field) {
			$optionvaue = array();	
			if(!empty($formbuilder_field['optionvalue'])){
				foreach($formbuilder_field['optionvalue'] as $options){	
				$optionvaue[] = $options[$this->config->get('config_language_id')];		
				}
			}
			$data['formbuilder'][$key] =array(
				'name' => $formbuilder_field[$this->config->get('config_language_id')]['name'],
				'placeholder' => $formbuilder_field[$this->config->get('config_language_id')]['placeholder'],
				'errormsg' => $formbuilder_field[$this->config->get('config_language_id')]['errormsg'],
				'type' => $formbuilder_field['type'],
				'optionvalue' => (isset($optionvaue) ? $optionvaue : ''),
				'value' => (isset($formbuilder_field['value']) ? $formbuilder_field['value'] : ''),
				'column' => $formbuilder_field['column'],
				'status' => $formbuilder_field['status'],
				'required' => $formbuilder_field['required']
			);
		}
		}
		$data['countries'] = $this->model_localisation_country->getCountries();
		$data['forumsettings'] = $setting['formbuilder_module_id'];
		$data['action'] = $this->url->link('extension/module/formbuilder/sendmail');
		
		$data['module'] = $module++;
		if($setting['formbuilder_guest']){
			return $this->load->view('extension/module/formbuilder', $data);
		}elseif($this->customer->isLogged() && !$setting['formbuilder_guest']){
			return $this->load->view('extension/module/formbuilder', $data);
		}
	}
	
	public function sendmail(){
		$json = array();
		$this->load->model('extension/module');
		$this->load->model('localisation/country');
		$this->load->model('localisation/zone');
		$this->load->model('extension/forumbuilder');
		$module_info = $this->model_extension_module->getModule($this->request->post['forumsetting']);
		$fields_value = $this->request->post['field'];
		$formbuilder_fields = $module_info['formbuilder_field'];
		$formbuilder_email = $module_info['formbuilder_email'];
		$mailadmin = $module_info['formbuilder_adminmail'];
		$mailcustomer = $module_info['formbuilder_customermail'];
		$recordresponse = $module_info['formbuilder_recordresponse'];
		$customer_email = '';
		$formbuilder = array();
		foreach($formbuilder_fields as $key => $formbuilder_field) {
			$formbuilder[$key] =array(
				'name' => $formbuilder_field[$this->config->get('config_language_id')]['name'],
				'placeholder' => $formbuilder_field[$this->config->get('config_language_id')]['placeholder'],
				'errormsg' => $formbuilder_field[$this->config->get('config_language_id')]['errormsg'],
				'type' => $formbuilder_field['type'],
				'column' => $formbuilder_field['column'],
				'status' => $formbuilder_field['status'],
				'required' => $formbuilder_field['required']
			);
		}
		
		foreach($formbuilder as $key => $formbuilder_fields){
			if($formbuilder_fields['type'] == 'email'){
				$customer_email = $fields_value[str_replace(' ','_', trim(strtolower($formbuilder_fields['name'])))];
			}
		}
		
		foreach($formbuilder as $key => $formbuilder_fields){
			if($formbuilder_fields['required']){
				if(empty($fields_value[str_replace(' ','_', trim(strtolower($formbuilder_fields['name'])))])){
					$json['error'][str_replace(' ','_', trim(strtolower($formbuilder_fields['name'])))] = $formbuilder_fields['errormsg'];
				}
			}
		}
		
		
		// Captcha
		if ($this->config->get($this->config->get('config_captcha') . '_status') && $module_info['formbuilder_captcha']) {
			$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

			if ($captcha) {
				$json['error']['captcha'] = $captcha;
			}
		}
			

		if(!$json){
			
			$field_details = '<div class="table-responsive">';
			$field_details .= '<table class="table table-bordered">';
			foreach($formbuilder as $key => $formbuilder_fields){
				if($formbuilder_fields['status']){
					if($formbuilder_fields['type'] == 'country'){
						$country = $this->model_localisation_country->getCountry($fields_value[str_replace(' ','_', trim(strtolower($formbuilder_fields['name'])))]);
						$field_details .= '<tr>';
						$field_details .= '<th width="25%">' . $formbuilder_fields['name'] . ': </th> <td>' . $country['name'] . '</td>';
						$field_details .= '</tr>';
					}elseif($formbuilder_fields['type'] == 'zone'){
						$zone = $this->model_localisation_zone->getZone($fields_value[str_replace(' ','_', trim(strtolower($formbuilder_fields['name'])))]);
						$field_details .= '<tr>';
						$field_details .= '<th width="25%">' . $formbuilder_fields['name'] . ': </th> <td>' . $zone['name'] . '</td>';
						$field_details .= '</tr>';
					}elseif($formbuilder_fields['type'] == 'file' && $fields_value[str_replace(' ','_', trim(strtolower($formbuilder_fields['name'])))]){
						$field_details .= '<tr>';
						$field_details .= '<th width="25%">' . $formbuilder_fields['name'] . ': </th> <td><a href='. $this->url->link('tool/upload/download', 'token=' . $this->session->data['token'] . '&code=' . $fields_value[str_replace(' ','_', trim(strtolower($formbuilder_fields['name'])))], true) .'>Download</a></td>';
						$field_details .= '</tr>';
					}elseif($formbuilder_fields['type'] == 'checkbox'){
						$checkboxvalues = $fields_value[str_replace(' ','_', trim(strtolower($formbuilder_fields['name'])))];
						$values = implode(',',$checkboxvalues);
						$field_details .= '<tr>';
						$field_details .= '<th width="25%">' . $formbuilder_fields['name'] . ': </th> <td>' . $values . '</td>';
						$field_details .= '</tr>';
					}else{
						$field_details .= '<tr>';
						$field_details .= '<th width="25%">' . $formbuilder_fields['name'] . ': </th> <td>' . $fields_value[str_replace(' ','_', trim(strtolower($formbuilder_fields['name'])))] . '</td>';
						$field_details .= '</tr>';
					}
				}
			}
			$field_details .= '</table>';
			$field_details .= '</div>';
			
			$admin_email = (!empty($module_info['adminemail']) ? $module_info['adminemail'] : $this->config->get('config_email'));
			$asubject = (isset($formbuilder_email[$this->config->get('config_language_id')]['adminsubject']) ? $formbuilder_email[$this->config->get('config_language_id')]['adminsubject'] : '');
			$amessage = (isset($formbuilder_email[$this->config->get('config_language_id')]['adminmsg']) ? html_entity_decode($formbuilder_email[$this->config->get('config_language_id')]['adminmsg']) : '');
			
			$find=array(
			  '[logo]',
			  '[store_name]',
			  '[store_address]',
			  '[store_telephone]',
			  '[store_email]',
			  '[store_url]',
			  '[store_owner]',
			  '[forum_data]',
			);
			
			$replace=array(
			  'logo'   				=>  '<img src="'.$this->config->get('config_url') . 'image/' . $this->config->get('config_logo').'"/>',
			  'store'  				=> $this->config->get('config_name'),
			  'store_address'   	=> $this->config->get('config_address'),
			  'store_telephone'     => $this->config->get('config_telephone'),
			  'store_email'   	    => $this->config->get('config_email'),
			  'store_url'   	    => $this->config->get('config_url'),
			  'store_owner'   	    => $this->config->get('config_owner'),
			  'forum_data'   	    => html_entity_decode($field_details),
			);
			
			//ADMIM EMAIL SETTINGS
			$admin_subject = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $asubject))));
			
			$admin_message = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $amessage))));
			
			$csubject = (isset($formbuilder_email[$this->config->get('config_language_id')]['customersubject']) ? $formbuilder_email[$this->config->get('config_language_id')]['customersubject'] : '');
			
			$cmessage = (isset($formbuilder_email[$this->config->get('config_language_id')]['customermsg']) ? html_entity_decode($formbuilder_email[$this->config->get('config_language_id')]['customermsg']) : '');
			
			//CUSTOMER EMAIL SETTINGS
			$customer_subject = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $csubject))));
			
			$customer_message = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $cmessage))));
				
				
				
			if($recordresponse){
				
				$forumdata = html_entity_decode($field_details);
				
				$this->model_extension_forumbuilder->addForumdata($forumdata, $this->request->post);
				
			}
			
			if($mailadmin){
				$mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
				$mail->smtp_username = $this->config->get('config_mail_smtp_username');
				$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				$mail->smtp_port = $this->config->get('config_mail_smtp_port');
				$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

				$mail->setTo($admin_email);
				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender($this->config->get('config_name'));
				$mail->setSubject($admin_subject);
				$mail->setHtml($admin_message);
				$mail->send();
			}
	
			if($mailcustomer && $customer_email){
				$mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
				$mail->smtp_username = $this->config->get('config_mail_smtp_username');
				$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				$mail->smtp_port = $this->config->get('config_mail_smtp_port');
				$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

				$mail->setTo($customer_email);
				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender($this->config->get('config_name'));
				$mail->setSubject($customer_subject);
				$mail->setHtml($customer_message);
				$mail->send();
			}
			$json['success'] = true;
		}
		
		print_r(json_encode($json));
	}
	
}