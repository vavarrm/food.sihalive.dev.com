<?php
	class Food_Model extends CI_Model 
	{
		function __construct()
		{
			
			parent::__construct();
			$this->load->database();
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
		
		public function getFoodForMenu()
		{
			$sql ="	SELECT * 
					FROM `food` AS f
						LEFT JOIN `category` AS ca ON f.ca_id = ca.ca_id
					ORDER BY f.f_id DESC";
			$query = $this->db->query($sql, $bind);
			$rows  =  $query->result_array();
			$query->free_result();
			return $rows;
		}
	}
?>