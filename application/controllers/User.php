<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Controller {
	
	public function __construct() 
	{
		parent::__construct();
		$this->user_language_ary = $this->language->load('user');
		$this->response_code = $this->language->load('admin_response');
		$this->request = json_decode(trim(file_get_contents('php://input'), 'r'), true);
		$this->get = $this->input->get();
		$this->post = $this->input->post();
		$this->load->model('User_Model', 'user');
        $this->load->model('Food_Model', 'food');
        $this->load->model('Order_Model', 'order');
        $this->load->library('session');
        $this->my_data= $_SESSION['27'] ;


    }
	
	public function Profile()
	{

        $order = $this->order->User_OrderList($this->my_data);

		$this->smarty->assign(array(

            'order'		=>$order,
			'userLanguageAry'	=>$this->user_language_ary,
		));
		$this->smarty->displayFrame(__CLASS__.'/profile.tpl');
	}
	
	
	// public function set
	
	public function index()
	{
        $this->smarty->assign(array(
            'userLanguageAry'	=>$this->user_language_ary,
        ));
        $this->smarty->displayFrame(__CLASS__.'/profile.tpl');
		
	}
	
	public function setProfile()
	{
	}
	
	public function setProfileInit()
	{
		$output['body']=array();
		$output['status'] = '200';
		$output['title'] ='get login info';
		try 
		{
		
			$encrypt_user_data = $_SESSION['encrypt_user_data'] ;
			$urlRsaRandomKey =$this->get['sess'];
			$decrypt_user_data= $this->myfunc->decryptUser($urlRsaRandomKey, $encrypt_user_data);
			$user =  $this->user->getUserForId($decrypt_user_data['u_id']);
			$output['body']['user']=$user ;
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
