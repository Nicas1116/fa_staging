<?php
class ModelExtensionForumbuilder extends Model {
	
	public function createtable(){
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "forumbuilder` (`forumbuilder_id` int(11) NOT NULL AUTO_INCREMENT,`customer_id` int(1) NOT NULL DEFAULT '0',`forumdata` text NOT NULL,`module_id` int(11) NOT NULL DEFAULT '1',`forumname` varchar(255) NOT NULL,`ipaddress` varchar(255) NOT NULL,`date_added` datetime NOT NULL,PRIMARY KEY (`forumbuilder_id`)) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28");
	}
	
	public function addForumdata($data, $module_id) {
		$this->createtable();
		if ($this->customer->isLogged()) {
			$customer_id = $this->customer->getId();
		}else{
			$customer_id = 0;
		}
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "forumbuilder SET customer_id = '" . (int)$customer_id . "', `forumdata` = '" . $data . "',`module_id` = '" . (int)$module_id['forumsetting'] . "', `forumname` = '" . $module_id['forumname'] . "', `ipaddress` = '" . $module_id['ipaddress'] . "', date_added = NOW()");
	}
	
	public function getFormlink(){
		$this->load->model('extension/module');
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "module` WHERE `code` = '" . $this->db->escape('formbuilder') . "' ORDER BY `name`");
		$links=array();
		foreach($query->rows as $row){
			$module_info = $this->model_extension_module->getModule($row['module_id']);
			if($module_info['status']==1){
				$formdata = $module_info['formbuilder_desc'];
				$links[]=array(
				  'module_id' => $row['module_id'],
				  'name' 	  => $formdata[$this->config->get('config_language_id')]['heading'],
				  'top'	 	  => (isset($module_info['top']) ? $module_info['top'] : ''),
				  'bottom'	  => (isset($module_info['bottom']) ? $module_info['bottom'] : ''),
				  'href' 	  => $this->url->link('information/formbuilder','&form_id='.$row['module_id']),
				);
			}
		}
		return $links;
	}
}