<?php

class search extends CI_Controller{
    function __construct()
    {
        parent::__construct();
    }
    function index(){
        $this->smarty->displayFrame('Restaurant/search.tpl');
    }

}