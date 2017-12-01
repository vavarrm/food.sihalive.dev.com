<?php
	class Order_Model extends CI_Model 
	{
		function __construct()
		{
			
			parent::__construct();
			$this->load->database();
		}
	
		public function getOrderList($where = array())
		{
			$ignore = array(
				'sess',
				'u_id'
			);
			$where_str =" 1 = 1";
			if(!empty($where))
			{
				foreach($where as $key =>$value)
				{
					if(in_array($key, $ignore))
					{
						continue;
					}
					$where_str .=sprintf(" AND %s = ?", $key);
					$bind[] =$value;
				}
			}
			$sql = 'SELECT 
						* ,
						(SELECT SUM(od_num * od_price) AS o_total FROM  order_detail AS od WHERE od.o_id = ol.o_id) AS o_total
					FROM 
						order_list AS ol  
							LEFT JOIN order_status AS os ON ol.o_status = os.os_id
					WHERE '.$where_str.' 
					ORDER BY ol.o_id DESC';
			$query = $this->db->query($sql, $bind);
			$rows =  $query->result_array();
			$query->free_result();
			return $rows;
		}
		
		public function getOrderStatus()
		{
			$sql = "SELECT * FROM order_status ORDER BY os_id ASC";
			$query = $this->db->query($sql);
			$rows =  $query->result_array();
			$query->free_result();
			return $rows;
		}
	}
?>