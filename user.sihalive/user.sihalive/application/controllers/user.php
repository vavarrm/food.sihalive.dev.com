<?php

  defined('BASEPATH') OR exit('No direct script access allowed');

 class user extends My_Controller
 {

   public function __construct() {

     parent::__construct();
  

    }



  public function index(){
    $this->load->view('login');
  }
  public function login(){
    $this->load->view('login');
  }

 }



 ?>
