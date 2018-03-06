<?php
	class SP_Model extends CI_Model 
	{
		function __construct()
		{
			
			parent::__construct();
			$this->load->database();
		}
	
		public function getSerialNumber($type)
		{
			try
			{
				$query = $this->db->query("CALL get_serial_number('order')");
				// $res      = $query->result();
				var_dump($query->row_array());

				$query->next_result(); 
				
			}catch(MyException $e)
			{
				throw $MyException;
			}
		}
	}
?>