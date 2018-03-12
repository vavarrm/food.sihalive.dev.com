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
        $this->load->Model('User_Position_Model','position');
        $this->load->helper('url');
    }
    public function doInsert(){

        $data = array(
            'p_id' => $this->input->post('o_position_id'),
            'p_description' => $this->input->post('desc'),
            'u_id' => $this->input->post('u_id'),
        );
        $result=$this->position->insert($data);
        if($result){
            redirect('/profile');
        }


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