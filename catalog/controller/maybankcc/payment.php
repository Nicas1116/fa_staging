<?php 

class ControllerMaybankCCPayment extends Controller {
	public function index() {
		$this->load->language('extension/module/themecontrol');
		$data['objlang'] = $this->registry->get('language');
		$data['ourl'] = $this->registry->get('url');

		$config = $this->registry->get("config");
		$data['sconfig'] = $config;
		$data['themename'] = $config->get("theme_default_directory");

		if (isset($this->request->get['order_id'])) {
			$order_id = $this->request->get['order_id'];
		} else {
			$order_id = 0;
		}
		$data['order_id'] = $order_id;
		$this->load->model('account/order');
		$order_info = $this->model_account_order->getOrder($order_id);
		//var_dump($order_info);exit();
		if($order_info){
			if($order_info["order_status_id"]==17){
				date_default_timezone_set ("Asia/Kuala_Lumpur");
				$date = date("Y-m-d H:i:s");
				$mer_id = "INV".date("Ymd").date("Hi").$order_info["order_id"];//.generateRandomString(5);
				$invoiceid = $order_info["invoice_no"];
				$totalamount = number_format($order_info["total"], 2, '.', ',');

				//$tphash = "J9jqR8Fh"."02700701128175000698".$mer_id.number_format($totalamount,2);
				
				//$data["paymentlink"] = "https://ebpgcards.maybank.com/BPG/admin/payment/PaymentWindowSimulator.jsp";
				$data["paymentlink"] = "https://cards.maybank.com/BPG/admin/payment/PaymentWindow.jsp";
				$tphash = "Ia4Vfs3M"."02700701128175000698".$mer_id.number_format($totalamount,2);
				$invoiceData["invoices_code"] = $mer_id;
				$invoiceData["invoices_hash"] = hash("sha512",$tphash,false);
				$data["invoiceid"] = $invoiceid;
				$data["invoicecode"] = $invoiceData["invoices_code"];
				$data["signature"] = $invoiceData["invoices_hash"];
				$data["totalamount"] = $totalamount;
				$data["return_link"] = $this->url->link('maybankcc/payment/confirmpayment');
				$data["checkpayment_link"] = $this->url->link('maybankcc/payment/checkpayment');
				$data['column_left'] = $this->load->controller('common/column_left');
				$data['column_right'] = $this->load->controller('common/column_right');
				$data['content_top'] = $this->load->controller('common/content_top');
				$data['content_bottom'] = $this->load->controller('common/content_bottom');
				$data['footer'] = $this->load->controller('common/footer');
				$data['header'] = $this->load->controller('common/header');
				$this->session->data['total_amount'] = $totalamount;
				$this->session->data['order_id'] = $order_id;
				$data["multiple_delivery"] = $order_info["multiple_delivery"];
				$this->response->setOutput($this->load->view('maybankcc/payment', $data));
			}else{
				$datad["order_id"] = $order_id; 
				$this->response->redirect($this->url->link('account/order/info', $datad, true));
			}
		}else{
			$this->response->redirect($this->url->link('common/home'));
		}
	}

	public function checkpayment(){
		if (isset($this->request->get['order_id'])) {
			$order_id = $this->request->get['order_id'];
		} else {
			$order_id = 0;
		}
		$this->load->model('account/order');
		$order_info = $this->model_account_order->getOrder($order_id);
		if($order_info){
			if($order_info["order_status_id"]==17){
				$json["finishpayment"]= false;
			}else if($order_info["order_status_id"]==1){
				$json["finishpayment"]= true;
			}else{
				$json["finishpayment"]= false;
			}
		}
		$json["order_link"] = $this->url->link('account/order/info');
		$json["order_id"] = $order_id;
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function confirmpayment(){
		if (isset($this->session->data['order_id'])) {
			$order_id = $this->session->data['order_id'];
		} else {
			$order_id = 0;
		}
		if (isset($this->session->data['total_amount'])) {
			$totalamount = $this->session->data['total_amount'];
		} else {
			$order_id = 0;
		}
		//echo json_encode($_POST);
		$this->load->model('maybankcc/payment');
		if (!empty($_POST))
		{
			$totalamount = number_format($this->session->data['total_amount'], 2, '.', ',');
			$mer_id = $_POST["MERCHANT_TRANID"];
			$txn_sign2 = $_POST["TXN_SIGNATURE2"];
			$tra_id = $_POST["TRANSACTION_ID"];
			$tra_status = $_POST["TXN_STATUS"];
			$res_code = $_POST["RESPONSE_CODE"];
			
			//$tphash = strtoupper("J9jqR8Fh"."02700701128175000698".$mer_id.$totalamount.$tra_id.$tra_status.$res_code);
			$tphash = strtoupper("Ia4Vfs3M"."02700701128175000698".$mer_id.$totalamount.$tra_id.$tra_status.$res_code);
			$this->load->model('account/order');
			if(strtoupper(hash("sha512",$tphash,false)) == $txn_sign2){
				if($res_code==0){
					$this->model_maybankcc_payment->updateCompleteStatus($order_id);
				}
			}
			
		}
		$this->model_maybankcc_payment->addMaybankCC($order_id,$_POST);
		echo "<script>window.close();</script>";
	}
}

	
?>