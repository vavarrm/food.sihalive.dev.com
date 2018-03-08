
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
	main{
		min-height: 800px;
	}
	.tab-pane{
		margin-top: 20px!important;
	}
</style>

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">

<main class="page-content" ng-controller="userCtrl" ng-init="init()"  >

	<!-- Breadcrumbs & Page title-->
	<{include file="Frontend/breadcrumbs.tpl"}>
	<section class="bg-white container this-margin-top this-margin-button " style="padding: 0px; color: white!important; font-size: 14px;">

				<div class="">
				<ul class="nav nav-tabs" style="background:#f16121; border: none; padding: 0px">
					<li class="active"><a data-toggle="tab" href="#home"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
					<li><a data-toggle="tab" href="#address"><span class="glyphicon glyphicon-map-marker"></span>  Address</a></li>
					<li><a data-toggle="tab" href="#order_list"><span class="glyphicon glyphicon-book"></span>  Order </a></li>

				</ul>

				<div class="tab-content this-border this-padding-top this-padding " style="border: none!important; margin-bottom: 50px">

						<div id="home" class="tab-pane this-animate-right in active " style="margin-top: 20px">
							<div class="c">
								<div class=" this-white" style="border: none">
									<div class="row">
										<div class="col-sm-3 align-center this-center">
											<center>
												<img src="https://www.thestylease.com/images/user.png" width="150px" class="img-responsive">
											</center>
											<button class=" btn-danger">Browser
											</button>
										</div>

										<div class="col-sm-8">
											<form method="post"  class="rd-mailform form-contact-line text-left" >
												<div class="form-inline-flex">
													<div class="form-group">
														<label for="o_consignee" class="form-label form-label-outside rd-input-label">First name :</label>
														<input id="o_consignee" ng-model="u_fname"  type="text" placeholder="<{$userLanguageAry.user_delivery_phone}>" name="o_consignee"   data-constraints="@Required" class="form-control form-control-has-validation form-control-last-child">
														<span class="form-validation"></span>
													</div>
													<div class="form-group">
														<label for="o_phone" class="form-label form-label-outside rd-input-label">Last name :</label>
														<input id="o_phone" ng-model="u_lname" type="text" placeholder="<{$userLanguageAry.user_delivery_phone}>" name="o_phone" data-constraints="@Required" class="form-control form-control-has-validation form-control-last-child"><span class="form-validation"></span>
													</div>
												</div>
												<div class="form-inline-flex this-margin-top">
													<div class="form-group">
														<label for="o_consignee" class="form-label form-label-outside rd-input-label">Phone : </label>
														<input id="o_consignee" ng-model="u_phone"  type="text" placeholder="<{$userLanguageAry.user_delivery_consignee}>" name="o_consignee"   data-constraints="@Required" class="form-control form-control-has-validation form-control-last-child">
														<span class="form-validation"></span>
													</div>
													<div class="form-group">
														<label for="o_phone" class="form-label form-label-outside rd-input-label">E-mail : </label>
														<input id="o_email" ng-model="u_email" type="text" placeholder="<{$userLanguageAry.user_delivery_phone}>" name="o_phone" data-constraints="@Required" class="form-control form-control-has-validation form-control-last-child"><span class="form-validation"></span>
													</div>
												</div>
												<div class="form-inline-flex this-margin-top">
													<div class="form-group">
														<label for="o_consignee" class="form-label form-label-outside rd-input-label">Password :</label>
														<input id="o_consignee" ng-model="u_pwd"  type="text" placeholder="<{$userLanguageAry.user_delivery_consignee}>" name="o_consignee"   data-constraints="@Required" class="form-control form-control-has-validation form-control-last-child">
														<span class="form-validation"></span>
													</div>
													<div class="form-group">
														<label for="o_phone" class="form-label form-label-outside rd-input-label">Confirm password</label>
														<input id="o_email" ng-model="u_confpwd" type="text" placeholder="<{$userLanguageAry.user_delivery_phone}>" name="o_phone" data-constraints="@Required" class="form-control form-control-has-validation form-control-last-child"><span class="form-validation"></span>
													</div>
												</div>
												<div class="offset-top-30">
													<div class="form-inline-flex">
														<div class="form-group">
															<button ng-click="setProfile();$event.preventDefault();"  class="this-btn this-btn-this"><{$language.from_button_sumbit}></button>
														</div>
													</div>
												</div>
											</form>

										</div>

									</div>
								</div>
							</div>
						</div>

						<div id="address" class="tab-pane this-animate-right this-left-align">
							<div class="well this-white " style="border: none">

								<div class="this-container">
									<div class="row">
										<div class="col-sm-7" style="padding: 0px">
											<form  class="form" style="text-align: left" id="frm_add" action="/User_Position/doInsert" method="post" >
												<div class="form-group ">
													<div class="col-sm-12">
														<label for="p_name">Address name :</label>
														<select  id="o_position_id" data-constraints="@Required"  name="o_position_id"  class=" form-control"
																 style="padding: 2px; padding-left: 10px; height: 38px;!important; border-radius: 4px" >
															<option value="0">請選擇</option>
															<option data-y="{{position.u_position_lat}}"     data-x="{{position.p_lng}}" value="{{position.p_id}}" ng-repeat="position in positions">{{position.p_name}}</option>
														</select>
													</div>
													<div class="col-sm-4 this-margin-top">
														<span onclick="openLocation()" class="this-btn this-btn-this "> add new address </span>

													</div>
												</div>
												<br/>

												<div class="form-group ">
													<div class="col-sm-12 this-margin-top">
														<label for="p_desc">Plcese Description :</label>
														<textarea class="form-control">

													</textarea>
														<hr/>
														<button type="submit"class="this-btn this-btn-this"  style="height: 35px; padding: 2px; width: 100px">Save</button>
														<button type="reset" id="close_add" class="this-btn" style="height: 35px; padding: 2px; width: 100px">Cancel</button>
													</div>
												</div>


												<div id='response'></div>
											</form>
										</div>
									</div>
								</div>

							</div>
						</div>
					    <div id="order_list" class="tab-pane this-animate-right this-left-align" style="padding: 0px;" >
							<div class="well this-white " style="border: none; padding: 0px">

								<div class="this-container"  ng-controller="orderCtrl" ng-init="orderList()">
									<div class="row">

										<div class="col-sm-12" style="padding: 0px" >
											<div class="table-responsive" style="padding: 0px">
												<table id="tb_order" class="table table-striped table-bordered"
													   cellspacing="0" width="100%">

													<thead>
													<tr class="this-border">
														<td>Order ID</td>
														<td>Date/Time</td>
														<td>Discount</td>
														<td>Total</td>
														<td>Status</td>
													</tr>
													</thead

													<tbody>
											      			<tr  ng-repeat="row in data.orders" >
															<td>{{row.o_id}}</td>
															<td>{{row.add_datetime}}</td>
															<td>{{row.o_discount}}</td>
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


				</div>
			</div>

	</section>

	<div class="this-animate-zoom ac-wrapper this-hide"  id="this_map" >
		<div class="popup" id="this_Open">

			<div class="this-container this-top" style="width:320px; position:relative!important; background-color:rgba(255,255,255,0.7);text-align:left; top:0px; padding-bottom: 5px; padding: 5px"	>

				<div onClick="PopUp()" class="this-circle" style="text-align:right; position: absolute;right: 0px; margin-top: -5px">
					<div   name="submit"  onClick="PopUp()" style="border-radius: 15px; background:transparent" >
						<span class="glyphicon glyphicon-remove-circle" style="font-size: 25px;color: white; cursor: pointer"></span> </div>
				</div>


				<div class="form-group offset-top-0  " style="margin-top: -5px; width: 98%; padding: 10px">
					<div class="form-inline-flex">
						<div class="form-group" style="width: 90%">
							<select  id="o_position_id" data-constraints="@Required"  name="o_position_id" class="form-control form-control-has-validation form-control-last-child input-sm" style="padding: 2px; padding-left: 10px">
								<option value="0">請選擇</option>
								<option data-y="{{position.p_lat}}"     data-x="{{position.p_lng}}" value="{{position.p_id}}" ng-repeat="position in positions">{{position.p_name}}</option>
							</select>

						</div>

					</div>
				</div>
			</div>
			<div id="maping" ng-init="mapinit()"  data-zoom="15" data-y="10.6105995" data-x="103.5236850" data-styles="" class="rd-google-map rd-google-map__model"
				 style="position:fixed; margin-bottom: 5px; height:100%; margin-top: -70px">
				<ul class="map_locations" style="width: 80px" >
					<li data-y="{{position.p_lat}}" data-x="{{position.p_lng}}" data-position_id="{{position.p_id}}" ng-repeat="position in positions">
						<p data-position_id ="1" style="width:100%; text-align:  center;height: 90%">
							<span style="width:28px; ">{{position.p_name}}</span>
						</p>
					</li>
				</ul>
			</div>

			<div id="add_location" class=" this-bottom" style="width: 100%; height:10%;  background: white; text-align: center; position: absolute">
				<p style="font-size: 12px"> Drag drop and create your location Address </p>
				<button class="this-btn this-btn-this" id="open_form" style="height: 35px; padding: 2px; width: 100px"> AddNew </button>
				<div class="container">
					<div class="row">
						<div class="col-sm-2"></div>
						<div class="col-sm-8 w3-padding ">
							<form  class="form" style="text-align: left" id="frm_add" action="/User_Position/doInsert" method="post" >
								<div class="form-group">
									<label for="p_name">Address name :</label>
									<input type="text" class="form-control input-sm" id="p_name" name="u_position_name"  required minlength="5">
								</div>
								<div class="form-group">
									<label for="p_desc">Plase Description :</label>
									<input type="text" class="form-control input-sm" id="p_desc" required minlength="5">
								</div>

								<button type="submit"class="this-btn" " style="height: 35px; padding: 2px; width: 100px">Save</button>
								<button type="reset" id="close_add" class=" btn-primary " style="height: 35px; padding: 2px; width: 100px">Back</button>
								<div id='response'></div>
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

</main>

<script>
    function openLocation() {
        $('#this_map').removeClass('this-hide');
    }
    function PopUp(){
        $('#this_map').addClass('this-hide');
    }

</script>
<!--
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" />
<script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<script >
    $.noConflict();
    jQuery( document ).ready(function( $ ) {
        $('#tb_order').DataTable();
    });
</script>\
-->