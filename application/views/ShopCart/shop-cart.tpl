<!-- Page Content-->

<style>
	#ac-wrapper {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background: rgba(255, 255, 255, .6);
		z-index: 1001;
	}
	#popup {
		width: 100%;
		height: 100%;
		background: #FFFFFF;
		box-shadow: #64686e 0px 0px 3px 3px;
		-moz-box-shadow: #64686e 0px 0px 3px 3px;
		-webkit-box-shadow: #64686e 0px 0px 3px 3px;
		position: fixed;margin: 0px;
		padding: 10px;


	}
</style>

<main class="page-content" ng-controller="shopCartCtrl" >
	<!-- Breadcrumbs & Page title-->
	<{include file="Frontend/breadcrumbs.tpl"}>
	<section class="section-50 section-sm-100">
		<div class="container">
			<div ng-repeat="item in items|filter as filterAry" ng-show="!item.del" class="row grid-system-row grid-element-outline-bottom offset-top-15 offset-sm-top-30">
				<div class="col-xs-1">
					<div class="form-group stepper-type-2 offset-top-20">
						<input data-index="{{$index}}" data-price="{{item.price}}" type="number" data-zeros="true"  value="{{item.order_num}}" ng-model="$item.order_num" min="1" max="20" readonly class="form-control text-bold">
					</div>
				</div>
				<div class="col-xs-4">
					<div class="product-image">
						<img src="http://admin.sihalive.dev.com/upload/1518417582947.jpg" width="130" height="130" alt="">
					</div>
				</div>
				<div class="col-xs-4  text-left">
					<div class="h5 text-sbold offset-top-20 ">
						<span  class=" grid-element-mod-2"　ng-bind="item.f_name"></span>
					</div>
					<div class="offset-top-0">
						<span class="h5 text-sbold" ng-bind="'$'+item.price"></span>
					</div>
				</div>
				<div class="col-xs-2  text-left">
					<div class="h5 text-sbold offset-top-20 ">
						<span  class=" grid-element-mod-2">Subtotal</span>
					</div>
					<div class="offset-top-0">
					<span class="h5 text-sbold">$<span>
					<span data-index="{{$index}}" data-subtotal="{{item.subtotal}}" class="h5 text-sbold subtotal" ng-model="item.subtotal" ng-bind="item.subtotal" ng-init="item.subtotal =  (item.price*item.order_num)"></span>
					</div>
				</div>
				<div class="col-xs-1">
					<div class="text-left offset-top-40">
						<a  class="icon icon-sm mdi mdi-window-close link-gray-lightest" ng-click="delete($index);$event.stopPropagation();"></a>
					</div>
				</div>
			</div>
			<div  class="row grid-system-row offset-top-50 text-right">
				<div class="col-xs-12">
					<div class="h4 font-default text-bold">
						<span class="total" ng-bind="'Total:'+Total(filterAry)"></span>
					</div>
				</div>
			</div>
			<div  class="row grid-system-row offset-top-50 ">
				<div class="shell">
					<h5><{$shopLanguageAry.shopcart_delivery_info}></h5>
					<div class="range range-xs-center offset-top-15">
						<div class="cell-sm-12 cell-md-12">
							<div class="inset-lg-left-50 inset-lg-right-50">
								<!-- RD Mailform-->
								<form method="post"  class=" form-contact-line text-left " >


									<div class="form-inline-flex">
										<div class="form-group">
											<label for="o_consignee" class="form-label form-label-outside rd-input-label"><{$shopLanguageAry.shopcart_delivery_consignee}></label>
											<input id="o_consignee" type="text"  ng-model="data.o_consignee" placeholder="<{$shopLanguageAry.shopcart_delivery_consignee}>" name="o_consignee" data-constraints="@Required" class="form-control form-control-has-validation form-control-last-child input-lg">
											<span class="form-validation"></span>
										</div>
										<div class="form-group">
											<label for="o_phone" class="form-label form-label-outside rd-input-label"><{$shopLanguageAry.shopcart_delivery_phone}></label>
											<input id="o_phone" type="text" ng-model="data.o_phone" placeholder="<{$shopLanguageAry.shopcart_delivery_phone}>" name="o_phone" data-constraints="@Required" class="form-control form-control-has-validation form-control-last-child input-lg">
											<span class="form-validation"></span>
										</div>
									</div>
									<div class="form-inline-flex">
										<div class="form-group">
											<div class="col-sm-9" style="padding: 0px">
												<label for="message" class="form-label form-label-outside rd-input-label"><{$shopLanguageAry.shopcart_delivery_position}></label>
												<select  id="o_position_id" data-constraints="@Required"  name="o_position_id" class="form-control form-control-has-validation form-control-last-child input-lg" style="padding: 2px;border-top-right-radius: 0px 0px ">
													<option value="0">請選擇</option>
													<option data-y="{{position.u_position_lat}}"     data-x="{{position.p_lng}}" value="{{position.p_id}}" ng-repeat="position in positions">{{position.p_name}}</option>
												</select>
											</div>
											<div class="col-sm-3" style="padding: 0px">
												<label> 添加位置 </label>

												<div class="btn btn-primary  btn-sm btn-block "  onclick="openLocation()" > 得到 </div>
											</div>

										</div>
										<div class="form-group ">
											<div class="col-sm-12" style="padding: 0px">
												<label for="message" class="form-label form-label-outside rd-input-label"><{$shopLanguageAry.shopcart_delivery_message}></label>
												<input type="text"  id="message" placeholder="<{$shopLanguageAry.shopcart_delivery_message_placeholder}>" name="o_messge"  class="form-control form-control-has-validation form-control-last-child input-lg">
												<span class="form-validation"></span>
											</div>

										</div>


									</div>





									<div class="offset-top-15">
										<div class="form-inline-flex">
											<div class="form-group">
												<button ng-click="checkout();$event.preventDefault();"  class="btn btn-primary btn-fullwidth"><{$shopLanguageAry.shopcart_proceed_to_checkout}></button>
											</div>
										</div>

									</div>
								</form>
								<div id="ac-wrapper"  >
									<div id="popup">

										<div class="col w3-card" style="width:100%;height: 10%; position:relative!important; background:#f16121;text-align:left; top: 0px; padding-bottom: 5px; padding: 5px"	>

											<div class="w3-circle" style="text-align:right; position: absolute;right: 0px; margin-top: -10px">
												<div   name="submit"  onClick="PopUp()" style="border-radius: 15px; background:transparent" >
													<span class="glyphicon glyphicon-remove-circle" style="font-size: 25px;color: white; cursor: pointer"></span> </div>
											</div>


											<div class="form-group offset-top-0" style="margin-top: -5px; width: 98%; padding: 10px">
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

										<div id="maping" ng-init="mapinit()"  data-zoom="15" data-y="10.6105995" data-x="103.5236850" data-styles="" class="rd-google-map rd-google-map__model" style="position:fixed; margin-bottom: 5px; height: 80%">
											<ul class="map_locations" style="width: 80px" >
												<li data-y="{{position.p_lat}}" data-x="{{position.p_lng}}" data-position_id="{{position.p_id}}" ng-repeat="position in positions">
													<p data-position_id ="1" style="width:100%; text-align:  center;height: 90%">
														<span style="width:28px; ">{{position.p_name}}</span>
													</p>
												</li>
											</ul>
										</div>
										<div id="add_location" class="w3-fixed-butttom" style="width: 100%; height:8%;  background: white; text-align: center; position: absolute">
											<p style="font-size: 12px"> Drag drop and create your location Address </p>
											<button class=" btn-primary " id="open_form" style="height: 35px; padding: 2px; width: 100px"> AddNew </button>
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

															<button type="submit"class=" btn-primary " style="height: 35px; padding: 2px; width: 100px">Save</button>
															<button type="reset" id="close_add" class=" btn-primary " style="height: 35px; padding: 2px; width: 100px">Back</button>
															<div id='response'></div>
														</form>
													</div>
												</div>
											</div>
										</div>






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
<script type="text/javascript">
    //document.getElementById('ac-wrapper').style.display="none";
    function openLocation() {
        document.getElementById('ac-wrapper').style.display = "block";
    }
    function PopUp(){
        document.getElementById('ac-wrapper').style.display="none";
    }
</script>
