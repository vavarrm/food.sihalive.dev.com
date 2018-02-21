<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sms extends CI_Controller {
	
	public function __construct() 
	{
		parent::__construct();
		$this->response_code = $this->language->load('response');
		$this->load->model('User_Model', 'user');
		$this->sms =$this->config->item('sms');
		$get = $this->input->get();
		$sess= $get ['sess'];
		$gitignore =array(
			
		);	
		try 
		{
			if(!in_array($this->uri->segment(2),$gitignore))
			{
				$decrypt_user_data =$this->myfunc->isLogin();
				if(empty($decrypt_user_data))
				{
					$array = array(
					'status'	=>'011'
					);
					$MyException = new MyException();
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$this->login_user = $decrypt_user_data;

			}
			if($sess =="")
			{
				$array = array(
					'status'	=>'001'
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
			$output['status']	=$parames['status'];
			$output['message'] = $this->response_code[$parames['status']]; 
			$this->myfunc->response($output);
			exit;
		}
	
    }
	
	
	public function phoneVerification ()
	{
		$output['body']=array();
		$output['status'] = '200';
		$output['title'] ='手机验证';
		try 
		{
			$user = $this->user->getUserForId($this->login_user['u_id']);
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$output['status']	=$parames['status'];
			$output['message'] = $this->response_code[$parames['status']]; 
		}
		
		$this->myfunc->response($output);
	}
	
	private function send()
	{
		$get = $this->input->get();
		$url="http://client.mekongsms.com/api/postsms.aspx";
		$post = array(
			'username'	=>$this->sms['username'],
			'pass'		=>$this->sms['password'],
			'cd'		=>"Cust001",
			'sender'	=>"Sihalive",
			'smstext'	=>$get['smstext'],
			'isflash'	=>0,
			'gsm'		=>$get['gsm'],
		);
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/x-www-form-urlencoded'));
		curl_setopt($ch, CURLOPT_POST, true);
		curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($post)); 
		$output = curl_exec($ch); 
		curl_close($ch);
		echo $output;
	}
	
}
