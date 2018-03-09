<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class AdminRestaurant extends CI_Controller {
	
	private $request = array();
	
	public function __construct() 
	{
		parent::__construct();	
		$this->load->model('Restaurant_Model', 'restaurant');
		$this->load->model('Food_Model', 'food');
		$this->response_code = $this->language->load('admin_response');
		$this->request = json_decode(trim(file_get_contents('php://input'), 'r'), true);
		$this->get = $this->input->get();
		$this->post = $this->input->post();
		$this->pe_id = (!empty($this->get['pe_id']))?$this->get['pe_id']:'';
		
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
		
		$this->admin = $this->myfunc->getAdminUser($this->get['sess']);
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
	
	public function addFoodInit()
	{
		$output['body']=array();
		$output['status'] = '200';
		$output['title'] ='Add Food Form Init';
		try 
		{
			$r_id = (!empty($this->request['id']))?$this->request['id']:'';
			if(	$r_id  =='')
			{
				$array = array(
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$ary['r_id'] =$r_id ;
			$output['body']['controller_list']['category_list'] = $this->restaurant->getRestaurantCategory($ary);
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
	
	public function getFoodList()
	{
		$output['body']=array();
		$output['status'] = '200';
		$output['title'] ='Restaurant List';
		try 
		{
			$r_id = (!empty($this->request['id']))?$this->request['id']:'';
			if(	$r_id  =='')
			{
				$array = array(
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$ary['limit'] = (isset($this->request['limit']))?$this->request['limit']:10;
			$ary['p'] = (isset($this->request['p']))?$this->request['p']:1;
			
			$form['inputSearchControl'] = array(
				'f_name'	=>array('type'	=>'text'),
				'f_name_en'	=>array('type'	=>'text'),
			);
			$form['table_add'] = __CLASS__."/addFood/addFoodForm/";
			if(!empty($form['inputSearchControl']))
			{
				foreach($form['inputSearchControl'] as $key => $value)
				{
					$$key= (isset($this->request[$key]))?$this->request[$key]:'';
				}
			}
			
			$ary['order'] = (empty($this->request['order']))?array("f_id"=>'DESC'):$this->request['order'];
			$ary['fields'] = array(
				'f_id'	=>'f.f_id',
				'f_name'	=>'f.f_name',
				'f_name_en'	=>'f.f_name_en',
				'category_name'  =>'ca.ca_name AS category_name',
				'category_name_en'  =>'ca.ca_name_en AS category_name_en',
			);
			$ary['f.f_r_id'] = array(
				'value' =>$r_id,
				'logic' =>'AND',
				'operator' =>'=',
			);
			$list = $this->restaurant->getFoodList($ary);
			
			$output['body'] = $list;
			$output['body']['fields'] = $ary['fields'] ;
			$output['body']['form'] =$form;
			$output['body']['action_list'] =$action_list;
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
			$ary['limit'] = (isset($this->request['limit']))?$this->request['limit']:10;
			$ary['p'] = (isset($this->request['p']))?$this->request['p']:1;
			$form['inputSearchControl'] = array(
				'r_name'	=>array('type'	=>'text'),
				'r_name_en'	=>array('type'	=>'text'),
			);
			$form['table_add'] = __CLASS__."/add/".__CLASS__.'Add/';
			if(!empty($form['inputSearchControl']))
			{
				foreach($form['inputSearchControl'] as $key => $value)
				{
					$$key= (isset($this->request[$key]))?$this->request[$key]:'';
				}
			}
			
			$ary['order'] = (empty($this->request['order']))?array("r_id"=>'DESC'):$this->request['order'];
		    
			// echo 
			$temp=array(
				'pe_id' =>$this->pe_id,
				'ad_id' =>$this->admin['ad_id'],
			);
			$action_list = $this->admin_user->getAdminListAction($temp);
			
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
			$output['body']['action_list'] =$action_list;
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
