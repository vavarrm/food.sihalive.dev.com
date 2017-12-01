<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {
	
	public function __construct() 
	{
		parent::__construct();
		
    }
	
	public function index()
	{
		$get= $this->input->get();
		$this->smarty->assign(array(
			'back'	=>$get['back']
		));
		$this->smarty->displayFrame(__CLASS__.'/index.tpl');
	}
	
}
