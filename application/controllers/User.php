<?php
defined('BASEPATH') OR exit('No direct script access allowed');
session_start();
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
        $this->load->helper('url');



    }

	public function Profile()
	{

       // var_dump($_SESSION['encrypt_user_data']);
       // exit();
        $order = $this->order->User_OrderList('27');

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

    function inv($inv)
    {
        $order = $this->user->inv_view($inv);
        $sum = $this->user->sum_price_order_by_rId($inv);
        if($order==true){
            $this->smarty->assign(array(
                'order'            =>$order,
                'sum'            =>$sum,
                'userLanguageAry'	=>$this->user_language_ary,
            ));
            $this->smarty->displayFrame(__CLASS__.'/order_detail.tpl');
        }else{

            redirect(base_url().'profile');

        }





    }








}
