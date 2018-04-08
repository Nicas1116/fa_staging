<?php
class ControllerExtensionModuleFormBuilder extends Controller {
	private $error = array();
	
	public function install(){
		$this->load->language('extension/extension/module');

		$this->load->model('extension/extension');

		$this->load->model('extension/module');
		$extensions = $this->model_extension_extension->getInstalled('module');
		if(!in_array('formbuilder',$extensions)){
			$this->model_extension_extension->install('module', 'formbuilder');
			$this->load->controller('extension/module/formbuilder/install');
		}
	}
	
	public function index() {
		$this->install();
		$this->load->language('extension/module/formbuilder');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');
		$this->load->model('catalog/forumbuilder');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('formbuilder', $this->request->post);
				$module_id = $this->db->getLastId();
				$this->model_catalog_forumbuilder->addseomanager($module_id,$this->request->post['keyword']);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
				$this->model_catalog_forumbuilder->addseomanager($this->request->get['module_id'],$this->request->post['keyword']);
			}

			$this->session->data['success'] = $this->language->get('text_success');
	
			$this->response->redirect($this->url->link('catalog/formlist', 'token=' . $this->session->data['token'], true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_radio'] = $this->language->get('text_radio');
		$data['text_checkbox'] = $this->language->get('text_checkbox');
		$data['text_input'] = $this->language->get('text_input');
		$data['text_text'] = $this->language->get('text_text');
		$data['text_textarea'] = $this->language->get('text_textarea');
		$data['text_file'] = $this->language->get('text_file');
		$data['text_date'] = $this->language->get('text_date');
		$data['text_datetime'] = $this->language->get('text_datetime');
		$data['text_time'] = $this->language->get('text_time');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_address'] = $this->language->get('text_address');
		$data['text_choose'] = $this->language->get('text_choose');
		$data['text_password'] = $this->language->get('text_password');
		$data['text_number'] = $this->language->get('text_number');
		$data['text_localisation'] = $this->language->get('text_localisation');
		$data['text_country'] = $this->language->get('text_country');
		$data['text_zone'] = $this->language->get('text_zone');
		$data['text_field_value'] = $this->language->get('text_field_value');
		$data['text_sortorder'] = $this->language->get('text_sortorder');
		
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_recordresponse'] = $this->language->get('entry_recordresponse');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_guest'] = $this->language->get('entry_guest');
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_keyword'] = $this->language->get('entry_keyword');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_heading'] = $this->language->get('entry_heading');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_submit'] = $this->language->get('entry_submit');
		$data['entry_field'] = $this->language->get('entry_field');
		$data['entry_placeholder'] = $this->language->get('entry_placeholder');
		$data['entry_type'] = $this->language->get('entry_type');
		$data['entry_errormsg'] = $this->language->get('entry_errormsg');
		$data['entry_column'] = $this->language->get('entry_column');
		$data['entry_adminsubject'] = $this->language->get('entry_adminsubject');
		$data['entry_adminmsg'] = $this->language->get('entry_adminmsg');
		$data['entry_customersubject'] = $this->language->get('entry_customersubject');
		$data['entry_customermsg'] = $this->language->get('entry_customermsg');
		$data['entry_required'] = $this->language->get('entry_required');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_adminemail'] = $this->language->get('entry_adminemail');
		$data['entry_value'] = $this->language->get('entry_value');
		$data['entry_meta_tag'] = $this->language->get('entry_meta_tag');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$data['entry_adminmail'] = $this->language->get('entry_adminmail');
		$data['entry_customermail'] = $this->language->get('entry_customermail');
		$data['entry_keyword'] = $this->language->get('entry_keyword');
		$data['text_top'] = $this->language->get('text_top');
		$data['text_bottom'] = $this->language->get('text_bottom');
		$data['entry_subheading'] = $this->language->get('entry_subheading');
		$data['text_field_type'] = $this->language->get('text_field_type');
		$data['text_validation_info'] = $this->language->get('text_validation_info');
		$data['text_adminmail_setting'] = $this->language->get('text_adminmail_setting');
		$data['entry_subject'] = $this->language->get('entry_subject');
		$data['entry_msg'] = $this->language->get('entry_msg');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['text_customermail_Setting'] = $this->language->get('text_customermail_Setting');
		$data['text_save'] = $this->language->get('text_save');
		$data['text_cancel'] = $this->language->get('text_cancel');
		
