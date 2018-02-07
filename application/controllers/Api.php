<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Api extends CI_Controller {
	
	private $request = array();
	
	public function __construct() 
	{
		parent::__construct();	
		
		$this->request = json_decode(trim(file_get_contents('php://input'), 'r'), true);
		$this->load->model('Food_Model', 'food');
		$this->load->model('User_Model', 'user');
		$this->load->model('Order_Model', 'order');
		$this->load->model('Position_Model', 'position');
		$this->js = $this->language->load('js');
		$this->sms =$this->config->item('sms');
    }

	
	public function getSetList()
	{
		$output['body']=array();
		$output['status'] = '200';
		$output['title'] ='getSetList';
		try 
		{
			$get = $this->input->get();
			$f_id = $get['f_id'];
			$temp = $this->food->getSetList($f_id);
			if(!empty($temp))
			{
				foreach($temp as $value)
				{
					$rows['set']['ca_name']  =  $value['ca_name'];
					$rows['set']['f_id']  =  $value['f_id'];
					$rows['set']['setName']  =  $value['setName'];
					$rows['set']['f_large_price']  =  $value['f_large_price'];
					$rows['set']['f_id']  =  $value['f_id'];
					$rows['select'][$value['fs_group_id']]['data'][] =  $value;
					$rows['select'][$value['fs_group_id']]['ca_name'] =  $value['ca_name'];
				}
			}
			$output['body']['rows'] = $rows;
		}catch(Exception $e)
		{
			$output['status'] = '000';
			$output['message'] = $e->getMessage();
		}
		
		$this->response($output);
	}
	
	public function getSMDBalance ()
	{
		$url="http://client.mekongsms.com/api/postcheckbalance.aspx";
		$post = array(
			'username'	=>$this->sms['username'],
			'pass'		=>$this->sms['password'],
		);
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_POST, true);
		curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($post)); 
		$output = curl_exec($ch); 
		curl_close($ch);
		echo $output;
	}
	
	public function sendSMS()
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
	
	public function getOrderList()
	{
		$output['body']=array();
		$output['status'] = '200';
		$output['title'] ='set Profile';
		try 
		{
			$get = $this->input->get();
			$sess= $get ['sess'];
			$urlRsaRandomKey = 	$get["sess"];
			$encrypt_user_data = $this->session->userdata('encrypt_user_data');
			$user_data = $this->decryptUser($urlRsaRandomKey, $encrypt_user_data);
			if(!$user_data)
			{
				throw new Exception("get user error");
			}
			$get['u_id'] = $user_data['u_id'];
			$output['body']['data']['orders'] = $this->order->getOrderList($get);
		}catch(Exception $e)
		{
			$output['status'] = '000';
			$output['message'] = $e->getMessage();
		}
		
		$this->response($output);
	}
	
	public function setProfile()
	{
		$output['body']=array();
		$output['status'] = '200';
		$output['title'] ='set Profile';
		try 
		{
			$get = $this->input->get();
			$sess= $get ['sess'];
			$urlRsaRandomKey = 	$get["sess"];
			$encrypt_user_data = $this->session->userdata('encrypt_user_data');
			$user_data = $this->decryptUser($urlRsaRandomKey, $encrypt_user_data);
			if(!$user_data)
			{
				throw new Exception("get user error");
			}
			$output['body']['affected_rows'] = $this->user->setsetProfile($this->request, $user_data['u_id']);
			
			
		}catch(Exception $e)
		{
			$output['status'] = '000';
			$output['message'] = $e->getMessage();
		}
		
		$this->response($output);
	}
	
	public function isUserExist()
	{
		$output['body']=array();
		$output['status'] = '200';
		$output['title'] ='is User Exist';
		try 
		{
			$get = $this->input->get();
			$u_name = $get ['u_name'];
			$isUserExist  = $this->user->isUserNameExist($u_name);
			$output['body']['data']['is_user_exist'] =$isUserExist['total'] ;
			
		}catch(Exception $e)
		{
			$output['status'] = '000';
			$output['message'] = $e->getMessage();
		}
		
		$this->response($output);
	}
	
	public function isEmailExist()
	{
		$output['body']=array();
		$output['status'] = '200';
		$output['title'] ='is Email Exist';
		try 
		{
			$get = $this->input->get();
			$u_email = $get ['u_email'];
			$isUserExist  = $this->user->isEmailExist($u_email);
			$output['body']['data']['is_user_exist'] =$isUserExist['total'] ;
			
		}catch(Exception $e)
		{
			$output['status'] = '000';
			$output['message'] = $e->getMessage();
		}
		
		$this->response($output);
	}
	
	// public function test()
	// {
		// $output['body']=array();
		// $output['status'] = '200';
		// $output['title'] ='test';
		// $get= $this->input->get();
		// try 
		// {
			// $str = $get['str'];
			// $encrypt = $this->rsa->privateEncrypt($str) ;
			// $decrypt= $this->rsa->publicDecrypt($encrypt) ;
			// $output['body']['encrypt'] = $encrypt  ;
			// $output['body']['decrypt'] = $decrypt  ;
		// }catch(Exception $e)
		// {
			// $output['status'] = '000';
			// $output['message'] = $e->getMessage();
		// }
		
		// $this->response($output);
	// }
	
	public function getDeliveryPosition()
	{
		$output['body']=array();
		$output['status'] = '200';
		$output['title'] ='get Delivery Position';
		try 
		{
			$positions = $this->position->getDeliveryPosition();
			$output['body']['data']['positions'] =$positions ;
			
		}catch(Exception $e)
		{
			$output['status'] = '000';
			$output['message'] = $e->getMessage();
		}
		
		$this->response($output);
	}
	
	public function fbLogin()
	{
		$output['body']=array();
		$output['status'] = '200';
		$output['title'] ='FB登入';
		try 
		{
			if(empty($this->request))
			{
				$output['status'] ='000';
				throw new Exception("request is empty");
			}
			
			$response =  $this->fb->get('/me?fields=id,name,email', $this->request['accessToken']);
			if(empty($response))
			{
				throw new Exception("fb response empty");
			}
			$fbuser = $response->getGraphUser();
			$user = $this->user->getUserForFBId($fbuser['id']);
			
			if(empty($user))
			{
				throw new Exception("user is no exist");
			}
			
			$sess = $this->doLogin($user);
			$output['body']['sess'] = $sess;
			
		}catch(Exception $e)
		{
			$output['status'] = '000';
			$output['message'] = $e->getMessage();
		}
		
		$this->response($output);
	}
	
	public function fbReg()
	{
		$output['body']=array();
		$output['status'] = '200';
		$output['title'] ='FB注册';
		try 
		{
			if(empty($this->request))
			{
				$output['status'] ='000';
				throw new Exception("request is empty");
			}
			$response =  $this->fb->get('/me?fields=id,name,email', $this->request['accessToken']);
			if(empty($response))
			{
				throw new Exception("fb response empty");
			}
			$fbuser = $response->getGraphUser();
			$user = $this->user->getUserForFBId($fbuser['id']);
			if(!empty($user))
			{
				throw new Exception("fb user is exist");
			}
			
			
			$insert = array(
				'u_name'		=>NULL,
				'u_passwd'		=>NULL,
				'u_email'		=>NULL,
				'u_reg_type'	=>'fb',
				'fb_u_id'		=>$fbuser['id']
			);
			$row = $this->user->insert($insert);
			if($row['affected_rows'] <0)
			{
				throw new Exception("insert user error");
			}
			$user = $this->user->getUserForFBId($fbuser['id']);
			$sess = $this->doLogin($user);
			$output['body']['sess'] = $sess;
			
		}catch(Exception $e)
		{
			$output['status'] = '000';
			$output['message'] = $e->getMessage();
		}
		
		$this->response($output);
	}
	
	public function logout()
	{
		$output['body']=array();
		$output['status'] = '200';
		$output['title'] ='登出';
		try 
		{
			$this->session->unset_userdata('encrypt_user_data');
		}catch(Exception $e)
		{
			$output['message'] = $e->getMessage();
		}
		
		$this->response($output);
	}
	
	private function doLogin($ary)
	{
		$row = $this->user->getUserForLogin($ary);
		if(empty($row))
		{
			$output['status'] ='001';
			throw new Exception($this->js['js_user_empty']);
		}elseif(md5($ary['u_passwd']) != $row['u_passwd'] && $ary['logintype'] =='web'){
			$output['status'] ='002';
			throw new Exception($this->js['js_user_passwd_error']);
		}else{
			$user = array(
				'u_name'  =>$row['u_name'],
				'u_email' =>$row['u_email'],
				'u_id' =>$row['u_id'],
				'fb_u_id' =>$row['fb_u_id'],
			);
			$randomKey = $this->token->getRandomKey();
			$rsaRandomKey = $this->token->publicEncrypt($randomKey);
			$data = array(
				'u_name'  =>$row['u_name'],
				'u_email' =>$row['u_email'],
				'u_id' =>$row['u_id'],
				'fb_u_id' =>$row['fb_u_id'],
			);
			$encrypt_user_data = $this->token->AesEncrypt(serialize($data), $randomKey);
			$this->session->set_userdata('encrypt_user_data', $encrypt_user_data);
			$encrypt_user_data = $this->session->userdata('encrypt_user_data');
			// var_dump($encrypt_user_data);
			$urlRsaRandomKey = urlencode($rsaRandomKey) ;
			return $urlRsaRandomKey ;
		}
	
	}
	
	private function decryptUser($rsa_randomKey, $encrypt_user_data)
	{
		$randomKey =  $this->token->privateDecrypt($rsa_randomKey);
		$encrypt_user_data = $this->session->userdata('encrypt_user_data');
		$decrypt_user_data = $this->token->AesDecrypt($encrypt_user_data , $randomKey );
		$user_data = unserialize($decrypt_user_data);
		return $user_data;
	}
	
	public function getUser($urlRsaRandomKey='')
	{
		$output['body']=array();
		$output['status'] = '200';
		$output['title'] ='取得登入訊息';
		try 
		{	$get = $this->input->get();
			if(isset($get['sess']))
			{
				$urlRsaRandomKey =$get['sess'];
			}
			$encrypt_user_data = $this->session->userdata('encrypt_user_data');
			$decrypt_user_data= $this->decryptUser($urlRsaRandomKey, $encrypt_user_data);
			if(!$decrypt_user_data)
			{
				$output['status'] ='000';
				throw new Exception("get user error");
			}
			$user_data = $this->user->getUserForId($decrypt_user_data['u_id']);
			$output['body']['user_data'] =$user_data  ;
		}catch(Exception $e)
		{
			$output['status'] = '000';
			$output['message'] = $e->getMessage();
		}
		
		$this->response($output);
	}
	
	public function login()
	{
		$output['body']=array();
		$output['status'] = '200';
		$output['title'] ='登入';
		try 
		{
			if(empty($this->request))
			{
				throw new Exception("request is empty");
			}
			
			if(empty($this->request['username_email']))
			{
				throw new Exception("username_email is empty");
			}
			
			if(empty($this->request['u_passwd']))
			{
				throw new Exception("u_passwd is empty");
			}
			$this->request['u_name'] = $this->request['username_email'];
			$this->request['u_email'] = $this->request['username_email'];
			$sess = $this->doLogin($this->request);
			$output['body']['sess'] = $sess;
		}catch(Exception $e)
		{
			$output['status'] = '000';
			$output['message'] = $e->getMessage();
		}
		
		$this->response($output);
	}
	
	public function registration()
	{
		$output['body']=array();
		$output['status'] = '200';
		$output['title'] ='註冊';
		try 
		{
			if(empty($this->request))
			{
				throw new Exception("request is empty");
			}
			
			if(empty($this->request['u_name']))
			{
				throw new Exception("u_name is empty ");
			}
			
			if(strlen($this->request['u_name']) > 20)
			{
				throw new Exception("u_name length over 20 ");
			}
			
			if(strlen($this->request['u_name']) < 6)
			{
				throw new Exception("u_name length less 6 ");
			}
			
			if(empty($this->request['u_email']))
			{
				throw new Exception("u_email is empty ");
			}
			
			if(!preg_match("/([\w\-]+\@[\w\-]+\.[\w\-]+)/", $this->request['u_email'])) 
			{
				throw new Exception("email format is wrong ");
			}
			
			if(empty($this->request['u_passwd']))
			{
				throw new Exception("u_passwd is empty ");
			}
			
			if(strlen($this->request['u_passwd']) > 12)
			{
				throw new Exception("u_passwd length over 12 ");
			}
			
			if(strlen($this->request['u_passwd']) < 6)
			{
				throw new Exception("u_passwd length less 6 ");
			}
			
			if(empty($this->request['u_passwd_confirm']))
			{
				throw new Exception("u_passwd_confirm is empty ");
			}
			
			if($this->request['u_passwd'] != $this->request['u_passwd_confirm'] )
			{
				throw new Exception("password confirm error ");
			}
			
			$isUserExist = $this->user->isUserExist($this->request);
			if($isUserExist >0)
			{
				throw new Exception("username or email is exist");
			}

			$row = $this->user->insert($this->request);
			if($row['affected_rows'] <0)
			{
				throw new Exception("insert user error");
			}
			$output['message'] ="insert OK";
			$sess = $this->doLogin($this->request);
			$output['body']['sess'] = $sess;
			
		}catch(Exception $e)
		{
			$output['status'] = '000';
			$output['message'] = $e->getMessage();
		}
		
		$this->response($output);
	}
	
	public function checkout()
	{
		$output['body']=array();
		$output['status'] = '200';
		$output['title'] ='结帐';
		try 
		{
			if(empty($this->request))
			{
				throw new Exception("request is empty");
			}
			
			$user  = $this->session->userdata('encrypt_user_data');
			
			if(empty($user))
			{
				throw new Exception("user no login");
			}
			$get = $this->input->get();
			$urlRsaRandomKey = 	$get["sess"];
			$encrypt_user_data = $this->session->userdata('encrypt_user_data');
			$user_data = $this->decryptUser($urlRsaRandomKey, $encrypt_user_data);
			if(!$user_data)
			{
				throw new Exception("get user error");
			}
			$this->request['u_id'] = $user_data['u_id'];
			$this->food->inserdOrder($this->request);
			$ary =array(
				'action'	=>'order_alert'
			);
			$output['body']['order_alert'] = $this->socketIO->push($ary);
			
		}catch(Exception $e)
		{
			$output['status'] ='000';
			$output['message'] = $e->getMessage();
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
			$output['status'] ='000';
			$output['message'] = $e->getMessage();
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
			$output['status'] ='000';
			$output['message'] = $e->getMessage();
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
