<?php 
	class ControllerInformationShipping extends Controller {
		public function index() {
			$this->load->language('information/information');
			$config = $this->registry->get("config");
			$data['sconfig'] = $config;
			$data['themename'] = $config->get("theme_default_directory");
			$this->document->setTitle("Shipping");

		
			$data['heading_title'] = "Shipping";
			
			$data["data_faq"] = [array('faq_title' => 'Lorem ipsum dolor sit amet?','faq_ans' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),array('faq_title' => 'Lorem ipsum dolor sit amet?','faq_ans' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),array('faq_title' => 'Lorem ipsum dolor sit amet?','faq_ans' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),array('faq_title' => 'Lorem ipsum dolor sit amet?','faq_ans' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),array('faq_title' => 'Lorem ipsum dolor sit amet?','faq_ans' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),array('faq_title' => 'Lorem ipsum dolor sit amet?','faq_ans' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ')];

			$data['column_left'] = $this->load->controller('information/shipping/menu');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['delivery_zone'] = $this->load->controller('information/shipping/delivery_zone');
			
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
			$data['active'] = 'faqs';
			$data['block'] = [9];
			$this->response->setOutput($this->load->view('information/shipping', $data));
		}
		public function delivery_zone() {
			$data=array();

			$this->load->model('extension/shipping/mulflatshpzipshipping');
			$shipping_list = $this->model_extension_shipping_mulflatshpzipshipping->getFullList();
			foreach ($shipping_list as $key => $shipping) {
				$arral = explode(",",$shipping["zipcode"]);
				$zipcode_text = $arral[0]." - ". $arral[sizeof($arral)-1];
				unset($shipping_list[$key]["zipcode"]);
				
				if($shipping["id"]==4){
					 $zipcode_text="40000 - 40099<br/>40150 - 40469";
				}else if($shipping["id"]==55){
					$zipcode_text="40100 - 40149<br/>40470 - 40999";
				}
				$shipping_list[$key]["zipcode_text"] = $zipcode_text;
			}
			$data["shipping_list"] = $shipping_list;
			return $this->load->view('information/shipping_block', $data);
		}
		public function menu() {
			$data['block'] = [3];
			$data['active'] = 'shipping';
			$data["faq"] = $this->url->link('information/faqs');
			$data["shipping"] = $this->url->link('information/shipping');
			return $this->load->view('information/faqs_menu', $data);
		}
	}
?>