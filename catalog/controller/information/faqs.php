<?php 
	class ControllerInformationFaqs extends Controller {
		public function index() {
			$this->load->language('information/information');
			$config = $this->registry->get("config");
			$data['sconfig'] = $config;
			$data['themename'] = $config->get("theme_default_directory");
			$this->document->setTitle("FAQ");

		
			$data['heading_title'] = "FAQ";
			
			$data["data_faq"] = [array('faq_title' => 'Lorem ipsum dolor sit amet?','faq_ans' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),array('faq_title' => 'Lorem ipsum dolor sit amet?','faq_ans' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),array('faq_title' => 'Lorem ipsum dolor sit amet?','faq_ans' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),array('faq_title' => 'Lorem ipsum dolor sit amet?','faq_ans' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),array('faq_title' => 'Lorem ipsum dolor sit amet?','faq_ans' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),array('faq_title' => 'Lorem ipsum dolor sit amet?','faq_ans' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ')];

			$data['column_left'] = $this->load->controller('information/faqs/menu');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
			$data['active'] = 'faqs';
			$data['block'] = [9];
			$this->response->setOutput($this->load->view('information/faqs', $data));
		}

		public function menu() {
			$data['block'] = [3];
			$data['active'] = 'faq';
			$data["faq"] = $this->url->link('information/faqs');
			$data["shipping"] = $this->url->link('information/shipping');
			return $this->load->view('information/faqs_menu', $data);
		}
	}
?>