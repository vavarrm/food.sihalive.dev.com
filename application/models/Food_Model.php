<?php
	class Food_Model extends CI_Model 
	{
		function __construct()
		{
			
			parent::__construct();
			$this->load->database();
		}
	
		public function getProductForFid($f_id)
		{
			$sql="	SELECT * 
					FROM `food` AS f LEFT JOIN category AS ca ON f.ca_id = ca.ca_id
					WHERE f_id =?";
			$bind = array(
				$f_id
			);
			$query = $this->db->query($sql, $bind);
			$rows  =  $query->row_array();
			$query->free_result();
			return $rows;
		}
	
		public function getCategory()
		{
			$sql="SELECT * FROM `category` ORDER BY ca_id";
			$query = $this->db->query($sql, $bind);
			$rows  =  $query->result_array();
			$query->free_result();
			return $rows;
		}
		
		public function getFoodClassList()
		{
		
		}
		
		public function getFoodForMenu($where = array())
		{
			$where_str =" 1 = 1 AND f_is_del='0'";
			if(!empty($where) )
			{
				foreach($where as $key =>$vale)
				{
					$where_str.=sprintf(" AND %s = ?", $key);
					$bind[] = $value;
				}
			}
			$sql ="	SELECT * 
					FROM `food` AS f
						LEFT JOIN `category` AS ca ON f.ca_id = ca.ca_id
					WHERE ".$where_str."
					ORDER BY f.f_id DESC";
			$query = $this->db->query($sql, $bind);
			$rows  =  $query->result_array();
			$query->free_result();
			return $rows;
		}
	}
?>