<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ShopCart extends CI_Controller {
	
	public function __construct() 
	{
		parent::__construct();
		$this->shopcart_language_ary = $this->language->load('shopcart');
        $this->load->model("User_Position_Model");
    }
	
	public function index()
	{
		$this->order();
	}
	
	public function order()
	{
        $user_location= $this->User_Position_Model->listLocation();

		$this->smarty->assign(array(
			'shopLanguageAry'	=>$this->shopcart_language_ary,
		));
		$this->smarty->displayFrame(__CLASS__.'/shop-cart.tpl');
	}

	public  function test()
    {
        $this->smarty->assign(array(
            'myname'	=>'tryion',
        ));
        $this->smarty->display(__CLASS__.'/test.tpl');
    }
	
}
