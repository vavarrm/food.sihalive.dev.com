<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class AdminCustomer extends CI_Controller {
	
	private $request = array();
	
	public function __construct() 
	{
		parent::__construct();	
		$this->load->model('user_Model', 'user');
		$this->response_code = $this->language->load('admin_response');
		$this->request = json_decode(trim(file_get_contents('php://input'), 'r'), true);
		$this->load->library('email');
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
	
	public function doLock()
	{
		$output['body']=array();
		$output['status'] = '200';
		$output['title'] ='do Lock ';
		$output['message'] ='set ok';
		$back =-2;
		try 
		{
			if(
				$this->post['u_id'] ==""
			)
			{
				$array = array(
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$data = $this->user->setLock($this->post);
			
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
	
	public function lockForm()
	{
		$output['body']=array();
		$output['status'] = '200';
		$output['title'] ='lock Form';
		
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
			$data = $this->user->getUserById($id);
			$output['body']['row']['info'] = $data['row'];
			$output['body']['row']['form'] = array(
				'action'	=> '/'.__CLASS__.'/doLock',
				'pe_id'		=>$this->get['pe_id']
			);
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
		$output['title'] ='User List';
		try 
		{
			$ary['limit'] = (isset($this->request['limit']))?$this->request['limit']:10;
			$ary['p'] = (isset($this->request['p']))?$this->request['p']:1;
			$form['inputSearchControl'] = array(
				'account'	=>array('type'	=>'text'),
				'phone'	=>array('type'	=>'text'),
			);
			if(!empty($form['inputSearchControl']))
			{
				foreach($form['inputSearchControl'] as $key => $value)
				{
					$$key= (isset($this->request[$key]))?$this->request[$key]:'';
				}
			}
			
			$form['selectSearchControl'] = array(
				'phone_verification'	=>array(
					array('value' =>'notyet' ,'text'=>'notyet'),
					array('value' =>'already' ,'text'=>'already'),
				),
				'email_verification'	=>array(
					array('value' =>'notyet' ,'text'=>'notyet'),
					array('value' =>'already' ,'text'=>'already'),
				)
			);
			if(!empty($form['selectSearchControl']))
			{
				foreach($form['selectSearchControl'] as $key => $value)
				{
					$$key= (isset($this->request[$key]))?$this->request[$key]:'';
				}
			}
			
			$ary['order'] = (empty($this->request['order']))?array("id"=>'DESC'):$this->request['order'];
		    

			$temp=array(
				'pe_id' =>$this->pe_id,
				'ad_id' =>$this->admin['ad_id'],
			);
			$action_list = $this->admin_user->getAdminListAction($temp);
	
			$ary['fields'] = array(
				'account'				=>'u.u_account AS account',
				'first_name'			=>'u.u_first_name AS first_name',
				'last_name'				=>'u.u_last_name AS last_name',
				'fb_u_id'				=>'u.fb_u_id AS fb_u_id',
				'fb_name'				=>'u.fb_name AS fb_name',
				'email'					=>'u.u_email AS email',
				'email_verification'	=>'u.u_email_verification AS email_verification',
				'phone'					=>'u.u_phone AS phone',
				'phone_verification'	=>'u.u_phone_verification AS phone_verification',
				'status'				=>'u.u_status AS status',
			);
			$ary['u.u_account'] = array(
				'value' =>$account,
				'logic' =>'AND',
				'operator' =>'=',
			);
			$ary['u.u_phone'] = array(
				'value' =>$phone,
				'logic' =>'AND',
				'operator' =>'=',
			);
			$ary['u.u_phone_verification'] = array(
				'value' =>$phone_verification,
				'logic' =>'AND',
				'operator' =>'=',
			);
			$ary['u.u_email_verification'] = array(
				'value' =>$email_verification,
				'logic' =>'AND',
				'operator' =>'=',
			);
			$list = $this->user->getList($ary);
			
			
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
	
	public function doSendVerificationEmail()
	{
		
$subject = 'This is a test';
$message = '<p>This message has been sent for testing purposes.</p>';

// Get full html:
$body = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=' . strtolower(config_item('charset')) . '" />
    <title>' . html_escape($subject) . '</title>
    <style type="text/css">
        body {
            font-family: Arial, Verdana, Helvetica, sans-serif;
            font-size: 16px;
        }
    </style>
</head>
<body>
' . $message . '
</body>
</html>';
// Also, for getting full html you may use the following internal method:
//$body = $this->email->full_html($subject, $message);

$result = $this->email
    ->from('vavarrm@gmail.com')
    ->to('vavarrm@gmail.com')
    ->subject($subject)
    ->message($body)
    ->send();

var_dump($result);
echo '<br />';
echo $this->email->print_debugger();

	}
}
