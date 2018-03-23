<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Contacts extends CI_Controller {
	
	public function __construct() 
	{
		parent::__construct();
        $this->mainpage_language_ary = $this->language->load('mainpage');
    }
	
	public function index()
	{
		$this->smarty->assign(array(
			'f_id'				=>$f_id,
            'mainpage_language_ary'	=>$this->mainpage_language_ary,

		));
		$this->smarty->displayFrame(__CLASS__.'/index.tpl');
	}
	
}
