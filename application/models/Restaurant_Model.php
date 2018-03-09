<?php

class Restaurant_Model extends CI_Model{

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->table="restaurant";
        $this->JoinTable="";

    }
	
	public function getRowById($r_id)
	{
		$output = array();
		try
		{
			$sql="SELECT * FROM restaurant WHERE r_id =?";
			$bind = array($r_id);
			$query =$this->db->query($sql, $bind); 
			$error = $this->db->error();
			if($error['message'] !="")
			{

				$MyException = new MyException();
				$array = array(
					'el_system_error' 	=>$error['message'] ,
					'status'	=>'000'
				);
				
				$MyException->setParams($array);
				throw $MyException;
			}
			$row=$query->row_array();
			$output['info'] = $row;
			
			$sql ="SELECT * FROM restaurant_operation WHERE r_id =?";
			$bind = array($r_id);
			$query =$this->db->query($sql, $bind); 
			$error = $this->db->error();
			if($error['message'] !="")
			{

				$MyException = new MyException();
				$array = array(
					'el_system_error' 	=>$error['message'] ,
					'status'	=>'000'
				);
				
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$rows=$query->result_array();
			$output['operation'] = $rows;
			
			$query->free_result();
            return $output;
			
		}catch(MyException $e)
		{
			throw $e;
		}
		
	}
	
	public function update($ary)
	{
		$output= array(
			'affected_rows'	=>0
		);
		try
		{
			$this->db->trans_begin();
			$sql =" UPDATE restaurant SET 
						r_name = ?,
						r_name_en= ?,
						r_description= ?,
						r_description_en= ?,
						r_lat= ?,
						r_lng= ?,
						r_address= ?
					WHERE r_id = ?
					";
			$bind=array(
				$ary['r_name'],
				$ary['r_name_en'],
				$ary['r_description'],
				$ary['r_description_en'],
				$ary['lat'],
				$ary['lng'],
				$ary['r_address'],
				$ary['r_id']
			);
			$this->db->query($sql, $bind); 
			$error = $this->db->error();
			if($error['message'] !="")
			{

				$MyException = new MyException();
				$array = array(
					'el_system_error' 	=>$error['message'] ,
					'status'	=>'000'
				);
				
				$MyException->setParams($array);
				throw $MyException;
			}
			$output['affected_rows'] += $this->db->affected_rows();
			
			$sql ="DELETE FROM restaurant_operation WHERE r_id =?";
			$bind = array(
				$ary['r_id']
			);
			$this->db->query($sql, $bind); 
			$error = $this->db->error();
			if($error['message'] !="")
			{

				$MyException = new MyException();
				$array = array(
					'el_system_error' 	=>$error['message'] ,
					'status'	=>'000'
				);
				
				$MyException->setParams($array);
				throw $MyException;
			}
			
			if(count($ary['operation_day']) >0)
			{
				foreach($ary['operation_day'] as $key =>$value)
				{
					$bind =array(
						$value,
						$ary['start'][$key],
						$ary['end'][$key],
						$ary['r_id']
					);
					$sql =" INSERT INTO restaurant_operation(ro_open_day,ro_open_time_start,ro_open_time_end,r_id)
							VALUES(?,?,?,?)";
					$this->db->query($sql, $bind); 
					$error = $this->db->error();
					if($error['message'] !="")
					{

						$MyException = new MyException();
						$array = array(
							'el_system_error' 	=>$error['message'] ,
							'status'	=>'000'
						);
						
						$MyException->setParams($array);
						throw $MyException;
					}
					$output['affected_rows'] += $this->db->affected_rows();
				}
			}
			
			
			$this->db->trans_commit();
			return $output;
		}catch(MyException $e)
		{
			$this->db->trans_rollback();
			throw $e;
		}	
	}
	
    public  function getList($ary =array())
	{
		try
		{
			if(empty($ary))
			{
				$MyException = new MyException();
				$array = array(
					'message' 	=>$error['message'] ,
					'status'	=>'000'
				);
				
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$fields = join(',' ,$ary['fields']);
			
			$sql ="	SELECT r_id AS id," 
					.$fields.	
					" FROM
						 restaurant";
			$ary['sql'] =$sql;
			$output = $this->getListFromat($ary);
			return 	$output  ;
		}catch(MyException $e)
		{
			throw $e;
		}
    }
	
	public function getRestaurantCategory($ary =array())
	{
		try
		{
			if(empty($ary))
			{
				$MyException = new MyException();
				$array = array(
					'message' 	=>$error['message'] ,
					'status'	=>'000'
				);
				
				$MyException->setParams($array);
				throw $MyException;
			}
			$sql = "SELECT 
						ca_id,
						ca_name,
						ca_name_en
					FROM category
					WHERE ca_r_id=?";
			$bind=array(
				$ary['r_id']
			);
			$query = $this->db->query($sql, $bind); 
			$error = $this->db->error();
			if($error['message'] !="")
			{
				
				$MyException = new MyException();
				$array = array(
					'el_system_error' 	=>$error['message'] ,
					'status'	=>'000'
				);
				
				$MyException->setParams($array);
				throw $MyException;
			}
			$rows = $query->result_array();
			return 	$rows  ;
		}catch(MyException $e)
		{
			throw $e;
		}
	}
	
	public function getFoodList($ary =array())
	{
		try
		{
			if(empty($ary))
			{
				$MyException = new MyException();
				$array = array(
					'message' 	=>$error['message'] ,
					'status'	=>'000'
				);
				
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$fields = join(',' ,$ary['fields']);
			
			$sql ="	SELECT f.f_id AS id," 
					.$fields.	
					" FROM
						restaurant As r 
							INNER JOIN food AS f ON f.f_r_id = r.r_id
							LEFT JOIN category AS ca on ca.ca_r_id = r.r_id  AND f.f_ca_id = ca.ca_id
							";
			$ary['sql'] =$sql;
			$output = $this->getListFromat($ary);
			return 	$output  ;
		}catch(MyException $e)
		{
			throw $e;
		}
	}
	
	public function del($id)
	{
		try
		{
			$bind = array(
				$id
			);
			$sql="DELETE FROM restaurant WHERE r_id=?";
			$this->db->query($sql, $bind); 
			$error = $this->db->error();
			if($error['message'] !="")
			{

				$MyException = new MyException();
				$array = array(
					'el_system_error' 	=>$error['message'] ,
					'status'	=>'000'
				);
				
				$MyException->setParams($array);
				throw $MyException;
			}
		}catch(MyException $e){
			throw $e;
		}
    }
	
    public function escapeString($val) {
        $db = get_instance()->db->conn_id;
        $val = mysqli_real_escape_string($db, $val);
        return $val;
    }
	
    public function Restaurant(){
        $sql="SELECT * FROM `restaurant` ORDER BY r_id";
        $query = $this->db->query($sql, $bind);
        $rows  =  $query->result_array();
        $query->free_result();
        return $rows;


    }

    public function  getRestaurant_byId($data){
        $q=$this->escapeString($data);
        $this->db->select('*');
        $this->db->from($this->table);
        $this->db->where('restaurant.r_id', $q);
        $query = $this->db->get();

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

	public function insert($ary)
	{
		$output= array(
			'affected_rows'	=>0
		);
		try
		{
			$this->db->trans_begin();
			$sql =" INSERT INTO restaurant (
						r_name,
						r_name_en,
						r_description,
						r_description_en,
						r_lat,
						r_lng,
						r_address
					)
					VALUES(?,?,?,?,?,?,?)";
			$bind=array(
				$ary['r_name'],
				$ary['r_name_en'],
				$ary['r_description'],
				$ary['r_description_en'],
				$ary['lat'],
				$ary['lng'],
				$ary['r_address'],
			);
			$this->db->query($sql, $bind); 
			$error = $this->db->error();
			if($error['message'] !="")
			{

				$MyException = new MyException();
				$array = array(
					'el_system_error' 	=>$error['message'] ,
					'status'	=>'000'
				);
				
				$MyException->setParams($array);
				throw $MyException;
			}
			$output['affected_rows'] += $this->db->affected_rows();
			$insert_id = $this->db->insert_id();
			
			if(count($ary['operation_day']) >0)
			{
				foreach($ary['operation_day'] as $key =>$value)
				{
					$bind =array(
						$value,
						$ary['start'][$key],
						$ary['end'][$key],
						$insert_id
					);
					$sql =" INSERT INTO restaurant_operation(ro_open_day,ro_open_time_start,ro_open_time_end,r_id)
							VALUES(?,?,?,?)";
					$this->db->query($sql, $bind); 
					$error = $this->db->error();
					if($error['message'] !="")
					{

						$MyException = new MyException();
						$array = array(
							'el_system_error' 	=>$error['message'] ,
							'status'	=>'000'
						);
						
						$MyException->setParams($array);
						throw $MyException;
					}
				}
			}
			
			$this->db->trans_commit();
			return $output;
		}catch(MyException $e)
		{
			$this->db->trans_rollback();
			throw $e;
		}	
	}
	
    public function  get_operation($data){
        // $q=$this->escapeString($data);
        // $this->db->select('*');
        // $this->db->from('restaurant_operation');

        // $this->db->where('r_id', $q);
        // $query = $this->db->get();

        // $rows=$query->result_array();
        // if(count($rows))
        // {
            // $query->free_result();
            // return $rows;
        // }
        // else
        // {
            // return FALSE;
        // }


    }



    public function search_Res($data){
        $q=$this->escapeString($data);

        $this->db->select('*');
        $this->db->like('r_id',$q);
        $this->db->or_like('r_name',$q);
        $query=$this->db->get($this->table);
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