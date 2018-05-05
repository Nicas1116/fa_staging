<?php
class ControllerExtensionmulflatshpzip extends Controller {
 	private $error = array();  
	private $modpath = 'extension/mulflatshpzip';
	private $modtpl_list = 'extension/mulflatshpzip_list.tpl';
	private $modtpl_form = 'extension/mulflatshpzip_form.tpl';	
	private $modssl = 'SSL';
	private $token_str = ''; 
	
	public function __construct($registry) {
		parent::__construct($registry);
 		
		if(substr(VERSION,0,3)>='3.0' || substr(VERSION,0,3)=='2.3') { 
 			$this->modpath = 'extension/mulflatshpzip';
 			$this->modtpl_list = 'extension/mulflatshpzip_list';
			$this->modtpl_form = 'extension/mulflatshpzip_form';	 
  		} else if(substr(VERSION,0,3)=='2.2') {
 			$this->modtpl_list = 'extension/mulflatshpzip_list';
			$this->modtpl_form = 'extension/mulflatshpzip_form';	 
		} 
		 
		if(substr(VERSION,0,3)>='3.0') { 
 			$this->token_str = 'user_token=' . $this->session->data['user_token'];
		} else {
			$this->token_str = 'token=' . $this->session->data['token'];
		}
		
		if(substr(VERSION,0,3)>='3.0' || substr(VERSION,0,3)=='2.3' || substr(VERSION,0,3)=='2.2') { 
			$this->modssl = true;
		} 
 	}
 
	public function index() {
		$this->load->language($this->modpath);

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model($this->modpath);

		$this->getList();
	}

