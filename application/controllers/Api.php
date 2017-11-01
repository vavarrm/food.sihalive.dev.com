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
	
	
	public function checkout()
	{
		$output['body']=array();
		$output['status'] = '100';
		$output['title'] ='结帐';
		try 
		{
				
			if(empty($this->request))
			{
				$output['status'] ='000';
				throw new Exception("request is empty");
			}
		}catch(Exception $e)
		{
			$output['status'] = $status ;
			$output['errormsg'] = $e->getMessage();
		}
		
		$this->response($output);
	}
	
	public function getProduct()
	{
		$get= $this->input->get();
		
		$status = 100;
		$body =array();
		$output['title'] ='取得产品';
		try 
		{
			$output['body']['data'] = $this->food->getProductForFid($get['f_id']);
			$output['status'] = $status ;
		}catch(Exception $e)
		{
			$output['status'] = $status ;
			$output['errormsg'] = $e->getMessage();
		}
		
		$this->response($output);
		
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
			$output['body']['data'] = $this->food->getCategory();
			$output['status'] = $status ;;
		}catch(Exception $e)
		{
			$output['status'] = $status ;
			$output['errormsg'] = $e->getMessage();
		}
		
		$this->response($output);
	}
	
	private function response($output)
	{
		
		$output = array(
			'body'		=>$output['body'],
			'title'		=>$output['title'],
			'status'	=>$output['status'],
			'message'	=>$output['message']
		);
		
		header('Content-Type: application/json');
		echo json_encode($output , true);
	}
}
