<!-- Page Content-->


<main class="page-content this-white" ng-controller="shopCartCtrl" >
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
						<div class="cell-sm-12 cell-md-12" style="padding: 0px">
							<div class="inset-lg-left-50 inset-lg-right-50">
								<!-- RD Mailform-->
								<div class="col-sm-8 this-padding-0" style="padding: 0px">
									<form method="post"  class=" form-contact-line text-left " >

										<div class="form-inline-flex">
											<div class="form-group">
												<div class="col-sm-12" style="padding: 0px">
													<label for="message" class="form-label form-label-outside rd-input-label"><{$shopLanguageAry.shopcart_delivery_position}></label>
													<select  id="o_position_id" data-constraints="@Required"  name="o_position_id" class="form-control form-control-has-validation form-control-last-child ">
														<option value="0">請選擇</option>
														<option data-y="{{position.p_lat}}"     data-x="{{position.p_lng}}" value="{{position.p_id}}" ng-repeat="position in positions">{{position.p_name}}</option>
													</select>
												</div>


											</div>
											<div class="form-group ">
												<div class="col-sm-12" style="padding: 0px">
													<label for="message" class="form-label form-label-outside rd-input-label"><{$shopLanguageAry.shopcart_delivery_message}></label>
													<input type="text"  id="message" placeholder="<{$shopLanguageAry.shopcart_delivery_message_placeholder}>" name="o_messge"  class="form-control form-control-has-validation form-control-last-child ">
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


								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</main>
