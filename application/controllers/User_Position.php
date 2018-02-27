<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2/9/18
 * Time: 11:20 AM
 */
class User_Position extends CI_Controller{

    public function __construct()
    {
        parent::__construct();
    }
    public function doInsert(){
        $u_position_name=null;

        extract($_POST);
        $param['u_position_name']=$u_position_name;
        $this->load->model('User_Position_Model');
        $result=$this->User_Position_Model->insert($param);


    }
    public function ajax_edit($id)
    {
        $data = $this->person->get_by_id($id);
        echo json_encode($data);
    }
    public function ajax_delete($id)
    {
        $this->person->delete_by_id($id);
        echo json_encode(array("status" => TRUE));
    }




}