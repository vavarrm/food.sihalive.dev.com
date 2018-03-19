<?php
/**
 * CodeIgniter
 *
 * An open source application development framework for PHP
 *
 * This content is released under the MIT License (MIT)
 *
 * Copyright (c) 2014 - 2016, British Columbia Institute of Technology
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * @package	CodeIgniter
 * @author	EllisLab Dev Team
 * @copyright	Copyright (c) 2008 - 2014, EllisLab, Inc. (https://ellislab.com/)
 * @copyright	Copyright (c) 2014 - 2016, British Columbia Institute of Technology (http://bcit.ca/)
 * @license	http://opensource.org/licenses/MIT	MIT License
 * @link	https://codeigniter.com
 * @since	Version 1.0.0
 * @filesource
 */
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Model Class
 *
 * @package		CodeIgniter
 * @subpackage	Libraries
 * @category	Libraries
 * @author		EllisLab Dev Team
 * @link		https://codeigniter.com/user_guide/libraries/config.html
 */
class CI_Model {

	/**
	 * Class constructor
	 *
	 * @return	void
	 */
	public function __construct()
	{
		log_message('info', 'Model Class Initialized');
	}

	// --------------------------------------------------------------------

	/**
	 * __get magic
	 *
	 * Allows models to access CI's loaded classes using the same
	 * syntax as controllers.
	 *
	 * @param	string	$key
	 */
	public function __get($key)
	{
		// Debugging note:
		//	If you're here because you're getting an error message
		//	saying 'Undefined Property: system/core/Model.php', it's
		//	most likely a typo in your model code.
		return get_instance()->$key;
	}
	
	public function  getListFromat($ary)
	{
		try
		{	

			if($ary['limit']==0)
			{
				$MyException = new MyException();
				$array = array(
					'system_error' 	=>'limit zero',
					'status'	=>'000'
				);
				
				$MyException->setParams($array);
				throw $MyException;
			}
			
			if($ary['sql']=='')
			{
				$MyException = new MyException();
				$array = array(
					'system_error' 	=>'no setting sql',
					'status'	=>'000'
				);
				
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$where .=" WHERE 1 = 1";
			$gitignore = array(
				'limit',
				'p',
				'order',
				'sql',
				'fields'
			);
			$limit = sprintf(" LIMIT %d, %d",abs($ary['p']-1)*$ary['limit'],$ary['limit']);
			if(is_array($ary))
			{
				foreach($ary as $key => $value)
				{
					if(in_array($key, $gitignore) ||  $value['value'] ==="" )	
					{
						continue;
					}
					if($key =="start_time" || $key=="end_time"  )
					{
						if($value['value']!='')
						{
							$where .=sprintf(" AND DATE_FORMAT(`add_datetime`, '%s') %s ?", '%Y-%m-%d', $value['operator']);					
							$bind[] = $value['value'];
						}
					}elseif($value['operator'] =='like'){
							
						$where .=sprintf(" %s %s LIKE ?", $value['logic'], $key, $value['operator']);							
						$bind[] = "%".$value['value']."%";
					}
					else
					{
						$where .=sprintf(" %s %s %s ?", $value['logic'], $key, $value['operator']);					
						$bind[] = $value['value'];
					}
				}
			}
	
			if(is_array($ary['order']))
			{
				$order =" ORDER BY ";
				foreach($ary['order'] AS $key =>$value)
				{
					$order_ary[]=sprintf( ' %s %s ', $key, $value);
				}
				$order .=join(',',$order_ary);
			}
			
			
			
			$sql =$ary['sql'];
			$search_sql = $sql.$where.$order.$limit ;
			$query = $this->db->query($search_sql, $bind);
			$error = $this->db->error();
			if($error['message'] !="")
			{
				$MyException = new MyException();
				$array = array(
					'system_error' 	=>$error['message'] ,
					'status'	=>'000'
				);
				
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$rows = $query->result_array();
			
			$total_sql = sprintf("SELECT COUNT(*) AS total FROM(%s) AS t",$sql.$where) ;
			$query = $this->db->query($total_sql, $bind);
			$row = $query->row_array();
			
			$query->free_result();
			$output['list'] = $rows;
			$output['pageinfo']  = array(
				'total'	=>$row['total'],
				'pages'	=>ceil($row['total']/$ary['limit']),
				'p'		=>$ary['p'],
				'limit'	=>$ary['limit']
			);
			
			
			$error = $this->db->error();
			if($error['message'] !="")
			{
				$MyException = new MyException();
				$array = array(
					'system_error' 	=>$error['message'] ,
					'status'	=>'000'
				);
				
				$MyException->setParams($array);
				throw $MyException;
			}
			return 	$output  ;
		}catch(MyException $e)
		{
			throw $e;
		}
	}

}