	public function add() {
		$this->load->language($this->modpath);

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model($this->modpath);

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_extension_mulflatshpzip->addmulflatshpzip($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->response->redirect($this->url->link($this->modpath, $this->token_str . $url, $this->modssl));
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language($this->modpath);

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model($this->modpath);

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_extension_mulflatshpzip->editmulflatshpzip($this->request->get['mulflatshpzip_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->response->redirect($this->url->link($this->modpath, $this->token_str . $url, $this->modssl));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language($this->modpath);

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model($this->modpath);

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $mulflatshpzip_id) {
				$this->model_extension_mulflatshpzip->deletemulflatshpzip($mulflatshpzip_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->response->redirect($this->url->link($this->modpath, $this->token_str . $url, $this->modssl));
		}

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
			'href' => $this->url->link('common/dashboard', $this->token_str, $this->modssl)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link($this->modpath, $this->token_str . $url, $this->modssl)
		);

		$data['add'] = $this->url->link($this->modpath.'/add', $this->token_str . $url, $this->modssl);
		$data['delete'] = $this->url->link($this->modpath.'/delete', $this->token_str . $url, $this->modssl);
 
		$data['mulflatshpzips'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$mulflatshpzip_total = $this->model_extension_mulflatshpzip->getTotalmulflatshpzips();

		$results = $this->model_extension_mulflatshpzip->getmulflatshpzips($filter_data);

		foreach ($results as $result) {
			$data['mulflatshpzips'][] = array(
				'mulflatshpzip_id' => $result['mulflatshpzip_id'],
				'name'        => $result['name'],
 				'status'     => $result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),
				'date_start'    => date($this->language->get('date_format_short'), strtotime($result['date_start'])),
				'date_end'    => date($this->language->get('date_format_short'), strtotime($result['date_end'])),
				'edit'        => $this->url->link($this->modpath.'/edit', $this->token_str . '&mulflatshpzip_id=' . $result['mulflatshpzip_id'] . $url, $this->modssl),
				'delete'      => $this->url->link($this->modpath.'/delete', $this->token_str . '&mulflatshpzip_id=' . $result['mulflatshpzip_id'] . $url, $this->modssl)
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
 		$data['column_status'] = $this->language->get('column_status');
		$data['column_date_start'] = $this->language->get('column_date_start');
		$data['column_date_end'] = $this->language->get('column_date_end');
 		$data['column_action'] = $this->language->get('column_action');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_rebuild'] = $this->language->get('button_rebuild');

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

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link($this->modpath, $this->token_str . '&sort=name' . $url, $this->modssl);
 		$data['sort_status'] = $this->url->link($this->modpath, $this->token_str . '&sort=status' . $url, $this->modssl);
 
		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $mulflatshpzip_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link($this->modpath, $this->token_str . $url . '&page={page}', $this->modssl);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($mulflatshpzip_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($mulflatshpzip_total - $this->config->get('config_limit_admin'))) ? $mulflatshpzip_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $mulflatshpzip_total, ceil($mulflatshpzip_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view($this->modtpl_list, $data));
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['mulflatshpzip_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_none'] = $this->language->get('text_none');
 		$data['text_extension_doc'] = $this->language->get('text_extension_doc');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
 		
		$data['text_fixed_amount'] = $this->language->get('text_fixed_amount');
		$data['text_percentage'] = $this->language->get('text_percentage');
		
		$data['text_operation_type_fee'] = $this->language->get('text_operation_type_fee');
		$data['text_operation_type_discount'] = $this->language->get('text_operation_type_discount');		
		
		$data['button_remove'] = $this->language->get('button_remove');		
		$data['button_add'] = $this->language->get('button_add');		
  
		$data['entry_name'] = $this->language->get('entry_name'); 
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_zipcode'] = $this->language->get('entry_zipcode');
 		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_date'] = $this->language->get('entry_date');
		$data['entry_date_start'] = $this->language->get('entry_date_start');
		$data['entry_date_end'] = $this->language->get('entry_date_end');
		
		$data['entry_order_total_text'] = $this->language->get('entry_order_total_text');
 		$data['entry_totfrom'] = $this->language->get('entry_totfrom');
		$data['entry_totto'] = $this->language->get('entry_totto');
		$data['entry_cost'] = $this->language->get('entry_cost');
 		$data['entry_costtype'] = $this->language->get('entry_costtype');
  
  		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = array();
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
			'href' => $this->url->link('common/dashboard', $this->token_str, $this->modssl)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link($this->modpath, $this->token_str . $url, $this->modssl)
		);

		if (!isset($this->request->get['mulflatshpzip_id'])) {
			$data['action'] = $this->url->link($this->modpath.'/add', $this->token_str . $url, $this->modssl);
		} else {
			$data['action'] = $this->url->link($this->modpath.'/edit', $this->token_str . '&mulflatshpzip_id=' . $this->request->get['mulflatshpzip_id'] . $url, $this->modssl);
		}

		$data['cancel'] = $this->url->link($this->modpath, $this->token_str . $url, $this->modssl);

		if (isset($this->request->get['mulflatshpzip_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$mulflatshpzip_info = $this->model_extension_mulflatshpzip->getmulflatshpzip($this->request->get['mulflatshpzip_id']);
		}

 		if(substr(VERSION,0,3)>='3.0') { 
 			$data['user_token'] = $this->session->data['user_token']; 
		} else {
			$data['token'] = $this->session->data['token'];
		}

		$this->load->model('localisation/language');
  		$languages = $this->model_localisation_language->getLanguages();
		foreach($languages as $language) {
			if(substr(VERSION,0,3)>='3.0' || substr(VERSION,0,3)=='2.3' || substr(VERSION,0,3)=='2.2') {
				$imgsrc = "language/".$language['code']."/".$language['code'].".png";
			} else {
				$imgsrc = "view/image/flags/".$language['image'];
			}
			$data['languages'][] = array("language_id" => $language['language_id'], "name" => $language['name'], "imgsrc" => $imgsrc);
		}
 
  		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($mulflatshpzip_info)) {
			$data['name'] = $mulflatshpzip_info['name'];
		} else {
			$data['name'] = '';
		}
		
		if (isset($this->request->post['mulflatshpzip_cost_info'])) {
			$data['mulflatshpzip_cost_info'] = $this->request->post['mulflatshpzip_cost_info'];
		} elseif (isset($this->request->get['mulflatshpzip_id'])) {
			$data['mulflatshpzip_cost_info'] = $this->model_extension_mulflatshpzip->getmulflatshpzipdiscount($this->request->get['mulflatshpzip_id']);
		} else {
			$data['mulflatshpzip_cost_info'] = array();
		} 
		
		$data['mulflatshpzip_cost_data'] = $data['mulflatshpzip_cost_info'];
		
		// Zipcode
		
		if (isset($this->request->post['zipcode'])) {
			$data['zipcode'] = $this->request->post['zipcode'];
		} elseif (!empty($mulflatshpzip_info)) {
			$data['zipcode'] = $mulflatshpzip_info['zipcode'];
		} else {
			$data['zipcode'] = '';
		}
		
 		// store
		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();
		
		if (isset($this->request->post['store'])) {
			$data['store'] = $this->request->post['store'];
		} elseif (!empty($mulflatshpzip_info)) {
			$data['store'] = explode(",",$mulflatshpzip_info['store']);
		} else {
			$data['store'] = array();
		}
		
		// customer_group
		$data['customer_groups'] = $this->getCustomerGroups();
		
		if (isset($this->request->post['customer_group'])) {
			$data['customer_group'] = $this->request->post['customer_group'];
		} elseif (!empty($mulflatshpzip_info)) {
			$data['customer_group'] = explode(",",$mulflatshpzip_info['customer_group']);
		} else {
			$data['customer_group'] = array();
		} 
		
		if (isset($this->request->post['date_start'])) {
			$data['date_start'] = $this->request->post['date_start'];
		} elseif (!empty($mulflatshpzip_info)) {
			$data['date_start'] = ($mulflatshpzip_info['date_start'] != '0000-00-00') ? $mulflatshpzip_info['date_start'] : '';
		} else {
			$data['date_start'] = date('Y-m-d');
		}
		
		if (isset($this->request->post['date_end'])) {
			$data['date_end'] = $this->request->post['date_end'];
		} elseif (!empty($mulflatshpzip_info)) {
			$data['date_end'] = ($mulflatshpzip_info['date_end'] != '0000-00-00') ? $mulflatshpzip_info['date_end'] : '';
		} else {
			$data['date_end'] = date('Y-m-d');
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($mulflatshpzip_info)) {
			$data['status'] = $mulflatshpzip_info['status'];
		} else {
			$data['status'] = true;
		}
 
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view($this->modtpl_form, $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', $this->modpath)) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 2) || (utf8_strlen($this->request->post['name']) > 255)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
		
		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', $this->modpath)) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	} 
	
	public function getCustomerGroups($data = array()) {
 		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_group cg LEFT JOIN " . DB_PREFIX . "customer_group_description cgd ON (cg.customer_group_id = cgd.customer_group_id) WHERE cgd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY cgd.name ASC");
 		return $query->rows;
	} 
}
