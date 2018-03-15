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
						'el_system_error' 	=>$error['message'] ,
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
		
		public function getAdminListAction($ary)
		{
			try
			{
				$sql ="	SELECT 
							per.pe_name,
							per.pe_func,
							per.pe_id,
							per.pe_control,
							per.pe_page
						FROM admin_user AS au 
							INNER JOIN admin_role_permissions_link AS link ON au.ad_ar_id =  link.ar_id
							INNER JOIN permissions AS per ON link.pe_id = per.pe_id
						WHERE per.pe_parents_id = ? AND au.ad_id=? AND pe_type ='action'";
				$bind = array(
					$ary['pe_id'],
					$ary['ad_id']
				);
				$query = $this->db->query($sql, $bind);
				// echo $this->db->last_query();
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'el_system_error' 	=>$error['message'] ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				$rows = $query->result_array();
				return $rows;
			}catch(MyException $e)
			{
				throw $e;
			}
		}
		
		public function getAdminPermissions($ary)
		{
			try
			{
				$sql ="	SELECT 
							per.pe_name,
							per.pe_func,
							per.pe_id,
							per.pe_control,
							per.pe_page
						FROM admin_user AS au 
							INNER JOIN admin_role_permissions_link AS link ON au.ad_ar_id =  link.ar_id
							INNER JOIN permissions AS per ON link.pe_id = per.pe_id
						WHERE per.pe_id = ? AND au.ad_id=?";
				$bind = array(
					$ary['pe_id'],
					$ary['ad_id']
				);
				$query = $this->db->query($sql, $bind);
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'el_system_error' 	=>$error['message'] ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				$row = $query->row_array();
				return $row;
			}catch(MyException $e)
			{
				throw $e;
			}
		}
		
		public function getList($ary)
		{
			try
			{
				if(empty($ary))
				{
					$MyException = new MyException();
					$array = array(
						'el_system_error' 	=>$error['message'] ,
						'status'	=>'000'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$fields = join(',' ,$ary['fields']);
				
				$sql ="	SELECT ad_id AS id," 
						.$fields.	
						" FROM
							admin_user AS au 
						";
				$ary['sql'] =$sql;
				$output = $this->getListFromat($ary);
				return 	$output  ;
			}catch(MyException $e)
			{
				throw $e;
			}
		}
		
		public function getRoleList()
		{
			try
			{
				$sql ="	SELECT 
							ar_id ,
							ar_name
						FROM  admin_role  WHERE ar_id !=1";
				$query = $this->db->query($sql);
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'el_system_error' 	=>$error['message'] ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				$rows = $query->result_array();
				return $rows;
			}catch(MyException $e)
			{
				throw $e;
			}
		}
		
		public function getAdminMenuList()
		{
			try
			{
			
				$sql ="	SELECT 
							per.pe_name,
							per.pe_func,
							per.pe_id,
							per.pe_control,
							per.pe_page,
							per.pe_order_id 
						FROM admin_user AS au 
							INNER JOIN admin_role_permissions_link AS link ON au.ad_ar_id =  link.ar_id
							INNER JOIN permissions AS per ON link.pe_id = per.pe_id
						WHERE per.pe_parents_id = 0
						ORDER BY per.pe_order_id DESC";
				$query = $this->db->query($sql, $bind);
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'el_system_error' 	=>$error['message'] ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
	
				$output['list'] = $query->result_array();
				if(!empty($output['list']))
				{
					foreach($output['list'] as $key => &$value)
					{
						$sql="	SELECT 
									pe_name,
									pe_func,
									pe_id,
									pe_control,
									pe_page
								FROM permissions WHERE pe_parents_id =? AND pe_type='menu'";
						$bind = array(
							$value['pe_id']
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
						$child = $query->result_array();
						$value['child'] = $child;
					}
				}
				$query->free_result();
				return $output;
			}	
			catch(MyException $e)
			{
				throw $e;
			}
		}
	}
?>