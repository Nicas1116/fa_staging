<?php
class ModelStoresStore extends Model {
	public function addStore($data) {
		foreach ($data as $key => $value) {
			echo $key.":".$value."<br/>";
		}
		$this->db->query("INSERT INTO " . DB_PREFIX . "outlets SET outlet_name = '" . $this->db->escape($data['outlet_name']) . "', `outlet_address` = '" . $this->db->escape($data['outlet_address']) . "', `outlet_contact` = '" . $this->db->escape($data['outlet_contact']) . "', `outlet_ophour` = '" . $this->db->escape($data['outlet_ophour']) . "', `outlet_coordinate` = '" . $this->db->escape($data['outlet_coord']) . "', `outlet_status` = '" . $this->db->escape($data['store_status']) . "', `outlet_states` = '" . $this->db->escape($data['outlet_states']) . "'");

		$store_id = $this->db->getLastId();

		return $store_id;
	}

	public function editStore($id,$data) {
		$this->db->query("UPDATE " . DB_PREFIX . "outlets SET outlet_name = '" . $this->db->escape($data['outlet_name']) . "', `outlet_address` = '" . $this->db->escape($data['outlet_address']) . "', `outlet_contact` = '" . $this->db->escape($data['outlet_contact']) . "', `outlet_ophour` = '" . $this->db->escape($data['outlet_ophour']) . "', `outlet_coordinate` = '" . $this->db->escape($data['outlet_coord']) . "', `outlet_status` = '" . $this->db->escape($data['store_status']). "', `outlet_states` = '" . $this->db->escape($data['outlet_states']). "' WHERE outlet_id = '".$id."'") ;

		return true;
	}

	public function getStore($id) {
		$sql = "SELECT * FROM " . DB_PREFIX . "outlets p WHERE p.outlet_id = '".$id."' ORDER BY outlet_states, outlet_name";
		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getTotalProducts($data = array()) {
		$sql = "SELECT COUNT(DISTINCT p.outlet_id) AS total FROM " . DB_PREFIX . "outlets p";
		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getProducts($data = array()){
		$sql = "SELECT * FROM " . DB_PREFIX . "outlets p  ORDER BY outlet_states, outlet_name";

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
}