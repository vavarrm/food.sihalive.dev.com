<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class MyFunc
{
	private $CI ;
	public function __construct() 
	{
		$this->CI =& get_instance();
	}
	
	public function response($output)
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
	
	public function readJson($parameter = array())
	{
		$default = array(
			'model'	=>'r'
		);
		$parameter = array_merge($default, $parameter);
		$filename = JSONPATH.$parameter['file_name'];
		if(file_exists($filename))
		{
			
			$file = fopen($filename, $parameter['model']);
			if($file != NULL){
				while (!feof($file)) {
					$str .= fgets($file);
				}
				fclose($file);
			}
		}
		return $str;
	}
	
	public function writeJson($parameter = array())
	{
		$default = array(
			'model'	=>'w'
		);

		$parameter = array_merge($default, $parameter);
		$file = fopen(JSONPATH.$parameter['file_name'], $parameter['model']);
		if($file != NULL){
			fwrite($file, $parameter['str']);
			fclose($file);
		}else{
			throw new Exception('file write error');
		}
	}
	
	public function gotoUrl($url , $msg ='')
	{
		echo "<script>";
		if($msg !="")
		{
			echo sprintf("alert('%s');", $msg );
		}
		
		echo sprintf(" location.href = '%s'" , $url);
		
		echo "</script>";
	}
	
	public function back($num = -1 , $msg ='')
	{
		echo "<script>";
		if($msg !="")
		{
			echo sprintf("alert('%s');", $msg );
		}
		
		echo sprintf("history.go(%s);" , $num);
		
		echo "</script>";
	}
	
	public function getDirAllFile($dir)
	{
		if (is_dir($dir)) 
		{
			if ($dh = opendir($dir)) 
			{
				while (($file = readdir($dh)) !== false) 
				{ 
					if(filetype($dir . $file) =="file")
					{
						
						$subfile = fopen($dir.$file, 'r');
						if($subfile != NULL)
						{
							$str="";
							while (!feof($subfile)) 
							{
								$str .= fgets($subfile);
							}
							fclose($subfile);
						}
						$temp = explode(".", $file);
						$output[$temp[0]] = $str;
					}
				}
				closedir($dh);
			}
		}
		return $output;
	}
	
	private function decryptUser($rsa_randomKey, $encrypt_user_data)
	{
		$randomKey =  $this->CI->token->privateDecrypt($rsa_randomKey);
		$encrypt_user_data = $_SESSION['encrypt_user_data'] ;
		$decrypt_user_data = $this->CI->token->AesDecrypt($encrypt_user_data , $randomKey );
		$user_data = unserialize($decrypt_user_data);
		return $user_data;
	}
	
	public function isLogin()
	{
		$get = $this->CI->input->get();
		$urlRsaRandomKey = 	$get["sess"];
		$encrypt_user_data = $_SESSION['encrypt_user_data'] ;
		$decrypt_user_data= $this->decryptUser($urlRsaRandomKey, $encrypt_user_data);
		return $decrypt_user_data;
		
	}
}