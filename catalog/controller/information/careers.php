<?php 
	class ControllerInformationCareers extends Controller {
		public function index() {
			static $module = 0;
			
			$this->load->language('information/information');
			$config = $this->registry->get("config");
			$data['sconfig'] = $config;
			$data['themename'] = $config->get("theme_default_directory");
			
			$this->load->language('information/information');
			$this->load->model('extension/module');
			$this->load->model('localisation/country');
			$this->load->model('extension/forumbuilder');
			$this->load->model('localisation/zone');
			$this->load->language('extension/module/formbuilder');
		
			$data['heading_title'] = "Careers";
			
			$this->document->setTitle($data['heading_title']);

			$data['form_id'] = $form_id=60;
			$setting = $this->model_extension_module->getModule($form_id);
			if($setting){
				$data['captcha_status'] = $setting['formbuilder_captcha'];
				
				
				// Captcha
				if ($this->config->get($this->config->get('config_captcha') . '_status') && $data['captcha_status']) {
					$data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'), $this->error);
				} else {
					$data['captcha'] = '';
				}
	
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
						$this->response->setOutput($this->load->view('information/formbuilder', $data));
					}elseif($this->customer->isLogged() && !$setting['formbuilder_guest']){
						$this->response->setOutput($this->load->view('information/formbuilder', $data));
					}
				}

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
			$data['active'] = 'faqs';
			$data['block'] = [7,1,4];
			$this->response->setOutput($this->load->view('information/careers', $data));
		}
	}
?>