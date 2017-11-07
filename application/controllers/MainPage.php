<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MainPage extends CI_Controller {
	
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
		
		$categorys = $this->food->getCategory();
		$foods = $this->food->getFoodForMenu();
		
		$this->smarty->assign(array(
			'categorys'	=>$categorys,
			'foods'		=>$foods 
		));
		$this->smarty->displayFrame(__CLASS__.'/menu-modern.tpl');
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
