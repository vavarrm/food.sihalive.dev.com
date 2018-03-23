
<style>
	.ac-wrapper {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background:transparent;
		z-index: 1001;
	}
	.popup {
		width: 100%;
		height: 100%;

		box-shadow: #64686e 0px 0px 3px 3px;
		-moz-box-shadow: #64686e 0px 0px 3px 3px;
		-webkit-box-shadow: #64686e 0px 0px 3px 3px;
		position: fixed;margin: 0px;
		padding: 0px;


	}
	.intl-tel-input {
		margin: 10px;
		font-size: 14px;
		font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
		color: #333;
		height: 40px!important;
		padding: 5px;
	}
	.intl-tel-input input {
		width: 100%;
		border: 1px solid #CCC;
		font-family: inherit;
		font-size: 100%;
		color: inherit;
		height: 40px!important;
		padding: 5px;
	}
	main{
		min-height: 800px;
	}
	.tab-pane{
		margin-top: 20px!important;
	}
</style>
<link rel="stylesheet" href="https://www.jqueryscript.net/demo/jQuery-International-Telephone-Input-With-Flags-Dial-Codes/build/css/intlTelInput.css">
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<main class="page-content this-white" ng-controller="userCtrl" ng-init="init()"  >

	<!-- Breadcrumbs & Page title-->
	<{include file="Frontend/breadcrumbs.tpl"}>
	<section class="bg-white container this-margin-top this-margin-button " style="padding: 0px; color:
	white!important; font-size: 14px; ">

				<div class="">
				<ul class="nav nav-tabs" style="background:#f16121; border: none; padding: 0px">
					<li class="active"><a data-toggle="tab" href="#order_list"><span class="glyphicon glyphicon-book"></span>
							<{$mainpage_language_ary.Order}> </a></li>

					<li ><a data-toggle="tab" href="#home"><span class="glyphicon glyphicon-user"></span>
							<{$mainpage_language_ary.Profile}></a></li>
					<li><a data-toggle="tab" href="#address"><span class="glyphicon glyphicon-map-marker"></span>
							<{$mainpage_language_ary.Address}></a></li>
				</ul>
				<div class="tab-content this-border this-padding-top this-padding " style="border: none!important; margin-bottom: 50px">
					<div id="home" class="tab-pane this-animate-right " style="margin-top: 20px" >
						<div class="c">
							<div class=" this-white" style="border: none">
								<div class="row">
										<form method="post"  class="form-horizontal this-left-align">


													<div class="col-xs-12 col-sm-6 col-md-6">
														<labe><{$mainpage_language_ary.First_name}> :</labe>
														<input id="o_fname" ng-model="u_fname"  type="text"
															   placeholder="<{$userLanguageAry.user_delivery_phone}>"
															   name="u_fname"   data-constraints="@Required"
															   class="form-control">
													</div>

													<div class=" col-xs-12 col-sm-6 col-md-6">
														<label><{$mainpage_language_ary.Last_name}> :</label>
														<input id="o_lname" ng-model="u_lname" type="text"
															   placeholder="<{$mainpage_language_ary.Last_name}>"
															   name="u_lname" data-constraints="@Required"
															   class="form-control">
													</div>

													<div class="col-xs-12 col-sm-6 col-md-6">
														<label><{$mainpage_language_ary.Phone}> : </label>
														<input id="o_phone" ng-model="u_phone"  type="text"
															   placeholder="<{$mainpage_language_ary.Phone}>"
															   name="u_phone" data-constraints="@Required"
															   class="form-control ">
													</div>

													<div class="col-xs-12 col-sm-6 col-md-6">
														<label><{$mainpage_language_ary.Email}> : </label>
														<input id="o_email" ng-model="u_email" type="text"
															   placeholder="<{$mainpage_language_ary.Email}>"
															   name="u_email" data-constraints="@Required"
															   class="form-control">
													</div>

													<div class="col-xs-12 col-sm-6 col-md-6">
														<label><{$mainpage_language_ary.Password}> :</label>
														<input id="o_password" ng-model="u_pwd"  type="text"
															   placeholder="<{$mainpage_language_ary.Password}>"
															   name="u_password"   data-constraints="@Required"
															   class="form-control">
													</div>
													<div class=" col-xs-12 col-sm-6 col-md-6">
														<label><{$mainpage_language_ary.Confirm_Password}></label>
														<input id="o_c_password" ng-model="u_confpwd" type="text"
															   placeholder="<{$mainpage_language_ary.Confirm_Password}>"
															   name="u_confpwd" data-constraints="@Required"
															   class="form-control  ">
													</div>

												<div class="col-xs-12 col-sm-12 col-md-12 this-margin-top ">
															<button ng-click="setProfile();$event.preventDefault();"
																	class="this-btn this-btn-this" style="width:
																100px"><{$language.from_button_sumbit}></button>

												</div>

										</form>

								</div>
							</div>
						</div>
					</div>
					<div id="order_list" class="tab-pane this-animate-right this-left-align in active " style="padding: 0px;" >
						<div class="well this-white " style="border: none; padding: 0px">

							<div class="this-container"  >
								<div class="row">

									<div class="col-sm-12" style="padding: 0px" >
										<div class="table-responsive" style="padding: 0px" ng-controller="orderCtrl" ng-init="orderList()"  >
											<table id="tb_order" class="table table-striped table-bordered"
												   cellspacing="0" width="100%"  >

												<thead>
												<tr class="this-border">
													<td class="this-hide-small"><{$mainpage_language_ary.Order_ID}></td>
													<td><{$mainpage_language_ary.Date_Time}></td>
													<td  class="this-hide-small"><{$mainpage_language_ary.Discount}></td>
													<td><{$mainpage_language_ary.Total}></td>
													<td><{$mainpage_language_ary.Status}></td>
												</tr>
												</thead

												<tbody >

												<tr  ng-repeat="row in data.orders" >
													<td  class="this-hide-small">{{row.o_id}}</td>
													<td>{{row.add_datetime}}</td>
													<td  class="this-hide-small">{{row.o_discount}}</td>
													<td>{{row.o_total}}</td>

													<td>
														<span class="badge this-green"> {{row.o_status}}</span>
														<a href="/user/inv/{{row.o_id}}"> <span class="badge
																this-orange
																this-text-white " >View</span>
														</a>
													</td>
												</tr>

												</tbody>



											</table>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
					<div id="address" class="tab-pane this-animate-right this-left-align">
							<div class="well this-white  " style="border: none">

								<div class="this-container" style="padding: 0px">
									<div class="row">
										<div class="col-sm-12" style="padding: 0px">
											<div class="col-sm-12" style="padding: 0px; margin-bottom: 20px">
												<span class="this-btn
											this-btn-this" style="margin-top: 5px" id="show_add" >
													<{$mainpage_language_ary.Add_Address}>
													</span>
											</div>
											<form  class="form" style="text-align: left" id="frm_add" action="/User_Position/doInsert" method="post" >
												<input type="text" id="o_consignee" ng-model="u_id" name="u_id" value="1" style="display: none" required>
												<div class="form-group ">
													<div class="col-sm-4" style="padding: 0px">
														<label for="p_name"><{$mainpage_language_ary.Address_Name}>:</label>
														<select  id="o_position_id" data-constraints="@Required"  name="o_position_id" class="form-control form-control-has-validation form-control-last-child input-sm" style="padding: 2px; padding-left: 10px">
															<option value="0">請選擇</option>
															<{foreach from=$location item=row key=index}>
															<option value="<{$row.p_id}>"><{$row.p_title}> </option>
															<{/foreach}>
														</select>
														<a href="/user/maps">
															<span onclics="openLocation()"  class="this-btn
														this-btn-this" style="margin-top: 5px" ><{$mainpage_language_ary.google_map}> </span>
														</a>
													</div>
													<div class="col-sm-7" style="padding: 0px">
														<label for="p_desc"><{$mainpage_language_ary.Plcese_Description}> :</label>
														<input class="form-control" name="desc"/>
													</div>
													<div class="col-sm-1" style="padding: 0px">
														<button type="submit"class="this-btn this-btn-this"
																style="height: 35px; padding: 2px; width: 100px;
																margin-top: 30px;"><{$mainpage_language_ary.Save}></button>
													</div>
												</div>
												<div id='response'></div>
											</form>
											<div class="col-sm-12" style="margin-top: 20px; padding: 0px;" ng-controller="userAddressCtrl" ng-init="address_()" >
												<table id="tb_order" class="table table-striped table-bordered"
													   cellspacing="0" >
													<thead>
													<tr class="this-border">

														<td><{$mainpage_language_ary.Title}></td>
														<td><{$mainpage_language_ary.Description}></td>
														<td></td>

													</tr>
													</thead

													<tbody class="this-border" >


										<tr class="this-border" ng-repeat="row in data.book_address" >
											<td>{{row.u_p_b_titel}}</td>
											<td>{{row.description}} </td>
											<td style="width: 40px" ng-click="del({{row.p_bookId}})">
												<a >
													<span class="icon icon-sm icon-primary fa fa-trash-o"></span>
												</a>

											</td>
													</tr>

													</tbody>



												</table>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>

				</div>
			</div>

	</section>


</main>

<script>
    function openLocation() {
        $('#this_map').removeClass('this-hide');
    }
    function PopUp(){
        $('#this_map').addClass('this-hide');
    }

</script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" />
<script >
   // $.noConflict();
  //  jQuery( document ).ready(function( $ ) {
   //     $('#tb_order').DataTable();
   // });
   // $.noConflict();
    jQuery( document ).ready(function( $ ) {
        $('#frm_add').hide();
        $('#show_add').click(function () {
            $('#frm_add').slideToggle();
        });

    });
</script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://www.jqueryscript.net/demo/jQuery-International-Telephone-Input-With-Flags-Dial-Codes/build/js/intlTelInput.js"></script>

<script>
   // $("#o_phone").intlTelInput();
    $("#o_phone").intlTelInput("selectCountry", "kh");

</script>