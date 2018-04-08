<?php
class ControllerCatalogFormlist extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('catalog/formlist');

		$this->document->setTitle($this->language->get('heading_title'));


		$this->getList();
	}


	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/forumbuilder', 'token=' . $this->session->data['token'] . $url, true)
		);
		
		$data['delete'] = $this->url->link('catalog/forumbuilder/delete', 'token=' . $this->session->data['token'] . $url, true);

		$data['enquiry_data'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);
		
		$this->load->model('extension/module');
		
		$data['module_data'] = array();
		$extension = 'formbuilder';
		$modules = $this->model_extension_module->getModulesByCode('formbuilder');
		

		foreach ($modules as $module){
			$data['module_data'][] = array(
				'module_id' => $module['module_id'],
				'name'      => $module['name'],
				'edit'      => $this->url->link('extension/module/' . $extension, 'token=' . $this->session->data['token'] . '&module_id=' . $module['module_id'], true),
				'delete'    => $this->url->link('catalog/formlist/delete', 'token=' . $this->session->data['token'] . '&module_id=' . $module['module_id'], true)
			);
		}
		
		$data['createform'] = $this->url->link('extension/module/formbuilder', 'token=' . $this->session->data['token'], true);
		
		
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$data['sort'] = $sort;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/formlist', $data));
	}
	
	public function delete() {
		$this->load->language('extension/extension/module');

		$this->load->model('extension/extension');

		$this->load->model('extension/module');
		
		$this->load->model('catalog/forumbuilder');

		if (isset($this->request->get['module_id']) && $this->validate()) {
			$this->model_extension_module->deleteModule($this->request->get['module_id']);
			$this->model_catalog_forumbuilder->deletekeyword($this->request->get['module_id']);

			$this->session->data['success'] = $this->language->get('text_success');
		}
		
		$this->getList();
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'catalog/formlist')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}