<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pedidos extends CI_Controller {

	public function index()
	{
		$this->load->model("pedidos_model");
		$data["pedidos"] = $this->pedidos_model->index();
		$data["title"] = "Registros - Pedidos";

		$this->load->view('templates/header', $data);
		$this->load->view('templates/nav-top', $data);
		$this->load->view('pages/pedidos', $data);
		$this->load->view('templates/footer', $data);
		$this->load->view('templates/js', $data);

	}
}
