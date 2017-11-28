<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Controller {
	
	public function __construct() 
	{
		parent::__construct();
		$this->user_language_ary = $this->language->load('user');
    }
	
	public function Profile()
	{
		$this->smarty->assign(array(
			'userLanguageAry'	=>$this->user_language_ary,
		));
		$this->smarty->displayFrame(__CLASS__.'/profile.tpl');
	}
	
	
	public function index()
	{
		
	}
	
	
}
