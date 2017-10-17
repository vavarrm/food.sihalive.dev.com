<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Food extends CI_Controller {
	
	public function __construct() 
	{
		parent::__construct();
		$this->food_language_ary = $this->language->load('food');
		$this->load->model('Food_Model', 'food');	
		
    }
	
	public function index()
	{
		$shopList = array(
			array(
			),			
			array(
			),			
			array(
			),			
			array(
			),			
			array(
			),
		);
	
		
		$foodTypeClass = array(
			array(
			),
			array(
			),
			array(
			),
		);
		$this->smarty->assign(array(
			'shopList'			=>$shopList,
			'foodTypeClass'		=>$foodTypeClass,

		));
		$this->smarty->display(__CLASS__.'/index.tpl');
	}
	
	public function menu()
	{
		$foodList = $this->food->getFoodList();
		$foodClassList =$this->food->getFoodClassList();
		$this->smarty->assign(array(
			'foodList'			=>$foodList,
			'foodClassList'		=>$foodClassList,
			'foodLanguageAry'	=>$this->food_language_ary,
		));
		$this->smarty->display(__CLASS__.'/menu.tpl');
	}
	
	public function shopCar()
	{
		$this->smarty->assign(array(
			'foodLanguageAry'	=>$this->food_language_ary,
		));
		$this->smarty->display(__CLASS__.'/shopCar.tpl');
	}
	
	public function shopInfo()
	{
		
		$shopImageList = array(
			array(
			),
			array(
			),
			array(
			),
			array(
			),
		);
		
		$this->smarty->assign(array(
			'shopImageList'			=>$shopImageList
		));
		$this->smarty->display(__CLASS__.'/shopInfo.tpl');
	}
	
	
}