		$data['help_recordresponse'] = $this->language->get('help_recordresponse');
		$data['help_adminemail'] = $this->language->get('help_adminemail');
		$data['help_keyword'] = $this->language->get('help_keyword');
		$data['help_top'] = $this->language->get('help_top');
		$data['help_bottom'] = $this->language->get('help_bottom');
		$data['help_guest'] = $this->language->get('help_guest');
		$data['help_submit'] = $this->language->get('help_submit');
		
		
		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_language'] = $this->language->get('tab_language');
		$data['tab_field'] = $this->language->get('tab_field');
		$data['tab_mail'] = $this->language->get('tab_mail');
		$data['tab_module'] = $this->language->get('tab_module');
		$data['tab_successpage'] = $this->language->get('tab_successpage');
		$data['tab_support'] = $this->language->get('tab_support');
		
		$data['text_keyword'] = $this->language->get('text_keyword');
		$data['show_captcha'] = $this->language->get('show_captcha');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_module_add'] = $this->language->get('button_module_add');
		
		$data['language_id'] = $this->config->get('config_language_id');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}
		
		if (isset($this->error['keyword'])) {
			$data['error_keyword'] = $this->error['keyword'];
		} else {
			$data['error_keyword'] = '';
		}
		
		if (isset($this->error['heading'])) {
			$data['error_heading'] = $this->error['heading'];
		} else {
			$data['error_heading'] = array();
		}

		
		if (isset($this->error['success_heading'])) {
			$data['error_success_heading'] = $this->error['success_heading'];
		} else {
			$data['error_success_heading'] = array();
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/formbuilder', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/formbuilder', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/formbuilder', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('extension/module/formbuilder', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}

		$data['cancel'] = $this->url->link('catalog/formlist', 'token=' . $this->session->data['token'], true);

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}
		
		
		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}
	
		if (isset($this->request->post['formbuilder_recordresponse'])) {
			$data['formbuilder_recordresponse'] = $this->request->post['formbuilder_recordresponse'];
		} elseif (!empty($module_info)) {
			$data['formbuilder_recordresponse'] = $module_info['formbuilder_recordresponse'];
		} else {
			$data['formbuilder_recordresponse'] = '';
		}
		
		if (isset($this->request->post['formbuilder_captcha'])) {
			$data['formbuilder_captcha'] = $this->request->post['formbuilder_captcha'];
		} elseif (!empty($module_info)) {
			$data['formbuilder_captcha'] = $module_info['formbuilder_captcha'];
		} else {
			$data['formbuilder_captcha'] = '';
		}
		
		if (isset($this->request->post['formbuilder_guest'])) {
			$data['formbuilder_guest'] = $this->request->post['formbuilder_guest'];
		} elseif (!empty($module_info)) {
			$data['formbuilder_guest'] = $module_info['formbuilder_guest'];
		} else {
			$data['formbuilder_guest'] = '';
		}
		
		if (isset($this->request->post['formbuilder_adminmail'])) {
			$data['formbuilder_adminmail'] = $this->request->post['formbuilder_adminmail'];
		} elseif (!empty($module_info)) {
			$data['formbuilder_adminmail'] = $module_info['formbuilder_adminmail'];
		} else {
			$data['formbuilder_adminmail'] = '';
		}
		
		if (isset($this->request->post['formbuilder_customermail'])) {
			$data['formbuilder_customermail'] = $this->request->post['formbuilder_customermail'];
		} elseif (!empty($module_info)) {
			$data['formbuilder_customermail'] = $module_info['formbuilder_customermail'];
		} else {
			$data['formbuilder_customermail'] = '';
		}
		
		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
		
		if (isset($this->request->post['keyword'])) {

			$data['keyword'] = $this->request->post['keyword'];

		} elseif (!empty($this->request->get['module_id'])) {

			$data['keyword'] = $this->model_catalog_forumbuilder->getkeyword($this->request->get['module_id']);

		} else {

			$data['keyword'] = '';

		}
		
		if (isset($this->request->post['top'])) {

			$data['top'] = $this->request->post['top'];

		} elseif (!empty($module_info['top'])) {

			$data['top'] = $module_info['top'];

		} else {

			$data['top'] = '';

		}
		
		if (isset($this->request->post['bottom'])) {

			$data['bottom'] = $this->request->post['bottom'];

		} elseif (!empty($module_info['bottom'])) {

			$data['bottom'] = $module_info['bottom'];

		} else {

			$data['bottom'] = '';

		}
		
		if (isset($this->request->post['adminemail'])) {

			$data['adminemail'] = $this->request->post['adminemail'];

		} elseif (!empty($module_info['adminemail'])) {

			$data['adminemail'] = $module_info['adminemail'];

		} else {

			$data['adminemail'] = $this->config->get('config_email');

		}
		
		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		if (isset($this->request->post['formbuilder_store'])) {
			$data['formbuilder_store'] = $this->request->post['formbuilder_store'];
		} elseif (!empty($module_info)) {
			$data['formbuilder_store'] = $module_info['formbuilder_store'];
		}else{
			$data['formbuilder_store'] = array(0);
		}
		
		$this->load->model('customer/customer_group');

		$data['customer_groups'] = $this->model_customer_customer_group->getCustomerGroups();
			
		if (isset($this->request->post['formbuilder_customer_group'])) {
			$formbuilder_customer_groups = $this->request->post['formbuilder_customer_group'];
		} elseif (!empty($module_info)) {
			$formbuilder_customer_groups = $module_info['formbuilder_customer_group'];
		} else {
			$formbuilder_customer_groups = array();
		}
		

		$data['formbuilder_customer_group'] = array();

		foreach ($formbuilder_customer_groups as $formbuilder_customer_group) {
			$data['formbuilder_customer_group'][] = $formbuilder_customer_group['customer_group_id'];
		}
		
		if(!$data['formbuilder_customer_group']){
			$data['formbuilder_customer_group'][] = $this->config->get('config_customer_group_id');
		}

		
		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['formbuilder_desc'])) {
			$data['formbuilder_desc'] = $this->request->post['formbuilder_desc'];
		} elseif (!empty($module_info)) {
			$data['formbuilder_desc'] = $module_info['formbuilder_desc'];
		} else {
			$data['formbuilder_desc'] = array();
		}
		
		if (isset($this->request->post['formbuilder_success_page'])) {
			$data['formbuilder_success_page'] = $this->request->post['formbuilder_success_page'];
		} elseif (!empty($module_info)) {
			$data['formbuilder_success_page'] = $module_info['formbuilder_success_page'];
		} else {
			$data['formbuilder_success_page'] = array();
		}
		
		if (isset($this->request->post['formbuilder_email'])) {
			$data['formbuilder_email'] = $this->request->post['formbuilder_email'];
		} elseif (!empty($module_info)) {
			$data['formbuilder_email'] = $module_info['formbuilder_email'];
		} else {
			$data['formbuilder_email'] = array();
		}
		
		if (isset($this->request->post['formbuilder_field'])) {
			$data['formbuilder_field'] = $this->request->post['formbuilder_field'];
		} elseif (!empty($module_info['formbuilder_field'])) {
			$data['formbuilder_field'] = $module_info['formbuilder_field'];
		} else {
			$data['formbuilder_field'] = array();
		}	
		
		
		if (isset($this->request->get['module_id'])) {
			$data['formbuilder_module_id'] = $this->request->get['module_id'];
		} elseif (!empty($module_info['formbuilder_module_id'])) {
			$data['formbuilder_module_id'] = $module_info['formbuilder_module_id'];
		} else {
			$data['formbuilder_module_id'] = 0;
		}
	
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/formbuilder', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/formbuilder')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		
		foreach ($this->request->post['formbuilder_desc'] as $language_id => $value) {
			if ((utf8_strlen($value['heading']) < 2) || (utf8_strlen($value['heading']) > 255)) {
				$this->error['heading'][$language_id] = $this->language->get('error_name');
			}
		}
		
		foreach ($this->request->post['formbuilder_success_page'] as $language_id => $value) {
			if ((utf8_strlen($value['heading']) < 2) || (utf8_strlen($value['heading']) > 255)) {
				$this->error['success_heading'][$language_id] = $this->language->get('error_name');
			}
		}

		return !$this->error;
	}
}