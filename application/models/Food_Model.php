<?php
	class Food_Model extends CI_Model 
	{
		function __construct()
		{
			
			parent::__construct();
			$this->load->database();
            $this->table="food";
            $this->JoinTable="restaurant";
            $this->innerJoin="restaurant.r_id=food.r_id";

		}


        function escapeString($val) {
            $db = get_instance()->db->conn_id;
            $val = mysqli_real_escape_string($db, $val);
            return $val;
        }

		public function getSetList($f_id)
		{
			$sql="	SELECT 
						f.f_id, 
						f.f_name setName,
						f.f_large_price,
						fs.fs_child_f_id , 
						f2.f_name , 
						ca.ca_name, 
						fs.fs_group_id 
					FROM `food` AS f 
						INNER JOIN food_set AS fs ON f.`f_id`  = fs.fs_parent_f_id
						INNER JOIN food AS f2 ON f2.f_id = fs.fs_child_f_id
						INNER JOIN category AS ca ON ca.ca_id = f2.ca_id
					WHERE f.f_id = ?
					ORDER BY fs.fs_group_id ASC , fs.fs_child_f_id  ASC";
			$bind = array($f_id);
			$query = $this->db->query($sql, $bind);
			$row =  $query->result_array();
			$query->free_result();
			return $row;
		}
		
		public function getLastOid()
		{
			$sql = 'SELECT 
						o_id 
					FROM 
						order_list 
					ORDER BY o_id DESC';
			$query = $this->db->query($sql, $bind);
			$row =  $query->row_array();
			$query->free_result();
			return $row;
		}


        public function inserdOrder($ary = array())
        {
            $output = array();
           // $this->db->trans_start();
            $row = $this->getLastOid();
            if(empty($row))
            {
                $row['o_id'] = date('Ymd').sprintf('%06d',1);
            }else
            {
                $row['o_id']+=1;
            }

            $sql="INSERT INTO order_list (o_id,u_id,o_messge,p_id) VALUES(?,?, ?, ?)";
            $bind = array(
                $row['o_id'],
                $ary['u_id'],
                $ary['o_message'],
                $ary['o_position_id'],
            );
            $query = $this->db->query($sql,$bind);


            $in_f_id = array();
            if(!empty($ary['order_list']))
            {
                $index =0;
                $total_sql="";
                foreach($ary['order_list'] as  $key => $value )
                {
                    if($value['is_set']==1)
                    {
                        if(!empty($value['set_include']))
                        {

                            foreach($value['set_include'] as $include)
                            {
                                $index++;
                                $sql ="SELECT * FROM food WHERE f_id =?";
                                $bind = array( $include['f_id']);
                                $query = $this->db->query($sql, $bind);
                                $temp =  $query->row_array();
                                $query->free_result();
                                $sql ="INSERT INTO order_detail(o_id, od_item_index,f_id, od_num, od_price,od_is_set)
									   VALUES(?, ?, ?, ?, ?,'1')";
                                $insert = array(
                                    $row['o_id'] ,
                                    $index,
                                    $temp['f_id'],
                                    $value['order_num'],
                                    $temp['f_large_price']
                                );
                                $query = $this->db->query($sql, $insert);
                            }
                            $total_sql[] =sprintf("SELECT	f_large_price*f_discount AS price FROM food WHERE f_id = %s", $value['f_id']);
                        }
                    }else
                    {
                        $index++;
                        $sql ="SELECT * FROM food WHERE f_id =?";
                        $bind = array($value['f_id']);
                        $query = $this->db->query($sql, $bind);
                        $temp =  $query->row_array();
                        $query->free_result();
                        $total_sql = array();
                        $sql ="INSERT INTO order_detail(o_id, od_item_index, f_id, od_num, od_price)
							   VALUES(?,?,?,?,?)";
                        $insert = array(
                            $row['o_id'] ,
                            $index,
                            $temp['f_id'],
                            $value['order_num'],
                            $temp['f_large_price']
                        );
                        $query = $this->db->query($sql, $insert);
                        $total_sql[] =sprintf("SELECT	f_large_price AS price FROM food WHERE f_id = %s", $temp['f_id']);

                    }
                }
            }

            $total_sql =  "SELECT SUM(price) as total FROM (".join(' UNION ALL ' , $total_sql).") AS t1";
            $query = $this->db->query($total_sql);
            $temp =  $query->row_array();
            $query->free_result();

            $sql = "UPDATE order_list SET o_total =? WHERE o_id =?";
            $bind = array(
                $temp['total'],
                $row['o_id']
            );
            $query = $this->db->query($sql , $bind);

            $this->db->trans_complete();
            if ($this->db->trans_status()===  FALSE)
            {

            }
        }



	
		public function getProductForFid($f_id)
		{
			$sql="	SELECT * 
					FROM food AS f LEFT JOIN category AS ca ON f.ca_id = ca.ca_id
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
			$where_str =" 1 = 1  AND f_status='sale_on'";
			if(!empty($where) )
			{
				foreach($where as $key =>$vale)
				{
					$where_str.=sprintf(" AND %s = ?", $key);
					$bind[] = $value;
				}
			}
			// $sql ="	SELECT * 
					// FROM `food` AS f
						// LEFT JOIN `category` AS ca ON f.ca_id = ca.ca_id
					// WHERE ".$where_str."
					// ORDER BY f.f_id DESC";
			// $query = $this->db->query($sql, $bind);
			//echo $this->db->last_query();
			// $rows  =  $query->result_array();
			// $query->free_result();
			return $rows;
		}

		function foodList_By_RestaurantId($userId){
		    $data=$this->escapeString($userId);

            $this->db->select('*');
            $this->db->from($this->table);
            $this->db->join($this->JoinTable,$this->innerJoin);
            $this->db->join("food_category_link","food_category_link.f_id=food.f_id");
            $this->db->where('restaurant.r_id', $data);
            $query=$this->db->get();
            $rows=$query->result_array();
            if(count($rows))
            {
                $query->free_result();
                return $rows;
            }
            else
            {
                return FALSE;
            }


        }

	}
?>