<?php
class ModelMaybankCCPayment extends Model {
	public function addMaybankCC($order_id,$data){
		$query = "INSERT INTO `" . DB_PREFIX . "maybankcc` (`order_id`,`MERCHANT_ACC_NO`, `TRANSACTION_ID`, `TXN_STATUS`, `TXN_SIGNATURE`, `MERCHANT_TRANID`, `RESPONSE_CODE`, `RESPONSE_DESC`, `AUTH_ID`, `AUTH_DATE`, `CAPTURE_DATE`, `VOID_REV_DATE`, `date_created`) VALUES ('".$order_id."','".$data["MERCHANT_ACC_NO"]."','".$data["TRANSACTION_ID"]."','".$data["TXN_STATUS"]."','".$data["TXN_SIGNATURE"]."','".$data["MERCHANT_TRANID"]."','".$data["RESPONSE_CODE"]."','".$data["RESPONSE_DESC"]."','".$data["AUTH_ID"]."','".$data["AUTH_DATE"]."','".$data["CAPTURE_DATE"]."','".$data["VOID_REV_DATE"]."',NOW())";
		$this->db->query($query);
		$maybankcc_id = $this->db->getLastId();
		return $maybankcc_id;
	}

	public function updateCompleteStatus($order_id) {
		echo "UPDATE `".DB_PREFIX."order` SET `order_status_id` = '1' WHERE `order_id` = '" . (int)$order_id . "' AND `status` = '1'";
		$query = $this->db->query("UPDATE `".DB_PREFIX."order` SET `order_status_id` = '1' WHERE `order_id` = '" . (int)$order_id . "'");
		$query = $this->db->query("UPDATE `".DB_PREFIX."order_history` SET `order_status_id` = '1' WHERE `order_id` = '" . (int)$order_id . "'");
		
		if($query){

			return true;
		}else{
			return false;
		}
		
	}
}
?>