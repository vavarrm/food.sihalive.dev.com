<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sms extends CI_Controller {
	
	public function __construct() 
	{
		parent::__construct();
    }
	
	
	public function phoneVerification()
	{
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
