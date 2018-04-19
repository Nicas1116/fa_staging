<?php 
	class ControllerCheckoutMultipleShippingAddress extends Controller {
		public function index() {
			unset($this->session->data['shipping_products']);
			unset($this->session->data['shipping_address']);
			unset($this->session->data['shipping_method']);
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
				for($i=0;$i<$product["quantity"];$i++){
					$this->session->data['shipping_products'][$i] = $product;
				}
			}
			$this->load->model('catalog/product');
			$products = $this->session->data['shipping_products'];
			foreach ($products as $pi => $product) {
				
				$fullproduct_options = array();
				foreach ($this->model_catalog_product->getProductOptions($product["product_id"]) as $option) {
					if(is_array($option["product_option_value"])){
						foreach ($option["product_option_value"] as $value) {
							$value_id = $value["product_option_value_id"];
						}
					}
					$fullproduct_options[] = $option;
				}

				$product["fullproduct_options"] = $fullproduct_options;
				$products[$pi] = $product;
			}
			$data["a_products"] = $products;
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

			$data['delivery_zone'] = $this->load->controller('information/shipping/delivery_zone');
			
			$this->response->setOutput($this->load->view('checkout/multiple_shipping_address', $data));
		}

		public function getordersummary(){
			$totals[1]['title'] = "Subtotal";
			$totals[1]['text'] =  "RM 0.00";
			if(isset($this->session->data['shipping_products'])){
				if(is_array($this->session->data['shipping_products'])){
					$productcost =0;
					foreach ($this->session->data['shipping_products'] as $key => $value) {
						$productcost += $value["price"];
						foreach ($value["option"] as $key => $option) {
							if(isset($option["price"])){$productcost +=$option["price"];}
							
						}

					}
					$this->load->model('tool/image');
					$this->load->model('tool/upload');
					$this->load->model('catalog/product');
					$products = $this->session->data['shipping_products'];
					foreach ($products as $pi => $product) {
						$products[$pi]["link"] = $this->url->link("product/product");
						
						if ($product['image']) {
							$image = $this->model_tool_image->resize($product['image'], $this->config->get($this->config->get('config_theme') . '_image_cart_width'), $this->config->get($this->config->get('config_theme') . '_image_cart_height'));
						} else {
							$image = '';
						}
						$products[$pi]["quantity"] = 1;
						$products[$pi]["thumb"] = $image;
					}
					$totals[0]['title'] = "Subtotal";
					$totals[0]['text'] =  "RM ".number_format($productcost, 2, '.', ',');
					$this->load->model('catalog/product');
					$data["products"] = $products;
					
				}
			}
			$totals[1]['title'] = "Delivery<br/>(".sizeof($this->session->data['shipping_products'])." recipients)";
			$totals[1]['text'] =  "RM 0.00";
			$deliverycost =0;
			if(isset($this->session->data['shipping_method'])){
				if(is_array($this->session->data['shipping_method'])){
					
					foreach ($this->session->data['shipping_method'] as $key => $value) {
						if( $value){
							if(isset($value["price"])){
								$deliverycost += $value["price"];
							}
						}
					}
					$totals[1]['title'] = "Delivery<br/>(".sizeof($this->session->data['shipping_method'])." recipients)";
					$totals[1]['text'] =  "RM ".number_format($deliverycost, 2, '.', ',');
				}
			}
			$totals[2]['title'] = "Total";
			$totals[2]['text'] =  "RM ".number_format($productcost+$deliverycost, 2, '.', ',');
			$data["totals"]=$totals;
			 
			$this->response->setOutput($this->load->view('checkout/order_summary', $data));
		}

		public function updateproductoption() {
			if(isset($this->session->data['shipping_products'])){
				if(is_array($this->session->data['shipping_products'])){
					$tproductno = $this->request->post["productno"];
					$tkey = $this->request->post["key"];
					$tvalue = $this->request->post["value"];
					$totalcost =0;
					foreach ($this->session->data['shipping_products'] as $key => $value) {
						
						$totalcost += $value["price"];
					}
					$this->load->model('catalog/product');
					$product = $this->session->data['shipping_products'][$tproductno];
					$products_options = $this->model_catalog_product->getProductOptions($product["product_id"]);
					//echo json_encode($products_options);
					$seleced_products_option =null;
					$seleced_option = null;

					foreach ($products_options as $products_option) {
						if($products_option["name"]=="Send As Gift"){
							if($products_option["product_option_id"] == $tkey){
								foreach ($products_option["product_option_value"] as $products_option2) {
									if($products_option2["product_option_value_id"] == $tvalue){
										$seleced_products_option = $products_option;
										$seleced_products_option["value"] = $products_option2["name"];
										$seleced_products_option["product_option_value_id"] = $products_option2["product_option_value_id"];
										$seleced_products_option["option_value_id"] = $products_option2["option_value_id"];
										$seleced_products_option["quantity"] = $products_option2["quantity"];
										$seleced_products_option["subtract"] = $products_option2["subtract"];
										$seleced_products_option["price"] = $products_option2["price"];
										$seleced_products_option["price_prefix"] = $products_option2["price_prefix"];
										$seleced_products_option["weight"] = $products_option2["weight"];
										$seleced_products_option["weight_prefix"] = $products_option2["weight_prefix"];
										unset($seleced_products_option["product_option_value"]);
									}
								}
							}
						}else if($products_option["name"]=="Giftbox Message"){
							if($products_option["product_option_id"] == $tkey){
								if($tvalue!=""){
									$seleced_products_option = $products_option;
									$seleced_products_option["value"] = $tvalue;
									$seleced_products_option["product_option_value_id"] = 0;
								}
							}
						}
					}
					
					//echo json_encode($seleced_option);
					foreach ($product["option"] as $m => $doption) {
						if($doption["product_option_id"]==$tkey){
							array_splice($product["option"] ,$m,1);
						}
					}
					if($seleced_products_option){
						$product["option"][] = $seleced_products_option;
					}
					$this->session->data['shipping_products'][$tproductno] = $product;
					echo json_encode($this->session->data['shipping_products']);
				}
			}
		}

		public function save(){
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
			if (!$json) {
				foreach ($this->session->data['shipping_address'] as $address) {
					if (isset($address['shipping_address'.$address['recipent']]) && $address['shipping_address'.$address['recipent']] == 'existing') {
						
					}else{
						$this->load->model('account/address');
						$address_id = $this->model_account_address->addAddress($address);
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
		}

		public function checkshippingtotalcost(){
			if(isset($this->session->data['shipping_method'])){
				if(is_array($this->session->data['shipping_method'])){
					$totalcost =0;
					foreach ($this->session->data['shipping_method'] as $key => $value) {
						
						$totalcost += $value["price"];
					}
					foreach ($this->session->data['shipping_address'] as $key => $value) {
						echo json_encode($value);
					}
				}
				echo "<br/>totalcost:".$totalcost;
			}
		}

		public function getshippingethodcost(){
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

				if (isset($this->request->post['shipping_address'.$this->request->post['recipent']]) && $this->request->post['shipping_address'.$this->request->post['recipent']] == 'existing') {
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
							$address["recipent"] = $this->request->post["recipent"];
							$address["comment"] = $this->request->post["comment"];
							$address["shipping_address".$address["recipent"]] = $this->request->post["shipping_address".$address["recipent"]];
							
						}
					}else{
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
							/*// Default Shipping Address
							$this->load->model('account/address');

							$address_id = $this->model_account_address->addAddress($this->request->post);

							$this->session->data['shipping_address'] = $this->model_account_address->getAddress($address_id);

							//unset($this->session->data['shipping_method']);
							//unset($this->session->data['shipping_methods']);

							if ($this->config->get('config_customer_activity')) {
								$this->load->model('account/activity');

								$activity_data = array(
									'customer_id' => $this->customer->getId(),
									'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
								);

								$this->model_account_activity->addActivity('address_add', $activity_data);
							}*/
						}
						$address = $this->request->post;	
				}
			}
			$json["pricetext"] = false;
			//GET QUOTE
			if($address){
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
								$json["pricetext"] =$quote_quote["text"];
								$json["price"] =$quote_quote["resultcost"];
								$json["dcode"] = $quote_quote['code'];
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
	
			$this->session->data['shipping_address'][$this->request->post['recipent']] = $address;
			$this->session->data['shipping_method'][$this->request->post['recipent']]= $json;
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}

		public function confirm() {
			$redirect = '';
			$json = array();
			if(!isset($this->session->data['payment_address'])){
				$json['redirect'] = $this->url->link('checkout/cart');
			}
			if(!isset($this->session->data['shipping_products'])){
				$json['redirect'] = $this->url->link('checkout/cart');
			}
			if(!isset($this->session->data['shipping_address'])){
				$json['redirect'] = $this->url->link('checkout/cart');
			}
			if(!isset($this->session->data['shipping_method'])){
				$json['redirect'] = $this->url->link('checkout/cart');
			}
			if (!$json) {
				$order_data = array();
				$this->load->language('checkout/checkout');

				$order_data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
				$order_data['store_id'] = $this->config->get('config_store_id');
				$order_data['store_name'] = $this->config->get('config_name');

				if ($order_data['store_id']) {
					$order_data['store_url'] = $this->config->get('config_url');
				} else {
					if ($this->request->server['HTTPS']) {
						$order_data['store_url'] = HTTPS_SERVER;
					} else {
						$order_data['store_url'] = HTTP_SERVER;
					}
				}

				if ($this->customer->isLogged()) {
					$this->load->model('account/customer');

					$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());

					$order_data['customer_id'] = $this->customer->getId();
					$order_data['customer_group_id'] = $customer_info['customer_group_id'];
					$order_data['firstname'] = $customer_info['firstname'];
					$order_data['lastname'] = $customer_info['lastname'];
					$order_data['email'] = $customer_info['email'];
					$order_data['telephone'] = $customer_info['telephone'];
					$order_data['fax'] = $customer_info['fax'];
					$order_data['custom_field'] = json_decode($customer_info['custom_field'], true);
				} elseif (isset($this->session->data['guest'])) {
					$order_data['customer_id'] = 0;
					$order_data['customer_group_id'] = $this->session->data['guest']['customer_group_id'];
					$order_data['firstname'] = $this->session->data['guest']['firstname'];
					$order_data['lastname'] = $this->session->data['guest']['lastname'];
					$order_data['email'] = $this->session->data['guest']['email'];
					$order_data['telephone'] = $this->session->data['guest']['telephone'];
					$order_data['fax'] = $this->session->data['guest']['fax'];
					$order_data['custom_field'] = $this->session->data['guest']['custom_field'];
				}

				$order_data['payment_firstname'] = $this->session->data['payment_address']['firstname'];
				$order_data['payment_lastname'] = $this->session->data['payment_address']['lastname'];
				$order_data['payment_company'] = $this->session->data['payment_address']['company'];
				$order_data['payment_address_1'] = $this->session->data['payment_address']['address_1'];
				$order_data['payment_address_2'] = $this->session->data['payment_address']['address_2'];
				$order_data['payment_city'] = $this->session->data['payment_address']['city'];
				$order_data['payment_postcode'] = $this->session->data['payment_address']['postcode'];
				$order_data['payment_zone'] = $this->session->data['payment_address']['zone'];
				$order_data['payment_zone_id'] = $this->session->data['payment_address']['zone_id'];
				$order_data['payment_country'] = $this->session->data['payment_address']['country'];
				$order_data['payment_country_id'] = $this->session->data['payment_address']['country_id'];
				$order_data['payment_address_format'] = $this->session->data['payment_address']['address_format'];
				$order_data['payment_custom_field'] = (isset($this->session->data['payment_address']['custom_field']) ? $this->session->data['payment_address']['custom_field'] : array());

				if (isset($this->session->data['payment_method']['title'])) {
					$order_data['payment_method'] = $this->session->data['payment_method']['title'];
				} else {
					$order_data['payment_method'] = '';
				}

				if (isset($this->session->data['payment_method']['code'])) {
					$order_data['payment_code'] = $this->session->data['payment_method']['code'];
				} else {
					$order_data['payment_code'] = '';
				}
				//Shipping Address
				$order_data['shipping_address'] = array();

				foreach ($this->session->data['shipping_address'] as $shipping_address) {
					$order_data['shipping_address'][] =  $shipping_address;

				}
				//Shipping Method
				$totalshipping_cost=0;
				$order_data['shipping_method'] = array();

				foreach ($this->session->data['shipping_method'] as $shipping_method) {
					$totalshipping_cost+=$shipping_method["price"];
					$shipping_method["name"] = explode(".",$shipping_method["dcode"])[0];
					$order_data['shipping_method'][] =  $shipping_method;

				}
				//Product
				$order_data['products'] = array();
				$overalltotal = 0;
				foreach ($this->session->data['shipping_products'] as $product) {
					$product['tax'] = 0.00;
					$product["quantity"] = 1;
					$totalproductprice =$product["quantity"] * $product["price"];
					foreach ($product["option"] as $option) {
						echo json_encode($option);
						if(isset($option["price"])){
							$totalproductprice += floatval($option["price"]);
						}
					}
					$product["total"] = $totalproductprice;
					$overalltotal += $totalproductprice;
					$order_data['products'][] =  $product;

				}
				$order_data['totalall'] = $overalltotal +$totalshipping_cost;
				// Gift Voucher
				$order_data['vouchers'] = array();

				if (!empty($this->session->data['vouchers'])) {
					foreach ($this->session->data['vouchers'] as $voucher) {
						$order_data['vouchers'][] = array(
							'description'      => $voucher['description'],
							'code'             => token(10),
							'to_name'          => $voucher['to_name'],
							'to_email'         => $voucher['to_email'],
							'from_name'        => $voucher['from_name'],
							'from_email'       => $voucher['from_email'],
							'voucher_theme_id' => $voucher['voucher_theme_id'],
							'message'          => $voucher['message'],
							'amount'           => $voucher['amount']
						);
					}
				}

				if (isset($this->request->cookie['tracking'])) {
					$order_data['tracking'] = $this->request->cookie['tracking'];

					$subtotal = $this->cart->getSubTotal();

					// Affiliate
					$this->load->model('affiliate/affiliate');

					$affiliate_info = $this->model_affiliate_affiliate->getAffiliateByCode($this->request->cookie['tracking']);

					if ($affiliate_info) {
						$order_data['affiliate_id'] = $affiliate_info['affiliate_id'];
						$order_data['commission'] = ($subtotal / 100) * $affiliate_info['commission'];
					} else {
						$order_data['affiliate_id'] = 0;
						$order_data['commission'] = 0;
					}

					// Marketing
					$this->load->model('checkout/marketing');

					$marketing_info = $this->model_checkout_marketing->getMarketingByCode($this->request->cookie['tracking']);

					if ($marketing_info) {
						$order_data['marketing_id'] = $marketing_info['marketing_id'];
					} else {
						$order_data['marketing_id'] = 0;
					}
				} else {
					$order_data['affiliate_id'] = 0;
					$order_data['commission'] = 0;
					$order_data['marketing_id'] = 0;
					$order_data['tracking'] = '';
				}

				$order_data['language_id'] = $this->config->get('config_language_id');
				$order_data['currency_id'] = $this->currency->getId($this->session->data['currency']);
				$order_data['currency_code'] = $this->session->data['currency'];
				$order_data['currency_value'] = $this->currency->getValue($this->session->data['currency']);
				$order_data['ip'] = $this->request->server['REMOTE_ADDR'];


				if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
					$order_data['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR'];
				} elseif (!empty($this->request->server['HTTP_CLIENT_IP'])) {
					$order_data['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];
				} else {
					$order_data['forwarded_ip'] = '';
				}

				if (isset($this->request->server['HTTP_USER_AGENT'])) {
					$order_data['user_agent'] = $this->request->server['HTTP_USER_AGENT'];
				} else {
					$order_data['user_agent'] = '';
				}

				if (isset($this->request->server['HTTP_ACCEPT_LANGUAGE'])) {
					$order_data['accept_language'] = $this->request->server['HTTP_ACCEPT_LANGUAGE'];
				} else {
					$order_data['accept_language'] = '';
				}
				echo json_encode($order_data);

				$order_data["multiple_delivery"]=true;
				$order_data['totals'] = array();
				$order_data['totals'][]  = array("code" => "sub_total" , "title" => "Sub-Total", "value" => $overalltotal, "sort_order" => 1);
				$order_data['totals'][]  = array("code" => "shipping" , "title" => "Shipping", "value" => $totalshipping_cost, "sort_order" => 3);
				$order_data['totals'][]  = array("code" => "total" , "title" => "Total", "value" => $order_data['totalall'], "sort_order" => 9);

				$this->load->model('checkout/order');
				$this->session->data['order_id'] = $this->model_checkout_order->addMultipleDeliveryOrder($order_data);
				
			} else {
				$data['redirect'] = $redirect;
			}
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
	}
?>