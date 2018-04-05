<?php 
	class ControllerCheckoutMultipleShippingAddress extends Controller {
		public function index() {
			$this->load->language('checkout/checkout');
			if (isset($this->session->data['shipping_address']['address_id'])) {
				$data['address_id'] = $this->session->data['shipping_address']['address_id'];
			} else {
				$data['address_id'] = $this->customer->getAddressId();
			}
			$products = $this->cart->getProducts();
			if(sizeof($products)>1){
				$json['redirect'] = $this->url->link('checkout/cart');
			}
			foreach ($products as $product) {
				$data["recipentno"] = $product["quantity"];
			}

			$data['text_address_existing'] = $this->language->get('text_address_existing');
			$data['text_address_new'] = $this->language->get('text_address_new');
			$data['text_select'] = $this->language->get('text_select');
			$data['text_none'] = $this->language->get('text_none');
			$data['text_loading'] = $this->language->get('text_loading');

			$data['entry_firstname'] = $this->language->get('entry_firstname');
			$data['entry_lastname'] = $this->language->get('entry_lastname');
			$data['entry_company'] = $this->language->get('entry_company');
			$data['entry_address_1'] = $this->language->get('entry_address_1');
			$data['entry_address_2'] = $this->language->get('entry_address_2');
			$data['entry_postcode'] = $this->language->get('entry_postcode');
			$data['entry_city'] = $this->language->get('entry_city');
			$data['entry_country'] = $this->language->get('entry_country');
			$data['entry_zone'] = $this->language->get('entry_zone');

			$data['button_continue'] = $this->language->get('button_continue');
			$data['button_upload'] = $this->language->get('button_upload');


			$this->load->model('account/address');
			$data['addresses'] = $this->model_account_address->getAddresses();
			if (isset($this->session->data['shipping_address']['postcode'])) {
			$data['postcode'] = $this->session->data['shipping_address']['postcode'];
			} else {
				$data['postcode'] = '';
			}

			if (isset($this->session->data['shipping_address']['country_id'])) {
				$data['country_id'] = $this->session->data['shipping_address']['country_id'];
			} else {
				$data['country_id'] = $this->config->get('config_country_id');
			}

			if (isset($this->session->data['shipping_address']['zone_id'])) {
				$data['zone_id'] = $this->session->data['shipping_address']['zone_id'];
			} else {
				$data['zone_id'] = '';
			}

			$this->load->model('localisation/country');
			$data['countries'] = $this->model_localisation_country->getCountries();
			$this->load->model('account/custom_field');
			$data['custom_fields'] = $this->model_account_custom_field->getCustomFields($this->config->get('config_customer_group_id'));
			if (isset($this->session->data['shipping_address']['custom_field'])) {
				$data['shipping_address_custom_field'] = $this->session->data['shipping_address']['custom_field'];
			} else {
				$data['shipping_address_custom_field'] = array();
			}

			if ($this->config->get('config_checkout_id')) {
			$this->load->model('catalog/information');
			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_checkout_id'));
			if ($information_info) {
				$data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/agree', 'information_id=' . $this->config->get('config_checkout_id'), true), $information_info['title'], $information_info['title']);
				} else {
					$data['text_agree'] = '';
				}
			} else {
				$data['text_agree'] = '';
			}

			if (isset($this->session->data['agree'])) {
				$data['agree'] = $this->session->data['agree'];
			} else {
				$data['agree'] = '';
			}

			$data['text_shipping_method'] = $this->language->get('text_shipping_method');
			$data['text_comments'] = $this->language->get('text_comments');
			$data['text_loading'] = $this->language->get('text_loading');

			$data['button_continue'] = $this->language->get('button_continue');

			if (empty($this->session->data['shipping_methods'])) {
				$data['error_warning'] = sprintf($this->language->get('error_no_shipping'), $this->url->link('information/contact'));
			} else {
				$data['error_warning'] = '';
			}

			if (isset($this->session->data['shipping_methods'])) {
				$data['shipping_methods'] = $this->session->data['shipping_methods'];
			} else {
				$data['shipping_methods'] = array();
			}

			if (isset($this->session->data['shipping_method']['code'])) {
				$data['code'] = $this->session->data['shipping_method']['code'];
			} else {
				$data['code'] = '';
			}

			if (isset($this->session->data['comment'])) {
				$data['comment'] = $this->session->data['comment'];
			} else {
				$data['comment'] = '';
			}

			$this->response->setOutput($this->load->view('checkout/multiple_shipping_address', $data));
		}

		public function save() {
			$this->load->language('checkout/checkout');

			$json = array();
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}

		public function getshippingethodcost(){
			$json = array();
			// Validate if customer is logged in.
			if (!$this->customer->isLogged()) {
				$json['redirect'] = $this->url->link('checkout/checkout', '', true);
			}
			// Validate if shipping is required. If not the customer should not have reached this page.
			if (!$this->cart->hasShipping()) {
				$json['redirect'] = $this->url->link('checkout/checkout', '', true);
			}
			// Validate cart has products and has stock.
			if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
				$json['redirect'] = $this->url->link('checkout/cart');
			}
			// Validate minimum quantity requirements.
			$products = $this->cart->getProducts();
			foreach ($products as $product) {
				$product_total = 0;

				foreach ($products as $product_2) {
					if ($product_2['product_id'] == $product['product_id']) {
						$product_total += $product_2['quantity'];
					}
				}

				if ($product['minimum'] > $product_total) {
					$json['redirect'] = $this->url->link('checkout/cart');

					break;
				}
			}
			if (!$json) {
			if (isset($this->request->post['shipping_address']) && $this->request->post['shipping_address'] == 'existing') {
				$this->load->model('account/address');

				if (empty($this->request->post['address_id'])) {
					$json['error']['warning'] = $this->language->get('error_address');
				} elseif (!in_array($this->request->post['address_id'], array_keys($this->model_account_address->getAddresses()))) {
					$json['error']['warning'] = $this->language->get('error_address');
				}

				if (!$json) {
					// Default Shipping Address
					$this->load->model('account/address');
					$address = $this->model_account_address->getAddress($this->request->post['address_id']);
				}
			}else{
				$address = $this->request->post;	
			}
			$data["pricetext"] = false;
			//GET QUOTE
			if($$address){
				$method_data = array();
				$this->load->model('extension/extension');
				$results = $this->model_extension_extension->getExtensions('shipping');
				foreach ($results as $result) {
					if ($this->config->get($result['code'] . '_status')) {
						$this->load->model('extension/shipping/' . $result['code']);

						$quote = $this->{'model_extension_shipping_' . $result['code']}->getQuote($address);

						if ($quote) {
							$method_data[$result['code']] = array(
								'title'      => $quote['title'],
								'quote'      => $quote['quote'],
								'sort_order' => $quote['sort_order'],
								'error'      => $quote['error']
							);
							foreach ($quote['quote'] as $quote_quote) {
								$data["pricetext"] =$quote_quote["text"];
								$data["dcode"] = $quote_quote['code'];
							}
							
						}
					}
				}

				$sort_order = array();

				foreach ($method_data as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}

				array_multisort($sort_order, SORT_ASC, $method_data);
			}

			$json = array();
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}

		public function saveShippingMethod() {
			$this->load->language('checkout/checkout');

			$json = array();

			// Validate if shipping is required. If not the customer should not have reached this page.
			if (!$this->cart->hasShipping()) {
				$json['redirect'] = $this->url->link('checkout/checkout', '', true);
			}

			// Validate if shipping address has been set.
			if (!isset($this->session->data['shipping_address'])) {
				$json['redirect'] = $this->url->link('checkout/checkout', '', true);
			}

			// Validate cart has products and has stock.
			if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
				$json['redirect'] = $this->url->link('checkout/cart');
			}

			// Validate minimum quantity requirements.
			$products = $this->cart->getProducts();

			foreach ($products as $product) {
				$product_total = 0;

				foreach ($products as $product_2) {
					if ($product_2['product_id'] == $product['product_id']) {
						$product_total += $product_2['quantity'];
					}
				}

				if ($product['minimum'] > $product_total) {
					$json['redirect'] = $this->url->link('checkout/cart');

					break;
				}
			}

			if (!isset($this->request->post['shipping_method'])) {
				$json['error']['warning'] = $this->language->get('error_shipping');
			} else {
				$shipping = explode('.', $this->request->post['shipping_method']);
				if (!isset($shipping[0]) || !isset($shipping[1]) || !isset($this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]])) {
					$json['error']['warning'] = $this->language->get('error_shipping');
				}
			}

			if (!$json) {
				$this->session->data['shipping_method'] = $this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]];

				$this->session->data['comment'] = strip_tags($this->request->post['comment']);
			}

			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
	}
?>