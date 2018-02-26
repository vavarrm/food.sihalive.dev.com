<?php

class Restaurant_Model extends CI_Model{

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }
    public  function getList()
	{
			$where =" WHERE 1=1 ";
			$order="";
			$gitignore = array(
				'limit',
				'p',
				'order'
			);
			$limit = sprintf(" LIMIT %d, %d",abs($ary['p']-1)*$ary['limit'],$ary['limit']);
			if(is_array($ary))
			{
				foreach($ary as $key =>$row)
				{
				
					if(in_array($key, $gitignore) || $row['value']==='' )	
					{
						continue;
					}

					
					if($key =="start_time" || $key=="end_time"  )
					{
						// echo $key;
						if($row['value']!='')
						{
							if($row['logic'] =="")
							{
								$logic =" AND "; 
							}else{
								$logic = $row['logic'];
							}
							$where .=sprintf(" %s DATE_FORMAT(`ua_add_datetime`, '%s') %s ?",$logic  ,'%Y-%m-%d', $row['operator']);					
							$bind[] = $row['value'];
						}
					}else if($row['operator'] =='in')
					{
						$where .=sprintf(" AND %s IN (%s) ", $key, $row['value']);
					}
					else{
						$where .=sprintf(" AND %s %s ?", $key, $row['operator']);					
						$bind[] = $row['value'];
					}
				}
			}
			
			if(is_array($ary['order']) && !empty($ary['order']))
			{
				$order =" ORDER BY ";
				foreach($ary['order'] AS $key =>$value)
				{
					$order_ary[]=sprintf( '%s %s ', $key, $value);
				}
				$order.=join(',',$order_ary);
			}
			
			$sql = "SELECT
						u.u_account,
						CASE
							WHEN  ua_status = 'noAllowed' THEN '拒绝'
							WHEN  ua_status = 'audit' THEN '审核中'
							WHEN  ua_status = 'payment' THEN '已出款'
							WHEN  ua_status = 'recorded' THEN '已入帐'
						END AS 	ua_status_show,
						ua.*,
						ad.*,
						ub.*,
						bi.*,
						uat.*,
						uro.*,
						(
							SELECT COUNT(*) 
							FROM  
								user_account 
							WHERE 
								ua_u_id = ua.ua_u_id  AND 
								DATE_FORMAT(NOW(),'%Y-%m-%d') =  DATE_FORMAT(ua_upd_date,'%Y-%m-%d') 
								AND ua_status = 'payment'
						) AS today_payment_number,
						(
							SELECT IFNULL(SUM(ua_value),0) 
							FROM  
								user_account 
							WHERE 
								ua_u_id = ua.ua_u_id  AND 
								DATE_FORMAT(NOW(),'%Y-%m-%d') =  DATE_FORMAT(ua_upd_date,'%Y-%m-%d') 
								AND ua_status = 'payment'
						) AS today_payment_value,
						CASE
							WHEN  ua_status = 'payment' THEN '1'
							WHEN  ua_status = 'stopPayment' THEN '1'
							ELSE '0'
						END AS 	withdrawal_disabled ,
						CASE
							WHEN  ua_status = 'audit' THEN '0'
							ELSE '1'
						END AS 	change_status_disabled 
					FROM 
						user_account AS ua 
							INNER JOIN user AS u  ON ua.ua_u_id = u.u_id
							LEFT JOIN admin AS ad  ON ua.ua_aduit_ad_id = ad.ad_id
							LEFT JOIN user_bank_info AS ub ON ub.ub_id = ua_ub_id
							LEFT JOIN bank_info AS bi ON ub.ub_bank_id = bi_id
							LEFT JOIN user_account_type AS uat ON ua.ua_type = uat.uat_id
							LEFT JOIN user_recharge_order AS uro ON ua.	ua_uro_id = uro.uro_id
					";
			$search_sql = $sql.$where.$order.$limit ;
			$query = $this->db->query($search_sql, $bind);
			$rows = $query->result_array();
			
			$total_sql = sprintf("SELECT COUNT(*) AS total FROM(%s) AS t",$sql.$where) ;
			$query = $this->db->query($total_sql, $bind);
			$row = $query->row_array();
			
			$query->free_result();
			$output['list'] = $rows;
			$output['pageinfo']  = array(
				'total'	=>$row['total'],
				'pages'	=>ceil($row['total']/$ary['limit'])
			);
			$error = $this->db->error();
			if($error['message'] !="")
			{
				$MyException = new MyException();
				$array = array(
					'message' 	=>$error['message'] ,
					'type' 		=>'db' ,
					'status'	=>'001'
				);
				
				$MyException->setParams($array);
				throw  $MyException;
			}
			return $output;

    }

}