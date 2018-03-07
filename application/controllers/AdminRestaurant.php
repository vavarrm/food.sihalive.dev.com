<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class AdminRestaurant extends CI_Controller {
	
	private $request = array();
	
	public function __construct() 
	{
		parent::__construct();	
		$this->load->model('Restaurant_Model', 'restaurant');
		$this->response_code = $this->language->load('admin_response');
		$this->request = json_decode(trim(file_get_contents('php://input'), 'r'), true);
		$this->get = $this->input->get();
		$this->post = $this->input->post();
		
		$gitignore =array(

		);
			
		try 
		{
			$checkAdmin = $this->myfunc->checkAdmin($gitignore);
			if($checkAdmin !="200")
			{
				$array = array(
					'status'	=>$checkAdmin
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$parames['message'] =  $this->response_code[$parames['status']]; 
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
			$this->myLog->error_log($parames);
			$this->myfunc->response($output);
			exit;
		}
    }
	
	public function add()
	{
		$output['body']=array();
		$output['status'] = '200';
		$output['title'] ='Restaurant List';
		$output['message'] ='insert ok';
		$back =-2;
		try 
		{
			if(
				$this->post['r_name'] =='' ||
				$this->post['r_name_en']  =='' ||
				count($this->post['operation_day'])==0 ||
				count($this->post['start'])==0 ||
				count($this->post['end'])==0
			)
			{
				$array = array(
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			$data = $this->restaurant->insert($this->post);
			// if($data
		}catch(MyException $e)
		{
			$back++;
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$parames['message'] =  $this->response_code[$parames['status']]; 
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
			$this->myLog->error_log($parames);
		}
		
		$this->myfunc->back($back,$output['message']);
	}
	
	
	public function del()
	{
		$output['body']=array();
		$output['status'] = '200';
		$output['title'] ='Restaurant List';
		try 
		{
	
			$id= (isset($this->request['id']))?$this->request['id']:'';
			if($id=="")
			{
				$array = array(
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			$data = $this->restaurant->del($id);
			// if($data
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$parames['message'] =  $this->response_code[$parames['status']]; 
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
			$this->myLog->error_log($parames);
		}
		$this->myfunc->response($output);
	}
	
	public function doEdit()
	{
		$output['body']=array();
		$output['status'] = '200';
		$output['title'] ='Restaurant List';
		$output['message'] ='upload ok';
		$back =-2;
		try 
		{
			if(
				$this->post['r_id'] =='' ||
				$this->post['r_name'] =='' ||
				$this->post['r_name_en']  =='' ||
				count($this->post['operation_day'])==0 ||
				count($this->post['start'])==0 ||
				count($this->post['end'])==0
			)
			{
				$array = array(
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			$data = $this->restaurant->update($this->post);
			
			if($data['affected_rows'] ==0)
			{
				$output['message'] ="nothing upload";
				$back = -1;
			}
		}catch(MyException $e)
		{
			$back++;
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$parames['message'] =  $this->response_code[$parames['status']]; 
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
			$this->myLog->error_log($parames);
		}
		
		$this->myfunc->back($back,$output['message']);
	}
	
	public function getRow()
	{
		$output['body']=array();
		$output['status'] = '200';
		$output['title'] ='Restaurant Row';
		try 
		{
			$id= (isset($this->request['id']))?$this->request['id']:'';
			if($id=="")
			{
				$array = array(
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			$row = $this->restaurant->getRowById($id);
			$output['body']['row'] = $row;
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$parames['message'] =  $this->response_code[$parames['status']]; 
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
			$this->myLog->error_log($parames);
		}
		
		$this->myfunc->response($output);
	}
	
	public function getList($ary=array())
	{
		$output['body']=array();
		$output['status'] = '200';
		$output['title'] ='Restaurant List';
		try 
		{
			$ary['limit'] = (isset($this->request['limit']))?$this->request['limit']:1;
			$ary['p'] = (isset($this->request['p']))?$this->request['p']:1;
			$form['inputSearchControl'] = array(
				'r_name'	=>array('type'	=>'text'),
				'r_name_en'	=>array('type'	=>'text'),
			);
			if(!empty($form['inputSearchControl']))
			{
				foreach($form['inputSearchControl'] as $key => $value)
				{
					$$key= (isset($this->request[$key]))?$this->request[$key]:'';
				}
			}
			
			$ary['order'] = (empty($this->request['order']))?array("r_id"=>'DESC'):$this->request['order'];
		
			
			$ary['r_name'] = array(
				'value' =>$r_name,
				'logic' =>'AND',
				'operator' =>'like',
			);
			$ary['r_name_en'] = array(
				'value' =>$r_name_en,
				'logic' =>'AND',
				'operator' =>'like',
			);
			$ary['fields'] = array(
				'r_id'	=>'r_id',
				'r_name'	=>'r_name',
				'r_name_en'	=>'r_name_en',
			);
			$list = $this->restaurant->getList($ary);
			
			
			$output['body'] = $list;
			$output['body']['fields'] = $ary['fields'] ;
			$output['body']['form'] =$form;
			$output['body']['order'] =$ary['order'];
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$parames['message'] =  $this->response_code[$parames['status']]; 
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
			$this->myLog->error_log($parames);
		}
		
		$this->myfunc->response($output);
	}
}
