
<?php
 /**
  *
  */
  defined('BASEPATH') OR exit('No direct script access allowed');
 class home_controller extends My_Controller
 {
   public function __construct() {
        $this->session();
    }

   function index(){
     $this->load->view('home');
   }


 }


 ?>
