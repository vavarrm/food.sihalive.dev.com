<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Api extends CI_Controller {
	
	private $request = array();
	
	public function __construct() 
	{
		parent::__construct();	
		$this->request = json_decode(trim(file_get_contents('php://input'), 'r'), true);
		$this->load->model('Food_Model', 'food');
    }
	
	/*
	取得菜單分類
	*/
	public function getCategory()
	{
		$status = 100;
		$body =array();
		$title ='取得菜單分類';
		try 
		{
			$body['data'] = $this->food->getCategory();
			$output = array(
				'status'	=>$status 
			);
		}catch(Exception $e)
		{
			$output['status'] = $status ;
			$output['errormsg'] = $e->getMessage();
		}
		
		$this->response($body , $title, $status);
	}
	
	private function response($body, $title, $status)
	{
		
		$output = array(
			'body'		=>$body,
			'title'		=>$title,
			'status'	=>$status,
		);
		
		header('Content-Type: application/json');
		echo json_encode($output , true);
	}
}
