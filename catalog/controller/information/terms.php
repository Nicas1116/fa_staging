<?php 
	class ControllerInformationTerms extends Controller {
		public function index() {
			$this->load->language('information/information');
			$config = $this->registry->get("config");
			$data['sconfig'] = $config;
			$data['themename'] = $config->get("theme_default_directory");
			

		
			$data['heading_title'] = "Terms & Conditions";
			$this->document->setTitle($data['heading_title']);

			$data['column_left'] =$this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
			$data['block'] = [12];
			$this->response->setOutput($this->load->view('information/terms', $data));
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