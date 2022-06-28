<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Clientes extends CI_Controller {

	public function index()
	{
		$this->load->model("clientes_model");
		$data["clientes"] = $this->clientes_model->index();
		$data["title"] = "Registros - Clientes";

		$this->load->view('templates/header', $data);
		$this->load->view('templates/nav-top', $data);
		$this->load->view('pages/clientes', $data);
		$this->load->view('templates/footer', $data);
		$this->load->view('templates/js', $data);
	}
}
