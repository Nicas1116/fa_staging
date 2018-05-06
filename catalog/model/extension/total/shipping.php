<?php
class ModelExtensionTotalShipping extends Model {
	public function getTotal($total) {
		if ($this->cart->hasShipping() && isset($this->session->data['shipping_method']) && is_array($this->session->data['shipping_method'])) {
			if(isset($this->session->data['shipping_method']['title'])){
				$mda = $this->session->data['shipping_method']['title'];
			}else{
				$mda = "";
			}	
			if(isset($this->session->data['shipping_method']['cost'])){
				$mdb = $this->session->data['shipping_method']['cost'];
			}else{
				$mdb = 0;
			}
			$total['totals'][] = array(
				'code'       => 'shipping',
				'title'      => $mda ,
				'value'      => $mdb,
				'sort_order' => $this->config->get('shipping_sort_order')
			);
			if (isset($this->session->data['shipping_method']['tax_class_id'])) {
			if ($this->session->data['shipping_method']['tax_class_id']) {
				$tax_rates = $this->tax->getRates($this->session->data['shipping_method']['cost'], $this->session->data['shipping_method']['tax_class_id']);

				foreach ($tax_rates as $tax_rate) {
					if (!isset($total['taxes'][$tax_rate['tax_rate_id']])) {
						$total['taxes'][$tax_rate['tax_rate_id']] = $tax_rate['amount'];
					} else {
						$total['taxes'][$tax_rate['tax_rate_id']] += $tax_rate['amount'];
					}
				}
			}
			}
			if (isset($this->session->data['shipping_method']['cost'])) {
			$total['total'] += $this->session->data['shipping_method']['cost'];
			}
		}
	}
}