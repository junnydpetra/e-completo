<?php

class Clientes_model extends CI_Model
{
    public function index()
    {
        return $this->db->get("clientes")->result_array();
    }
}