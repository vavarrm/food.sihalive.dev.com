<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ShopCart extends CI_Controller {
	
	public function __construct() 
	{
		parent::__construct();
		
    }
	
	public function order()
	{
		$this->smarty->assign(array(
		));
		$this->smarty->display(__CLASS__.'/shop-cart.tpl');
	}
	
}
