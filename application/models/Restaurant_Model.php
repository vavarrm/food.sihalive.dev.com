<?php

class Restaurant_Model extends CI_Model{

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->table="restaurant";
        $this->JoinTable="";

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
			
			$sql ="	SELECT " 
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
    function escapeString($val) {
        $db = get_instance()->db->conn_id;
        $val = mysqli_real_escape_string($db, $val);
        return $val;
    }
    function Restaurant(){
        $sql="SELECT * FROM `restaurant` ORDER BY r_id";
        $query = $this->db->query($sql, $bind);
        $rows  =  $query->result_array();
        $query->free_result();
        return $rows;


    }

    function  getRestaurant_byId($data){
        $q=$this->escapeString($data);
        $this->db->select('*');
        $this->db->from($this->table);
       // $this->db->join('restaurant_operation', 'restaurant_operation.r_id = restaurant.r_id');
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

    function  get_operation($data){
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



    function search_Res($data){
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