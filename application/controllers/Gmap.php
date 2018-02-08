<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Gmap extends CI_Controller {
	
	private $request = array();
	
	public function __construct() 
	{
		parent::__construct();	
		
		$this->request = json_decode(trim(file_get_contents('php://input'), 'r'), true);
		$this->load->model('Food_Model', 'food');
		$this->load->model('User_Model', 'user');
		$this->load->model('Order_Model', 'order');
		$this->load->model('Position_Model', 'position');
		$this->js = $this->language->load('js');
		$this->sms =$this->config->item('sms');
    }

	
}
