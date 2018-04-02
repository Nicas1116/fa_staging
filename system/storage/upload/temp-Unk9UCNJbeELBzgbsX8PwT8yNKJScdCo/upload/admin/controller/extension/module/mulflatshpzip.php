<?php
class ControllerExtensionModulemulflatshpzip extends Controller {	
	private $error = array();
	private $modpath = 'module/mulflatshpzip'; 
	private $modtpl = 'module/mulflatshpzip.tpl';
	private $modname = 'mulflatshpzip';
	private $modtext = 'Zipcode Based Multi Flat Rate Shipping';
	private $modid = '27323';
	private $modssl = 'SSL';
	private $modemail = 'opencarttools@gmail.com';
	private $token_str = '';
	private $modurl = 'extension/module';
	private $modurltext = '';

	public function __construct($registry) {
		parent::__construct($registry);
 		
		if(substr(VERSION,0,3)>='3.0' || substr(VERSION,0,3)=='2.3') { 
			$this->modtpl = 'extension/module/mulflatshpzip';
			$this->modpath = 'extension/module/mulflatshpzip';
		} else if(substr(VERSION,0,3)=='2.2') {
			$this->modtpl = 'module/mulflatshpzip';
		} 
		
		if(substr(VERSION,0,3)>='3.0') { 
			$this->modname = 'module_mulflatshpzip';
			$this->modurl = 'marketplace/extension'; 
			$this->token_str = 'user_token=' . $this->session->data['user_token'] . '&type=module';
		} else if(substr(VERSION,0,3)=='2.3') {
			$this->modurl = 'extension/extension';
			$this->token_str = 'token=' . $this->session->data['token'] . '&type=module';
		} else {
			$this->token_str = 'token=' . $this->session->data['token'];
		}
		
		if(substr(VERSION,0,3)>='3.0' || substr(VERSION,0,3)=='2.3' || substr(VERSION,0,3)=='2.2') { 
			$this->modssl = true;
		} 
 	} 
	
	public function index() {
		$data = $this->load->language($this->modpath);
		$this->modurltext = $this->language->get('text_extension');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting($this->modname, $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			if(! (isset($this->request->post['svsty']) && $this->request->post['svsty'] == 1)) {
				$this->response->redirect($this->url->link($this->modurl, $this->token_str, $this->modssl));
			}
		}

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
 		$data['entry_status'] = $this->language->get('entry_status');
  		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', $this->token_str, $this->modssl)
		);
		
		$data['breadcrumbs'][] = array(
			'text' => $this->modurltext,
			'href' => $this->url->link($this->modurl, $this->token_str, $this->modssl)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link($this->modpath, $this->token_str, $this->modssl)
		);

		$data['action'] = $this->url->link($this->modpath, $this->token_str, $this->modssl);
		
		$data['cancel'] = $this->url->link($this->modurl, $this->token_str , $this->modssl); 
		
		if(substr(VERSION,0,3)>='3.0') { 
			$data['user_token'] = $this->session->data['user_token'];
		} else {
			$data['token'] = $this->session->data['token'];
		}
		 
		$data[$this->modname.'_status'] = $this->setvalue($this->modname.'_status');	
 		
  		$data['modname'] = $this->modname;
		$data['modemail'] = $this->modemail;
  		  
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view($this->modtpl, $data));
	}
	
	protected function setvalue($postfield) {
		if (isset($this->request->post[$postfield])) {
			$postfield_value = $this->request->post[$postfield];
		} else {
			$postfield_value = $this->config->get($postfield);
		} 	
 		return $postfield_value;
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', $this->modpath)) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
	
	public function install() {
		$tbl_query1 = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "mulflatshpzip' ");
		if($tbl_query1->num_rows == 0) {
			$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "mulflatshpzip` (
				  `mulflatshpzip_id` int(11) NOT NULL AUTO_INCREMENT,
				  `name` varchar(255) NOT NULL,
 				  `store` varchar(255) NOT NULL,
				  `customer_group` varchar(255) NOT NULL,
				  `zipcode` LONGBLOB,
				  `status` tinyint(1) NOT NULL,
				  `date_start` date, 
				  `date_end` date,
				  PRIMARY KEY (`mulflatshpzip_id`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
			");
		}
		
		$tbl_query2 = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "mulflatshpzip_cost' ");
		if($tbl_query2->num_rows == 0) {
			$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "mulflatshpzip_cost` (
				  `mulflatshpzip_cost_id` int(11) NOT NULL AUTO_INCREMENT,
				  `mulflatshpzip_id` int(11),
				  `order_total_text` text,
 				  `totfrom` decimal(10,2) NOT NULL,
				  `totto` decimal(10,2) NOT NULL,
				  `cost` decimal(10,2) NOT NULL,
				  `costtype` tinyint(1) NOT NULL,
 				  PRIMARY KEY (`mulflatshpzip_cost_id`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
			");
		}
		
		@mail($this->modemail,
		"Extension Installed",
		"Hello!" . "\r\n" .  
		"Extension Name :  ".$this->modtext."" ."\r\n". 
		"Extension ID : ".$this->modid ."\r\n". 
		"Version : " . VERSION. "\r\n". 
		"Installed At : " .HTTP_CATALOG ."\r\n". 
		"Licence Start Date : " .date("Y-m-d") ."\r\n".  
		"Licence Expiry Date : " .date("Y-m-d", strtotime('+1 year'))."\r\n". 
		"From: ".$this->config->get('config_email'),
		"From: ".$this->config->get('config_email'));      
	}
	public function uninstall() { 
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "mulflatshpzip` ");
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "mulflatshpzip_cost` ");
		
		@mail($this->modemail,
		"Extension Uninstalled",
		"Hello!" . "\r\n" .  
		"Extension Name :  ".$this->modtext."" ."\r\n". 
		"Extension ID : ".$this->modid ."\r\n". 
		"Version : " . VERSION. "\r\n". 
		"Installed At : " .HTTP_CATALOG ."\r\n". 
		"Licence Start Date : " .date("Y-m-d") ."\r\n".  
		"Licence Expiry Date : " .date("Y-m-d", strtotime('+1 year'))."\r\n". 
		"From: ".$this->config->get('config_email'),
		"From: ".$this->config->get('config_email'));        
	}
}