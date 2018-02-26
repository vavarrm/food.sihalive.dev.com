<?php

class Restaurant_Model extends CI_Model{

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }
    public  function getList($ary =array())
	{
		try
		{
			if(empty($ary))
			{
				$MyException = new MyException();
				$array = array(
					'message' 	=>$error['message'] ,
					'status'	=>'000'
				);
				
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$fields = join(',' ,$ary['fields']);
			
			$sql ="	SELECT " 
					.$fields.	
					" FROM
						 restaurant";
			$ary['sql'] =$sql;
			$output = $this->getListFromat($ary);
			return 	$output  ;
		}catch(MyException $e)
		{
			throw $e;
		}
    }

}