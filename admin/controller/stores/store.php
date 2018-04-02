<?php
class ControllerStoresStore extends Controller {
	private $error = array();
	public function index() {
		$this->document->setTitle("Stores");
		$this->getList();
	}

	protected function getList() {
		$url = '';
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => "Home",
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => "Stores",
			'href' => $this->url->link('stores/store', 'token=' . $this->session->data['token'] . $url, true)
		);
		$data["heading_title"] = "Stores";
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$this->response->setOutput($this->load->view('stores/store', $data));
	}
}
?>