<?php
class ControllerInformationFormbuilder extends Controller {

	public function index() {
		
		static $module = 0;
		
		$this->load->model('extension/module');
		$this->load->model('localisation/country');
		$this->load->model('extension/forumbuilder');
		$this->load->model('localisation/zone');
		$this->load->language('extension/module/formbuilder');
		
		if (isset($this->request->get['form_id'])) {
			$form_id = (int)$this->request->get['form_id'];
		} else {
			$form_id = 0;
		}
		
		$data['form_id'] = $form_id;
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);
		
		$allforms = $this->model_extension_forumbuilder->getFormlink();
		
		foreach($allforms as $allform){
			$module_id = $allform['module_id'];
		}
		
		$setting = $this->model_extension_module->getModule($form_id);
		
		if($form_id == $module_id){
		if($setting){
		$data['captcha_status'] = $setting['formbuilder_captcha'];
		
		
		// Captcha
		if ($this->config->get($this->config->get('config_captcha') . '_status') && $data['captcha_status']) {
			$data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'), $this->error);
		} else {
			$data['captcha'] = '';
		}
		
		
		$this->document->setTitle($setting['formbuilder_desc'][$this->config->get('config_language_id')]['meta_tag']);
		$this->document->setDescription($setting['formbuilder_desc'][$this->config->get('config_language_id')]['meta_description']);
		$this->document->setKeywords($setting['formbuilder_desc'][$this->config->get('config_language_id')]['meta_keyword']);
		
		$data['breadcrumbs'][] = array(
			'text' => $setting['formbuilder_desc'][$this->config->get('config_language_id')]['heading'],
			'href' => $this->url->link('information/formbuilder', 'form_id=' .  $form_id)
		);
		
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
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		
		
			if($setting['formbuilder_guest']){
				$this->response->setOutput($this->load->view('information/formbuilder', $data));
			}elseif($this->customer->isLogged() && !$setting['formbuilder_guest']){
				$this->response->setOutput($this->load->view('information/formbuilder', $data));
			}
		}
		}else{
			$this->load->language('information/information');
			
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('information/formbuilder', 'form_id=' . $form_id)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}
	
}