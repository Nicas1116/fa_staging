<?php
class ModelExtensionmulflatshpzip extends Model {
	public function addmulflatshpzip($data) {
		$customer_group = (isset($data['customer_group']) && $data['customer_group']) ? implode(",",$data['customer_group']) : '';
		$store = (isset($data['store']) && $data['store'] != '') ? implode(",",$data['store']) : ''; 
		//print_r($store);exit;
 
		$this->db->query("INSERT INTO " . DB_PREFIX . "mulflatshpzip SET name = '" . $this->db->escape($data['name']) . "', zipcode = '" . $this->db->escape($data['zipcode']) . "', customer_group = '" . $this->db->escape($customer_group) . "', store = '" . $this->db->escape($store) . "', status = '" . (int)$data['status'] . "', date_start = '" . $this->db->escape($data['date_start']) . "', date_end = '" . $this->db->escape($data['date_end']) . "' ");

		$mulflatshpzip_id = $this->db->getLastId();
		
		foreach ($data['mulflatshpzip_cost_info'] as $mulflatshpzip_cost_info) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "mulflatshpzip_cost SET mulflatshpzip_id = '" . (int)$mulflatshpzip_id . "', `order_total_text` = '" . $this->db->escape(json_encode($mulflatshpzip_cost_info['order_total_text'], true)) . "', totfrom = '" . (float)$mulflatshpzip_cost_info['totfrom'] . "', totto = '" . (float)$mulflatshpzip_cost_info['totto'] . "', cost = '" . (float)$mulflatshpzip_cost_info['cost'] . "', costtype = '" . (int)$mulflatshpzip_cost_info['costtype'] . "' ");
		}
  
 		$this->cache->delete('mulflatshpzip');

		return $mulflatshpzip_id;
	}

	public function editmulflatshpzip($mulflatshpzip_id, $data) {

 		$customer_group = (isset($data['customer_group']) && $data['customer_group']) ? implode(",",$data['customer_group']) : '';
		$store = (isset($data['store']) && $data['store'] != '') ? implode(",",$data['store']) : ''; 
		
		$this->db->query("UPDATE " . DB_PREFIX . "mulflatshpzip SET name = '" . $this->db->escape($data['name']) . "', zipcode = '" . $this->db->escape($data['zipcode']) . "', customer_group = '" . $this->db->escape($customer_group) . "', store = '" . $this->db->escape($store) . "', status = '" . (int)$data['status'] . "', date_start = '" . $this->db->escape($data['date_start']) . "', date_end = '" . $this->db->escape($data['date_end']) . "' WHERE mulflatshpzip_id = '" . (int)$mulflatshpzip_id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "mulflatshpzip_cost WHERE mulflatshpzip_id = '" . (int)$mulflatshpzip_id . "'");

		foreach ($data['mulflatshpzip_cost_info'] as $mulflatshpzip_cost_info) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "mulflatshpzip_cost SET mulflatshpzip_id = '" . (int)$mulflatshpzip_id . "', `order_total_text` = '" . $this->db->escape(json_encode($mulflatshpzip_cost_info['order_total_text'], true)) . "', totfrom = '" . (float)$mulflatshpzip_cost_info['totfrom'] . "', totto = '" . (float)$mulflatshpzip_cost_info['totto'] . "', cost = '" . (float)$mulflatshpzip_cost_info['cost'] . "', costtype = '" . (int)$mulflatshpzip_cost_info['costtype'] . "' ");
		}
		 
 		$this->cache->delete('mulflatshpzip');
	}

	public function deletemulflatshpzip($mulflatshpzip_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "mulflatshpzip WHERE mulflatshpzip_id = '" . (int)$mulflatshpzip_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "mulflatshpzip_cost WHERE mulflatshpzip_id = '" . (int)$mulflatshpzip_id . "'");
 
		$this->cache->delete('mulflatshpzip');
	}

	public function getmulflatshpzip($mulflatshpzip_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "mulflatshpzip WHERE mulflatshpzip_id = '" . (int)$mulflatshpzip_id . "' ");

		return $query->row;
	}

	public function getmulflatshpzips($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "mulflatshpzip WHERE 1 ";

		if (!empty($data['filter_name'])) {
			$sql .= " AND name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		$sql .= " GROUP BY mulflatshpzip_id";

		$sort_data = array(
			'name',
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}
 
	public function getTotalmulflatshpzips() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "mulflatshpzip");

		return $query->row['total'];
	}
	
	public function getmulflatshpzipdiscount($mulflatshpzip_id) {
		$mulflatshpzip_cost_info = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "mulflatshpzip_cost WHERE mulflatshpzip_id = '" . (int)$mulflatshpzip_id . "' order by mulflatshpzip_cost_id");

		foreach ($query->rows as $result) {
			$mulflatshpzip_cost_info[] = array(
				'order_total_text' 	=> json_decode($result['order_total_text'], true),
				'totfrom' => $result['totfrom'],
				'totto' => $result['totto'],
				'cost' => $result['cost'],
				'costtype' => $result['costtype']
			);
		}

		return $mulflatshpzip_cost_info;
	}
}
