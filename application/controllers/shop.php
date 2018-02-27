<?php

class Shop extends  CI_Controller{

    public function __construct()
    {
        parent::__construct();
    }
    function index(){
        echo 'list category';
    }
    function Id($x){


        $this->smarty->displayFrame('Restaurant/shop_category.tpl');
    }

}