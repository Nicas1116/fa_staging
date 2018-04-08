<?php
class ControllerInformationAboutUs extends Controller {
	public function index() {
		$this->load->language('extension/module/themecontrol');
		$data['objlang'] = $this->registry->get('language');
		$data['ourl'] = $this->registry->get('url');

		$config = $this->registry->get("config");
		$data['sconfig'] = $config;
		$data['themename'] = $config->get("theme_default_directory");
		$this->document->setTitle("About Us");
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => "About Us",
			'href' => $this->url->link('aboutus/aboutus')
		);
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		$this->response->setOutput($this->load->view('information/aboutus', $data));
	}

	public function detail() {
		$this->load->language('extension/module/themecontrol');
		$data['objlang'] = $this->registry->get('language');
		$data['ourl'] = $this->registry->get('url');

		$config = $this->registry->get("config");
		$data['sconfig'] = $config;
		$data['themename'] = $config->get("theme_default_directory");
		$this->document->setTitle("About Us");
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => "About Us",
			'href' => $this->url->link('aboutus/aboutus')
		);
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		$this->response->setOutput($this->load->view('information/aboutus', $data));
	}
}
?>