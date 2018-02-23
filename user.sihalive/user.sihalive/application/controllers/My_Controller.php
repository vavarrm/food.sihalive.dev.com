
<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class My_Controller extends CI_Controller {
	public function __construct()
	{
		 parent::__construct();
		 $this->load->library('session');
		 if(!$this->session->has_userdata('logged_in') || !$this->session->logged_in){
			 header('Location: '.base_url('user/login'));
			 exit;
		 }
	}
}
