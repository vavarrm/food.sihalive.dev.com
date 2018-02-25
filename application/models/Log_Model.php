<?php
	class Log_Model extends CI_Model 
	{
		function __construct()
		{
			
			parent::__construct();
			$this->load->database();
		}
		
		public function  error_log($ary)
		{
			$sql="INSERT INTO  error_log  
					(el_message,el_class,el_function) 
					VALUES(?,?,?)";
			$bind = array(
				$ary['message'],
				$ary['class'],
				$ary['function'],
			);
			$query = $this->db->query($sql, $bind);
			
		}
	}
?>