<?php
class ControllerInformationSuccess extends Controller {
	public function index() {
		
		$this->load->language('information/success');
		$this->load->language('checkout/success');
		$this->load->model('extension/module');
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		if (isset($this->request->get['form_id'])) {
			$form_id = (int)$this->request->get['form_id'];
		} else {
			$form_id = 0;
		}
		
		$module_info = $this->model_extension_module->getModule($form_id);
		
		if($module_info){
		$successdata = $module_info['formbuilder_success_page'];
		$formdata = $module_info['formbuilder_desc'];
		$heading_title = $successdata[$this->config->get('config_language_id')]['heading'];
		$form_title = $formdata[$this->config->get('config_language_id')]['heading'];
		$data['sub_heading'] = $successdata[$this->config->get('config_language_id')]['sub_heading'];
		$heading_description = html_entity_decode($successdata[$this->config->get('config_language_id')]['description']);

		$this->document->setTitle($heading_title);

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $form_title,
			'href' => $this->url->link('information/formbuilder','&form_id='.$form_id)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_success'),
			'href' => $this->url->link('information/success','&form_id='.$form_id)
		);

		$data['heading_title'] = $heading_title;

		$data['text_message'] = $heading_description;

		$data['button_continue'] = $this->language->get('button_continue');

		$data['continue'] = $this->url->link('common/home');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('information/success', $data));
		}
	}
}