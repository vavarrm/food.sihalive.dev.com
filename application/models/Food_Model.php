<?php
	class Food_Model extends CI_Model 
	{
		function __construct()
		{
			
			parent::__construct();
			$this->load->database();
		}
		
		public function getFoodClassList()
		{
			$ary  = array(
				"母分類一"=>array(
					array(
						'sub_name'=>'子分類1',
						'sub_id'=>'1'
					),
					array(
						'sub_name'=>'子分類1',
						'sub_id'=>'1'
					),
					array(
						'sub_name'=>'子分類1',
						'sub_id'=>'1'
					)
				),
				"母分類二"=>array(
					array(
						'sub_name'=>'子分類1',
						'sub_id'=>'1'
					),
					array(
						'sub_name'=>'子分類1',
						'sub_id'=>'1'
					),
					array(
						'sub_name'=>'子分類1',
						'sub_id'=>'1'
					)
				),
				"母分類三"=>array(
				),
			);
			
			return $ary ;
		}
		
		public function getFoodList()
		{
			$ary = array(
				array(
					'food_name' 			=>'食物名称',
					'food_us_price' 		=>'1.5',
					'food_kh_price' 		=>'6000',
					'food_description'		=>'食物描述',
					'food_id' 				=>'1',
				),	
				array(
					'food_name' =>'食物名称',
					'food_us_price' 		=>'1.5',
					'food_kh_price' 		=>'6000',
					'food_description'		=>'食物描述',
					'food_id' 				=>'1',
				),	
				array(
					'food_name' =>'食物名称',
					'food_us_price' 		=>'1.5',
					'food_kh_price' 		=>'6000',
					'food_description'		=>'食物描述',
					'food_id' 				=>'1',
				),array(
					'food_name' =>'食物名称',
					'food_us_price' 		=>'1.5',
					'food_kh_price' 		=>'6000',
					'food_description'		=>'食物描述',
					'food_id' 				=>'1',
				),array(
					'food_name' =>'食物名称',
					'food_us_price' 		=>'1.5',
					'food_kh_price' 		=>'6000',
					'food_description'		=>'食物描述',
					'food_id' 				=>'1',
				),array(
					'food_name' =>'食物名称',
					'food_us_price' 		=>'1.5',
					'food_kh_price' 		=>'6000',
					'food_description'		=>'食物描述',
					'food_id' 				=>'1',
				),array(
					'food_name' =>'食物名称',
					'food_us_price' 		=>'1.5',
					'food_kh_price' 		=>'6000',
					'food_description'		=>'食物描述',
					'food_id' 				=>'1',
				),
			);
			return $ary;
		}
	}
?>