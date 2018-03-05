<?php

class Restaurant_cat_Model extends CI_Model{

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->tb_restaurant="restaurant";
        $this->tb_restaurant_category_link="restaurant_category_link";
        $this->tb_category="category";
        $this->tb_food_category_link="food_category_link";

        $this->JoinTable="category";
        $this->innerJoin="restaurant.ca_id=category.ca_id";


        $this->join_link_restautant=" restaurant_category_link.rcl_r_id= restaurant.r_id";
        $this->join_link_category=" category.ca_id= restaurant_category_link.rcl_ca_id ";
        $this->join_link_food="food_category_link.ca_id=category.ca_id";

    }
    function escapeString($val) {
        $db = get_instance()->db->conn_id;
        $val = mysqli_real_escape_string($db, $val);
        return $val;
    }

    public  function list_restaurant_cat($data){

        $q=$this->escapeString($data);
        $this->db->select('*');
        $this->db->from($this->tb_category);
        $this->db->join($this->JoinTable,$this->innerJoin);
        // $this->db->join('restaurant_operation', 'restaurant_operation.r_id = restaurant.r_id');
        $this->db->where('category.ca_id', $q);
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

    public function list_category_by_restaurant($ca_id){
        $q=$this->escapeString($ca_id);
        $this->db->select("*");
        $this->db->from($this->tb_restaurant);
        $this->db->join($this->tb_restaurant_category_link, $this->join_link_restautant);
        $this->db->join($this->tb_category,$this->join_link_category);
        //$this->db->join($this->tb_food_category_link,$this->join_link_food);
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
    public function list_food_by_ca($ca_id){
        $q=$this->escapeString($ca_id);
        $this->db->select("*");
        $this->db->from($this->tb_restaurant);
        $this->db->join($this->tb_restaurant_category_link, $this->join_link_restautant);
        $this->db->join($this->tb_category,$this->join_link_category);
        $this->db->join($this->tb_food_category_link,$this->join_link_food);
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
}