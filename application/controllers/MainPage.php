<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MainPage extends CI_Controller {
	
	public function __construct() 
	{
		parent::__construct();
		$this->mainpage_language_ary = $this->language->load('mainpage');
    }
	
	
	public function privacy()
	{
		$this->smarty->displayFrame(__CLASS__.'/privacy.tpl');
	}
	
	public function index()
	{
	
		$this->smarty->assign(
			array(
				'mainpage_language_ary'	=>$this->mainpage_language_ary
			)
		);
		$this->smarty->displayFrame(__CLASS__.'/index.tpl');
	}
}
