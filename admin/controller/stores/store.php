<?php
class ControllerStoresStore extends Controller {
	private $error = array();
	public function index() {
		$this->document->setTitle("Stores");
		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'pd.outlet_name';
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
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => "Home",
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => "Stores",
			'href' => $this->url->link('stores/store', 'token=' . $this->session->data['token'] . $url, true)
		);
		$this->load->model('stores/store');
		$data['products'] = array();
		$filter_data = array();
		$product_total = $this->model_stores_store->getTotalProducts($filter_data);

		$results = $this->model_stores_store->getProducts($filter_data);

		foreach ($results as $key => $value) {
			$data['products'][$key] = $value;
			$data['products'][$key]["edit"] = $this->url->link('stores/store/edit', 'token=' . $this->session->data['token'] . '&store_id=' . $value['outlet_id'] . $url, true);
		}

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

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		
		$pagination = new Pagination();
		$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = null;//$pagination->render();

		$data['results'] = "";//sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($product_total - $this->config->get('config_limit_admin'))) ? $product_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $product_total, ceil($product_total / $this->config->get('config_limit_admin')));

		$data['add'] = $this->url->link('stores/store/add', 'token=' . $this->session->data['token'] . $url, true);
		$data["heading_title"] = "Stores";
		
		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('stores/stores_list', $data));
	}

	public function add() {
		$this->document->setTitle("Store");
		$this->load->model('stores/store');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_stores_store->addStore($this->request->post);
			$this->response->redirect($this->url->link('stores/store', 'token=' . $this->session->data['token'] . $url, true));
		}else{
			$this->getForm();
		}
	}

	public function edit() {
		$this->document->setTitle("Store");
		$this->load->model('stores/store');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_stores_store->editStore($this->request->get['store_id'],$this->request->post);
			$this->response->redirect($this->url->link('stores/store', 'token=' . $this->session->data['token'] . $url, true));
		}else{
			$this->getForm();
		}
	}


	public function getForm(){
		$data=array();
		$data["atitle"] = "Add Store";
		if (isset($this->request->get['store_id'])) {
			$store_info = $this->model_stores_store->getStore($this->request->get['store_id']);
			if(sizeof($store_info)>0){
				$store_info = $store_info[0];
				$data["atitle"] = "Edit Store";
			}
		}
		//echo json_encode($store_info);
		if (isset($this->request->get['outlet_id'])) {
			$data['outlet_id'] = $this->request->get['outlet_id'];
		} elseif (!empty($store_info)) {
			$data['outlet_id'] = $store_info['outlet_id'];
		} else {
			$data['outlet_id'] = '';
		}

		if (isset($this->request->post['outlet_name'])) {
			$data['outlet_name'] = $this->request->post['outlet_name'];
		} elseif (!empty($store_info)) {
			$data['outlet_name'] = $store_info['outlet_name'];
		} else {
			$data['outlet_name'] = '';
		}
		
		if (isset($this->request->post['outlet_address'])) {
			$data['outlet_address'] = $this->request->post['outlet_address'];
		} elseif (!empty($store_info)) {
			$data['outlet_address'] = $store_info['outlet_address'];
		} else {
			$data['outlet_address'] = '';
		}
		
		if (isset($this->request->post['outlet_contact'])) {
			$data['outlet_contact'] = $this->request->post['outlet_contact'];
		} elseif (!empty($store_info)) {
			$data['outlet_contact'] = $store_info['outlet_contact'];
		} else {
			$data['outlet_contact'] = '';
		}
		
		if (isset($this->request->post['outlet_ophour'])) {
			$data['outlet_ophour'] = $this->request->post['outlet_ophour'];
		} elseif (!empty($store_info)) {
			$data['outlet_ophour'] = $store_info['outlet_ophour'];
		} else {
			$data['outlet_ophour'] = '';
		}

		if (isset($this->request->post['outlet_coordinate'])) {
			$data['outlet_coordinate'] = $this->request->post['outlet_coordinate'];
		} elseif (!empty($store_info)) {
			$data['outlet_coordinate'] = $store_info['outlet_coordinate'];
		} else {
			$data['outlet_coordinate'] = '';
		}
		
		if (isset($this->request->post['outlet_status'])) {
			$data['outlet_status'] = $this->request->post['outlet_status'];
		} elseif (!empty($store_info)) {
			$data['outlet_status'] = $store_info['outlet_status'];
		} else {
			$data['outlet_status'] = 1;
		}
		
		if (isset($this->request->post['outlet_states'])) {
			$data['outlet_states'] = $this->request->post['outlet_states'];
		} elseif (!empty($store_info)) {
			$data['outlet_states'] = $store_info['outlet_states'];
		} else {
			$data['outlet_states'] = '';
		}
		

		$data["heading_title"] ="Store";
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => "Store",
			'href' => $this->url->link('stores/store', 'token=' . $this->session->data['token'] , true)
		);

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

		if (isset($this->error['meta_title'])) {
			$data['error_meta_title'] = $this->error['meta_title'];
		} else {
			$data['error_meta_title'] = array();
		}

		if (isset($this->error['model'])) {
			$data['error_model'] = $this->error['model'];
		} else {
			$data['error_model'] = '';
		}

		if (isset($this->error['keyword'])) {
			$data['error_keyword'] = $this->error['keyword'];
		} else {
			$data['error_keyword'] = '';
		}


		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_model'])) {
			$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_price'])) {
			$url .= '&filter_price=' . $this->request->get['filter_price'];
		}

		if (isset($this->request->get['filter_quantity'])) {
			$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if (!isset($this->request->get['store_id'])) {
			$data['action'] = $this->url->link('stores/store/add', 'token=' . $this->session->data['token'] . $url, true);
		} else {
			$data['action'] = $this->url->link('stores/store/edit', 'token=' . $this->session->data['token'] . '&store_id=' . $this->request->get['store_id'] . $url, true);
		}

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data["cancel"] =  $this->url->link('stores/store', 'token=' . $this->session->data['token']. $url, true);
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$this->response->setOutput($this->load->view('stores/stores_form', $data));
	}
	
	protected function validateForm() {
		
		if ((utf8_strlen($this->request->post['outlet_name']) < 1) || (utf8_strlen($this->request->post['outlet_name']) > 64)) {
			$this->error['outlet_name'] ="outlet_name";
		}

		return !$this->error;
	}	
}
?>