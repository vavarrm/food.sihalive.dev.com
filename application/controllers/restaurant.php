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
        $this->shopcart_language_ary = $this->language->load('shopcart');
        $this->load->model('Restaurant_Model', 'restaurant');
        $this->load->model('Food_Model', 'food');
        $this->load->model('Restaurant_cat_Model', 'cat');
    }

    public function index(){
        $this->smarty->assign(array(
            'shopLanguageAry'	=>$this->shopcart_language_ary,
        ));
        $this->smarty->displayFrame('Restaurant/index.tpl');
    }


    public function id($x){
        $foodList = $this->food->foodList_By_RestaurantId($x);
        $shopId = $this->restaurant->getRestaurant_byId($x);
        $operation=$this->restaurant->get_operation($x);
        $list_category_by_restaurant=$this->cat->list_category_by_restaurant($x);

        $this->smarty->assign(array(
            'r_id'      =>$x,
            'shopId'	=>$shopId,
            'operation'      =>$operation,
            'foodList'=>$foodList,
            'list_category_by_restaurant'=>$list_category_by_restaurant,
            'shopLanguageAry'	=>$this->shopcart_language_ary,
        ));
         if($shopId >0){
             $this->smarty->displayFrame('Restaurant/index.tpl');
         }else {
             $this->output->set_status_header('404');
             $this->load->view('404');
         }
    }
    function listShop(){

        $shop = $this->restaurant->Restaurant();
        $this->smarty->assign(array(
            'shop'	=>$shop,

        ));
    }
     function list_category(){
        

     }


}