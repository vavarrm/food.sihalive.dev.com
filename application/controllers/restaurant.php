<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2/16/18
 * Time: 1:28 PM
 */
class restaurant extends CI_Controller{

    public function __construct()
    {
        parent::__construct();

    }
    public function index(){
        $this->smarty->displayFrame('Restaurant/index.tpl');
    }
    public function id($res){
        echo $res;

    }


}