<?php
class ModelCatalogForumbuilder extends Model {
	
	public function createtable(){
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "forumbuilder` (`forumbuilder_id` int(11) NOT NULL AUTO_INCREMENT,`customer_id` int(1) NOT NULL DEFAULT '0',`forumdata` text NOT NULL,`module_id` int(11) NOT NULL DEFAULT '1',`forumname` varchar(255) NOT NULL,`ipaddress` varchar(255) NOT NULL,`date_added` datetime NOT NULL,PRIMARY KEY (`forumbuilder_id`)) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28");
	}
	
	public function addseomanager($module_id,$keyword){
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'form_id=" . (int)$module_id . "'");
		$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'form_id=" . (int)$module_id . "', keyword = '" . $this->db->escape($keyword) . "'");
	}
	
	public function getkeyword($module_id){
		$query = $this->db->query("SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'form_id=" . (int)$module_id . "'");
		return (isset($query->row['keyword']) ? $query->row['keyword'] : '');
	}
	
	public function deletekeyword($module_id){
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'form_id=" . (int)$module_id . "'");
	}

	public function deleteEnquiry($forumbuilder_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "forumbuilder WHERE forumbuilder_id = '" . (int)$forumbuilder_id . "'");
	}

	public function getEnquiry($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "forumbuilder f WHERE f.forumbuilder_id > 0";
		
		if (!empty($data['filter_name'])) {
			$sql .= " AND f.forumname  LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}
		
		if (!empty($data['filter_customer'])) {
			$sql .= " AND f.customer_id IN (select customer_id FROM ".DB_PREFIX."customer WHERE CONCAT(firstname, ' ', lastname) LIKE '%" . $this->db->escape($data['filter_customer']) . "%')";
		}
		
		if (!empty($data['filter_from_date']) && !empty($data['filter_to_date'])) {
			$sql .= " AND DATE(f.date_added) BETWEEN DATE('" . $this->db->escape($data['filter_from_date']) . "') AND DATE('" . $this->db->escape($data['filter_to_date']) . "')";
		}
		
		if (!empty($data['filter_from_date']) && empty($data['filter_to_date'])) {
			$sql .= " AND DATE(f.date_added) = DATE('" . $this->db->escape($data['filter_from_date']) . "')";
		}
		
		if (empty($data['filter_from_date']) && !empty($data['filter_to_date'])) {
			$sql .= " AND DATE(f.date_added) = DATE('" . $this->db->escape($data['filter_to_date']) . "')";
		}
		
		if (!empty($data['filter_ip'])) {
			$sql .= " AND f.ipaddress  LIKE '" . $this->db->escape($data['filter_ip']) . "%'";
		}
		
		$sql .=" Order by f.date_added desc";
		
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


	public function getTotalEnquiry($data=array()) {
		$this->createtable();
		$sql = "SELECT * FROM " . DB_PREFIX . "forumbuilder f WHERE f.forumbuilder_id > 0";
		
		if (!empty($data['filter_name'])) {
			$sql .= " AND f.forumname  LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}
		
		if (!empty($data['filter_customer'])) {
			$sql .= " AND f.customer_id IN (select customer_id FROM ".DB_PREFIX."customer WHERE CONCAT(firstname, ' ', lastname) LIKE '%" . $this->db->escape($data['filter_customer']) . "%')";
		}
		
		if (!empty($data['filter_from_date']) && !empty($data['filter_to_date'])) {
			$sql .= " AND DATE(f.date_added) BETWEEN DATE('" . $this->db->escape($data['filter_from_date']) . "') AND DATE('" . $this->db->escape($data['filter_to_date']) . "')";
		}
		
		if (!empty($data['filter_from_date']) && empty($data['filter_to_date'])) {
			$sql .= " AND DATE(f.date_added) = DATE('" . $this->db->escape($data['filter_from_date']) . "')";
		}
		
		if (empty($data['filter_from_date']) && !empty($data['filter_to_date'])) {
			$sql .= " AND DATE(f.date_added) = DATE('" . $this->db->escape($data['filter_to_date']) . "')";
		}
		
		if (!empty($data['filter_ip'])) {
			$sql .= " AND f.ipaddress  LIKE '" . $this->db->escape($data['filter_ip']) . "%'";
		}
		
		$sql .=" Order by f.date_added desc";

		$query = $this->db->query($sql);

		return count($query->rows);
	}
}