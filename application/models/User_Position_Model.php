<?php

class User_Position_Model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->table="user_position";
        $this->JoinTable="user";
        $this->InnerJoin="user.u_id=user_position.u_id";
    }

    public function index(){



    }

    public function listLocation(){

        $this->db->select("u_position_lat,u_position_lng");
        $this->db->from($this->table);
        $this->db->join($this->JoinTable,$this->InnerJoin);
        //$this->db->where('u_id',$user_id);

        $query=$this->db->get();
        if($query->num_rows() >0){
            return $query->result();

        }else{
            return false;
        }


    }

    public function insert($post)
    {
        $data=array(

            'u_position_name'=>$post['u_position_name'],
        );
        $this->db->insert($this->table,$data);
    }

    public function update($where, $data)
    {
        $this->db->update($this->table, $data, $where);
        return $this->db->affected_rows();
    }

    public function delete_by_id($id)
    {
        $this->db->where('u_position_id', $id);
        $this->db->delete($this->table);
    }



}