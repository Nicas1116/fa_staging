<?php
class ControllerCatalogForumbuilder extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/formbuilder');
		$this->load->language('catalog/formlist');

		$this->document->setTitle($this->language->get('heading_title1'));

		$this->load->model('catalog/forumbuilder');
		
		$this->load->model('customer/customer');
		
		$this->load->model('extension/module');
		
		$this->load->model('catalog/category');

		$this->getList();
	}


	protected function getList() {
		if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->get['filter_name'];
		} else {
			$filter_name = null;
		}
		
		if (isset($this->request->get['filter_customer'])) {
			$filter_customer = $this->request->get['filter_customer'];
		} else {
			$filter_customer = null;
		}
		
		if (isset($this->request->get['filter_from_date'])) {
			$filter_from_date = $this->request->get['filter_from_date'];
		} else {
			$filter_from_date = null;
		}
		
		if (isset($this->request->get['filter_to_date'])) {
			$filter_to_date = $this->request->get['filter_to_date'];
		} else {
			$filter_to_date = null;
		}
		
		if (isset($this->request->get['filter_ip'])) {
			$filter_ip = $this->request->get['filter_ip'];
		} else {
			$filter_ip = null;
		}
		
		
		
		
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
		
		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_customer'])) {
			$url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_from_date'])) {
			$url .= '&filter_from_date=' . urlencode(html_entity_decode($this->request->get['filter_from_date'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_to_date'])) {
			$url .= '&filter_to_date=' . urlencode(html_entity_decode($this->request->get['filter_to_date'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_ip'])) {
			$url .= '&filter_ip=' . urlencode(html_entity_decode($this->request->get['filter_ip'], ENT_QUOTES, 'UTF-8'));
		}
		
		$data['column_name'] = $this->language->get('column_name');
		$data['column_customer'] = $this->language->get('column_customer');
		$data['column_date'] = $this->language->get('column_date');
		$data['column_action'] = $this->language->get('column_action');
		$data['form_detail'] = $this->language->get('form_detail');
		$data['customer_details'] = $this->language->get('customer_details');
		$data['form_details'] = $this->language->get('form_details');
		$data['text_formname'] = $this->language->get('text_formname');
		$data['text_from_date'] = $this->language->get('text_from_date');
		$data['text_ip'] = $this->language->get('text_ip');
		$data['text_todate'] = $this->language->get('text_todate');
		$data['text_dateadded'] = $this->language->get('text_dateadded');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title1'),
			'href' => $this->url->link('catalog/forumbuilder', 'token=' . $this->session->data['token'] . $url, true)
		);
		
		$data['delete'] = $this->url->link('catalog/forumbuilder/delete', 'token=' . $this->session->data['token'] . $url, true);

		$data['enquiry_data'] = array();
		
		

		$filter_data = array(
			'filter_name' 		=> $filter_name,
			'filter_customer' 	=> $filter_customer,
			'filter_from_date'  => $filter_from_date,
			'filter_to_date' 	=> $filter_to_date,
			'filter_ip' 		=> $filter_ip,
			'sort'  			=> $sort,
			'order' 			=> $order,
			'start' 			=> ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' 			=> $this->config->get('config_limit_admin')
		);

		$enquiry_total = $this->model_catalog_forumbuilder->getTotalEnquiry($filter_data);

		$results = $this->model_catalog_forumbuilder->getEnquiry($filter_data);

		foreach ($results as $result) {
			$data['enquiry_data'][] = array(
				'forumbuilder_id' => $result['forumbuilder_id'],
				'customer'  	  => (($result['customer_id']) ? $this->model_customer_customer->getCustomer($result['customer_id'])['firstname'].' '.$this->model_customer_customer->getCustomer($result['customer_id'])['lastname'] : 'Guest'),
				'module_id'  	  => (isset($result['module_id']) ? $this->model_extension_module->getModule($result['module_id']) : ''),
				'forumdata'  	  => $result['forumdata'],
				'forumname'  	  => $result['forumname'],
				'ipaddress'  	  => $result['ipaddress'],
				'check_ip'		  => 'http://www.whatismyipaddress.com/ip/'. $result['ipaddress'],
				'date_added'  	  => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
			);
			
		}
		
		$data['heading_title'] = $this->language->get('heading_title1');

		$data['text_list'] = $this->language->get('text_list1');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_action'] = $this->language->get('column_action');

	
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_filter'] = $this->language->get('button_filter');
		
		$data['token'] = $this->session->data['token'];

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
		
		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_customer'])) {
			$url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_from_date'])) {
			$url .= '&filter_from_date=' . urlencode(html_entity_decode($this->request->get['filter_from_date'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_to_date'])) {
			$url .= '&filter_to_date=' . urlencode(html_entity_decode($this->request->get['filter_to_date'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_ip'])) {
			$url .= '&filter_ip=' . urlencode(html_entity_decode($this->request->get['filter_ip'], ENT_QUOTES, 'UTF-8'));
		}

		$data['sort_name'] = $this->url->link('catalog/forumbuilder', 'token=' . $this->session->data['token'] . '&sort=name' . $url, true);
		$data['sort_sort_order'] = $this->url->link('catalog/forumbuilder', 'token=' . $this->session->data['token'] . '&sort=sort_order' . $url, true);

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $enquiry_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('catalog/forumbuilder', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($enquiry_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($enquiry_total - $this->config->get('config_limit_admin'))) ? $enquiry_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $enquiry_total, ceil($enquiry_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		
		$data['filter_name'] 		= $filter_name;
		$data['filter_customer'] 	= $filter_customer;
		$data['filter_from_date'] 	= $filter_from_date;
		$data['filter_to_date'] 	= $filter_to_date;
		$data['filter_ip'] 			= $filter_ip;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/forumbuilder', $data));
	}
	
	public function delete() {
		$this->load->language('extension/module/formbuilder');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('catalog/forumbuilder');
		if (isset($this->request->post['selected'])) {
			
			foreach ($this->request->post['selected'] as $forumbuilder_id) {
				$this->model_catalog_forumbuilder->deleteEnquiry($forumbuilder_id);
			}
			$url = '';
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('catalog/forumbuilder', 'token=' . $this->session->data['token'] . $url, true));
		}
		$this->getList();
	}

}
