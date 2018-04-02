<?php
class ModelExtensionShippingmulflatshpzipshipping extends Controller {	
	private $error = array();
	private $modpath = 'shipping/mulflatshpzipshipping'; 
 	private $modname = 'mulflatshpzipshipping';
	private $modname_module = 'mulflatshpzip';
	private $modtext = 'Zipcode Based Multi Flat Rate Shipping';
	private $modid = '27323';
	private $modssl = 'SSL';
	private $modemail = 'opencarttools@gmail.com'; 
	private $langid = 0;
	private $storeid = 0;
	private $custgrpid = 0;
	
	public function __construct($registry) {
		parent::__construct($registry);
		
		$this->langid = (int)$this->config->get('config_language_id');
		$this->storeid = (int)$this->config->get('config_store_id');
		$this->custgrpid = (int)$this->config->get('config_customer_group_id');
 		
		if(substr(VERSION,0,3)>='3.0' || substr(VERSION,0,3)=='2.3') { 
			$this->modtpl = 'extension/shipping/mulflatshpzipshipping';
			$this->modpath = 'extension/shipping/mulflatshpzipshipping';
 		} else if(substr(VERSION,0,3)=='2.2') {
			$this->modtpl = 'shipping/mulflatshpzipshipping';
		} 
		
		if(substr(VERSION,0,3)>='3.0') { 
			$this->modname = 'shipping_mulflatshpzipshipping';
			$this->modname_module = 'module_mulflatshpzip';
		} 
		
		if(substr(VERSION,0,3)>='3.0' || substr(VERSION,0,3)=='2.3' || substr(VERSION,0,3)=='2.2') { 
			$this->modssl = true;
		} 
 	} 
	
	function getQuote($address) {
		$this->load->language($this->modpath);
		
		$data['mulflatshpzipshipping_status'] = $this->setvalue($this->modname_module.'_status'); 	
 		$data['mulflatshpzipshipping_tax_class_id'] = $this->setvalue($this->modname.'_tax_class_id');	
		$data['mulflatshpzipshipping_sort_order'] = $this->setvalue($this->modname.'_sort_order');	
		
		if ($this->cart->hasProducts() && $data['mulflatshpzipshipping_status']) { 
			
			$sub_total = $this->cart->getSubTotal(); 
 			
			$quote_data = $this->checkmulflatshpzipdiscount($sub_total); 
 			
			//print_r($quote_data);
			
			if($quote_data) { 
				
				$method_data = array(
					'code'       => $this->modname,
					'title'      => $this->language->get('text_description'),
					'quote'      => $quote_data,
					'sort_order' => $data['mulflatshpzipshipping_sort_order'],
					'error'      => false
				);
				
				return $method_data;	
 			}		
		}
	}
	
	public function checkmulflatshpzipdiscount($subtotal) {
		if($this->config->get((substr(VERSION,0,3)>='3.0' ? 'module_mulflatshpzip_status' : 'mulflatshpzip_status'))) {
			$data['mulflatshpzipshipping_tax_class_id'] = $this->setvalue($this->modname.'_tax_class_id');	
			 
			$mulflatshpzip_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "mulflatshpzip WHERE status = 1 and date_start <= curdate() and date_end >= curdate()");
			
			if($mulflatshpzip_query->num_rows) {
				$mulflatshpzip_cost_info = array();
				
				foreach($mulflatshpzip_query->rows as $result) {
					$checkproduct = $this->validateproduct($result);
					//var_dump($checkproduct);//exit;
					if($checkproduct) {
						
 						$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "mulflatshpzip_cost WHERE mulflatshpzip_id = '" . (int)$result['mulflatshpzip_id'] . "' and totfrom <= '".$subtotal."' and totto >= '".$subtotal."' ");
 						
						if($query->rows) {
							foreach($query->rows as $resultcost) {
								//print_r($resultcost);
								$order_total_text = json_decode($resultcost['order_total_text'], true);
								/*$mulflatshpzip_cost_info = array(
									'mulflatshpzip_cost_id' => $resultcost['mulflatshpzip_cost_id'],
									'mulflatshpzip_id' 	=> $resultcost['mulflatshpzip_id'],		
									'order_total_text' 	=> isset($order_total_text[$this->langid]) ? $order_total_text[$this->langid] : '',																	
									'totfrom'      		=> (float)$resultcost['totfrom'],
									'totto'      		=> (float)$resultcost['totto'],
									'cost'     			=> (float)$resultcost['cost']
								);*/
								
								$cost = 0;
								
								if($resultcost['costtype'] == 1) {
									// fixed amount
  									$cost = $resultcost['cost'];
								} else {
									// percentage
 									$cost = $subtotal / 100 * $resultcost['cost'];
								}
								
								if($cost >= 0) { 
									$mulflatshpzip_cost_info[$resultcost['mulflatshpzip_cost_id']] = array(
										'code'         => 'mulflatshpzipshipping.'.$resultcost['mulflatshpzip_cost_id'],
										'title'        => isset($order_total_text[$this->langid]) ? $order_total_text[$this->langid] : '',
										'resultcost'   => (float)$resultcost['cost'],
										'cost'         => $cost,
										'tax_class_id' => $data['mulflatshpzipshipping_tax_class_id'],
										'text'         => (substr(VERSION,0,3)>='3.0' || substr(VERSION,0,3)=='2.3' || substr(VERSION,0,3)=='2.2') ? $this->currency->format((float)$cost , $this->session->data['currency']) : $this->currency->format((float)$cost) 
									);
								}
							}
						}  
					}
				}
				//print_r($mulflatshpzip_cost_info);
				return $mulflatshpzip_cost_info;
			} else {
				return false;
			} 
		}
	}
	
	public function validateproduct($data) {
 		// check store and customer group 
		$address = isset($this->session->data['shipping_address']) ? $this->session->data['shipping_address'] : array();
		$data['zipcode'] = ($data['zipcode'] != '') ? explode(",",$data['zipcode']) : array();
		$data['store'] = ($data['store'] != '') ? explode(",",$data['store']) : array();
		$data['customer_group'] = ($data['customer_group']) ? explode(",",$data['customer_group']) : array();
 		
		if($address && in_array($address['postcode'], $data['zipcode']) && in_array($this->storeid, $data['store']) && in_array($this->custgrpid, $data['customer_group'])) {
			return true;	
		} else {
			return false;
		}
	
	}  
	
	protected function setvalue($postfield) {
		return $this->config->get($postfield);
	}
}