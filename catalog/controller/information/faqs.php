<?php 
	class ControllerInformationFaqs extends Controller {
		public function index() {
			$this->load->language('information/information');
			$config = $this->registry->get("config");
			$data['sconfig'] = $config;
			$data['themename'] = $config->get("theme_default_directory");
			$this->document->setTitle("FAQ");

		
			$data['heading_title'] = "FAQ";
			
			$data["data_faq"] = [array('faq_title' => 'How do I place an order?','faq_ans' => 'To place an order just login to your account (or create new one if it’s your first order with us), select the product, fill in the delivery date, necessary delivery details and message, checkout to make payment and you’re done!'),array('faq_title' => 'How do I know if my order has been confirmed?','faq_ans' => 'An email confirming your order will be sent to you at the email address provided to us. As this is an automatically generated email do check your spam folder if you do not see the email in your inbox'),array('faq_title' => 'If I would like to make corporate order or special bulk order?','faq_ans' => 'Just drop us an email at <a href="mailto:enquiry@famousamos.com.my">enquiry@famousamos.com.my</a> and we will get back to you soonest.'),array('faq_title' => 'When do you deliver?','faq_ans' => 'We deliver Mondays to Fridays (except public holidays)'),array('faq_title' => 'Where do you deliver to?','faq_ans' => 'We currently deliver to most of the KL & PJ areas.  You may check deliverability to your area of interest at Shipping section.'),array('faq_title' => 'How do I make payment?','faq_ans' => 'Payments may be made via credit card.')];

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