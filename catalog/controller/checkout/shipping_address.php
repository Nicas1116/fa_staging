<?php
class ControllerCheckoutShippingAddress extends Controller {
	public function index() {
		$this->load->language('checkout/checkout');

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

		if (isset($this->session->data['shipping_address']['address_id'])) {
			$data['address_id'] = $this->session->data['shipping_address']['address_id'];
		} else {
			$data['address_id'] = $this->customer->getAddressId();
		}

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

		// Custom Fields
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

		$data['delivery_zone'] = $this->load->controller('information/shipping/delivery_zone');
		
		if (isset($this->session->data['payment_address'])) {
			// Totals
			$totals = array();
			$taxes = $this->cart->getTaxes();
			$total = 0;

			// Because __call can not keep var references so we put them into an array.
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);
			
			$this->load->model('extension/extension');

			$sort_order = array();

			$results = $this->model_extension_extension->getExtensions('total');

			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}

			array_multisort($sort_order, SORT_ASC, $results);

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('extension/total/' . $result['code']);
					
					// We have to put the totals in an array so that they pass by reference.
					$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
				}
			}

			// Payment Methods
			$method_data = array();

			$this->load->model('extension/extension');

			$results = $this->model_extension_extension->getExtensions('payment');

			$recurring = $this->cart->hasRecurringProducts();

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('extension/payment/' . $result['code']);

					$method = $this->{'model_extension_payment_' . $result['code']}->getMethod($this->session->data['payment_address'], $total);

					if ($method) {
						if ($recurring) {
							if (property_exists($this->{'model_extension_payment_' . $result['code']}, 'recurringPayments') && $this->{'model_extension_payment_' . $result['code']}->recurringPayments()) {
								$method_data[$result['code']] = $method;
							}
						} else {
							$method_data[$result['code']] = $method;
						}
					}
				}
			}

			$sort_order = array();

			foreach ($method_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $method_data);

			$this->session->data['payment_methods'] = $method_data;
		}

		$this->response->setOutput($this->load->view('checkout/shipping_address', $data));
	}

	public function save() {
		$this->load->language('checkout/checkout');

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

					$this->session->data['shipping_address'] = $this->model_account_address->getAddress($this->request->post['address_id']);

					//unset($this->session->data['shipping_method']);
					//unset($this->session->data['shipping_methods']);
				}
			} else {
				if ((utf8_strlen(trim($this->request->post['firstname'])) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 32)) {
					$json['error']['firstname'] = $this->language->get('error_firstname');
				}

				if ((utf8_strlen(trim($this->request->post['lastname'])) < 1) || (utf8_strlen(trim($this->request->post['lastname'])) > 32)) {
					$json['error']['lastname'] = $this->language->get('error_lastname');
				}

				if ((utf8_strlen(trim($this->request->post['address_1'])) < 3) || (utf8_strlen(trim($this->request->post['address_1'])) > 128)) {
					$json['error']['address_1'] = $this->language->get('error_address_1');
				}

				if ((utf8_strlen(trim($this->request->post['city'])) < 2) || (utf8_strlen(trim($this->request->post['city'])) > 128)) {
					$json['error']['city'] = $this->language->get('error_city');
				}

				$this->load->model('localisation/country');

				$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

				if ($country_info && $country_info['postcode_required'] && (utf8_strlen(trim($this->request->post['postcode'])) < 2 || utf8_strlen(trim($this->request->post['postcode'])) > 10)) {
					$json['error']['postcode'] = $this->language->get('error_postcode');
				}

				if ($this->request->post['country_id'] == '') {
					$json['error']['country'] = $this->language->get('error_country');
				}

				if (!isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '' || !is_numeric($this->request->post['zone_id'])) {
					$json['error']['zone'] = $this->language->get('error_zone');
				}

				// Custom field validation
				$this->load->model('account/custom_field');

				$custom_fields = $this->model_account_custom_field->getCustomFields($this->config->get('config_customer_group_id'));

				foreach ($custom_fields as $custom_field) {
					if (($custom_field['location'] == 'address') && $custom_field['required'] && empty($this->request->post['custom_field'][$custom_field['custom_field_id']])) {
						$json['error']['custom_field' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
					} elseif (($custom_field['location'] == 'address') && ($custom_field['type'] == 'text') && !empty($custom_field['validation']) && !filter_var($this->request->post['custom_field'][$custom_field['custom_field_id']], FILTER_VALIDATE_REGEXP, array('options' => array('regexp' => $custom_field['validation'])))) {
                        $json['error']['custom_field' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
                    }
				}

				if (!$json) {
					// Default Shipping Address
					$this->load->model('account/address');

					$address_id = $this->model_account_address->addAddress($this->request->post);

					$this->session->data['shipping_address'] = $this->model_account_address->getAddress($address_id);


					if ($this->config->get('config_customer_activity')) {
						$this->load->model('account/activity');

						$activity_data = array(
							'customer_id' => $this->customer->getId(),
							'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
						);

						$this->model_account_activity->addActivity('address_add', $activity_data);
					}
				}
			}
		}
		
		if (!$json) {
			$shipping = explode('.', $this->session->data['shipping_method']["code"]);
			//$this->session->data['shipping_method'] = $this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]];
			$this->session->data['comment'] = strip_tags($this->request->post['comment']);
		}
		if (!$json) {
			$paymentmethod = $this->session->data['payment_methods'];
			foreach ($paymentmethod as $key => $value) {
				$code =  $key;
			}
			$this->session->data['payment_method'] = $this->session->data['payment_methods'][$code];
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function getordersummary(){
			$totals[1]['title'] = "Subtotal";
			$totals[1]['text'] =  "RM 0.00";
			$data['vouchers'] = array();
			if (!empty($this->session->data['vouchers'])) {
				foreach ($this->session->data['vouchers'] as $key => $voucher) {
					$data['vouchers'][] = array(
						'key'         => $key,
						'description' => $voucher['description'],
						'amount'      => $this->currency->format($voucher['amount'], $this->session->data['currency'])
					);
				}
			}
			$mda=0;
			$products = $this->cart->getProducts();
			if(isset($products)){
				if(is_array($products)){
					$productcost =0;
					$this->load->model('catalog/product');
					foreach ($products as $key => $value) {
						$productcost += $value["total"];
					}
					$this->load->model('tool/image');
					$this->load->model('tool/upload');
					$this->load->model('catalog/product');
					foreach ($products as $pi => $product) {
						$products[$pi]["link"] = $this->url->link("product/product");
						
						if ($product['image']) {
							$image = $this->model_tool_image->resize($product['image'], 200,200);
						} else {
							$image = '';
						}
						$products[$pi]["thumb"] = $image;
						$product = $this->model_catalog_product->getProduct($value["product_id"]);
						$products[$pi]["price"] = $product["price"];
					}
					$totals[$mda]['title'] = "Subtotal";
					$totals[$mda]['text'] =  "RM ".number_format($productcost, 2, '.', ',');
					
					$this->load->model('catalog/product');
					$data["products"] = $products;
					
				}
			}
			$this->load->model('extension/total/coupon');
			$totalcoupondiscount =0;
			if (!empty($this->session->data['coupon'])) {
				$coupon_info = $this->model_extension_total_coupon->getCoupon($this->session->data['coupon']);
				if(isset($coupon_info)){
					
					if($coupon_info["type"] =="P"){
						$totalcoupondiscount = -$productcost * $coupon_info["discount"] / 100;
					}
					$totals[$mda]['title'] = "Coupons(".$coupon_info["code"].")";
					$totals[$mda]['text'] =  "RM ".number_format($totalcoupondiscount, 2, '.', ',');
					$mda++;
				}
			}
			
			$totals[$mda]['title'] = "Delivery";
			$totals[$mda]['text'] =  "RM 0.00";
			$deliverycost =0;
			if(isset($this->session->data['shipping_method'])){
				if(is_array($this->session->data['shipping_method'])){
					$deliverycost += $this->session->data['shipping_method']["cost"];
					$totals[$mda]['title'] = "Delivery";
					$totals[$mda]['text'] =  "RM ".number_format($deliverycost, 2, '.', ',');
				}else{
					
				}
			}
			$mda++;
			$totals[$mda]['title'] = "Total";
			$totals[$mda]['text'] =  "RM ".number_format($productcost+$totalcoupondiscount+$deliverycost, 2, '.', ',');
			
			sort($totals);
			$data["totals"]=$totals;
			 
			$this->response->setOutput($this->load->view('checkout/order_summary', $data));
		}

		public function getordersummarybyorderid(){
			$totals[1]['title'] = "Subtotal";
			$totals[1]['text'] =  "RM 0.00";
			if (isset($this->request->post['order_id'])) {
				$order_id = $this->request->post['order_id'];
			} else {
				$order_id = 0;
			}
			if (!$this->customer->isLogged()) {
				$this->session->data['redirect'] = $this->url->link('account/order/info', 'order_id=' . $order_id, true);

				$this->response->redirect($this->url->link('account/login', '', true));
			}

			$this->load->model('account/order');

			$order_info = $this->model_account_order->getOrder($order_id);
			$data['products'] = array();

			$products = $this->model_account_order->getOrderProducts($order_id);
			if(isset($products)){
				if(is_array($products)){
					$productcost =0;
					$this->load->model('catalog/product');
					$this->load->model('tool/image');
					$this->load->model('tool/upload');
					$this->load->model('catalog/product');
					foreach ($products as $pi => $product) {
						$products[$pi]["link"] = $this->url->link("product/product");
						$productdetail = $this->model_catalog_product->getProduct($product["product_id"]);
						$option_data = array();

						$options = $this->model_account_order->getOrderOptions($order_id, $product['order_product_id']);

						foreach ($options as $option) {
							if ($option['type'] != 'file') {
								$value = $option['value'];
							} else {
								$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

								if ($upload_info) {
									$value = $upload_info['name'];
								} else {
									$value = '';
								}
							}

							$option_data[] = array(
								'name'  => $option['name'],
								'value' => $value,
								'price'  => $option['price']
							);
						}
						
						if ($productdetail['image']) {
							$image = $this->model_tool_image->resize($productdetail['image'], 400,400);
						} else {
							$image = '';
						}
						$products[$pi]["option"] =$option_data;
						$products[$pi]["thumb"] = $image;
						
						$products[$pi]["price"] = $productdetail["price"];
						$productcost += $product["price"];
					}
	
					$data["products"] = $products;
					
				}
			}
	
			 $data['totals'] = array();

			$totals = $this->model_account_order->getOrderTotals($order_id);

			foreach ($totals as $total) {
				$data['totals'][] = array(
					'title' => $total['title'],
					'text'  => $this->currency->format($total['value'], $order_info['currency_code'], $order_info['currency_value']),
				);
			}

			$this->response->setOutput($this->load->view('checkout/order_summary', $data));
		}
}