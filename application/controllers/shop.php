<?php

class Shop extends  CI_Controller{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Restaurant_Model', 'restaurant');
        $this->load->model('Restaurant_cat_Model', 'cat');
    }

    function Id($x){
        $shop = $this->restaurant->Restaurant();
        $group=$this->restaurant->restaurant_group();
        $shopId = $this->cat->list_restaurant_cat($x);
        $operation=$this->restaurant->get_operation($x);
        $this->smarty->assign(
            array(
                'mainpage_language_ary'	=>$this->mainpage_language_ary,
                'shop'	    =>$shop,
                'group'     =>$group,
                'shopId'	=>$shopId,
                'operation' =>$operation
            )
             );
        //var_dump($shopId);
        $this->smarty->displayFrame('Restaurant/shop_category.tpl');
    }

}