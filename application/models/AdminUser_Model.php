<?php
	class AdminUser_Model extends CI_Model 
	{
		function __construct()
		{
			
			parent::__construct();
			$this->load->database();
		}
		
		public function getMenu()
		{
			$sql="SELECT * FROM  permissions";
		}
		
		public function getAdminByAccount($account)
		{
			
			try
			{
			
				$sql =" SELECT 
							ad_id, 
							ad_account, 
							ad_passwd ,
							ar_id ,
							ad_status
						FROM admin_user 
						WHERE ad_account =?";
				$bind =array(
					$account
				);
				$query = $this->db->query($sql, $bind);
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>$error['message'] ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				$row = $query->row_array();
				$query->free_result();
				return $row;
			}	
			catch(MyException $e)
			{
				throw $e;
			}
		}
	}
?>