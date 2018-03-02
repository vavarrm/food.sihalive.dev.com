<?php

class Restaurant_cat_Model extends CI_Model{

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->table="restaurant";
        $this->JoinTable="category";
        $this->innerJoin="restaurant.ca_id=category.ca_id";
    }
    function escapeString($val) {
        $db = get_instance()->db->conn_id;
        $val = mysqli_real_escape_string($db, $val);
        return $val;
    }

    public  function list_restaurant_cat($data){

        // $q=$this->escapeString($data);
        // $this->db->select('*');
        // $this->db->from($this->table);
        // $this->db->join($this->JoinTable,$this->innerJoin);
        // $this->db->join('restaurant_operation', 'restaurant_operation.r_id = restaurant.r_id');
        // $this->db->where('category.ca_id', $q);
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

}