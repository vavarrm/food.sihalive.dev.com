<!-- Page Content-->
<main class="page-content" ng-controller="shopCartCtrl">
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
					<img src="/images/shop-cart-1-130x130.png" width="130" height="130" alt="">
				</div>
		  </div>
		  <div class="col-xs-4  text-left">
				<div class="h5 text-sbold offset-top-20 ">
					<span  class=" grid-element-mod-2">{{item.f_name}}</span>
				</div>
				<div class="offset-top-0">
					<span class="h5 text-sbold">${{item.price}}</span>
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
					<span>Total: </span>
					<span>$</span>
					<span class="total">{{Total(filterAry)}}</span>
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
						<form method="post"  class="rd-mailform form-contact-line text-left" >
							<div class="form-inline-flex">
							  <div class="form-group">
								<label for="o_consignee" class="form-label form-label-outside rd-input-label"><{$shopLanguageAry.shopcart_delivery_consignee}></label>
								<input id="o_consignee" type="text"  ng-model="data.o_consignee" placeholder="<{$shopLanguageAry.shopcart_delivery_consignee}>" name="o_consignee" data-constraints="@Required" class="form-control form-control-has-validation form-control-last-child">
								<span class="form-validation"></span>
							  </div>
							  <div class="form-group">
								<label for="o_phone" class="form-label form-label-outside rd-input-label"><{$shopLanguageAry.shopcart_delivery_phone}></label>
								<input id="o_phone" type="text" ng-model="data.o_phone" placeholder="<{$shopLanguageAry.shopcart_delivery_phone}>" name="o_phone" data-constraints="@Required" class="form-control form-control-has-validation form-control-last-child"><span class="form-validation"></span>
							  </div>
							</div>
							<div class="form-group offset-top-15">
							  <label for="message" class="form-label form-label-outside rd-input-label"><{$shopLanguageAry.shopcart_delivery_message}></label>
							  <textarea id="message" placeholder="<{$shopLanguageAry.shopcart_delivery_message_placeholder}>" name="o_messge" data-constraints="@Required" class="form-control form-control-has-validation form-control-last-child"></textarea><span class="form-validation"></span>
							</div>
							<div class="offset-top-15">
								<div ng-init="mapinit()" data-zoom="17" data-y="10.6105995" data-x="103.5236850" data-styles="" class="rd-google-map rd-google-map__model">
									<ul class="map_locations">
									  <li data-y="{{position.p_lat}}" data-x="{{position.p_lng}}" data-position_id="{{position.p_id}}" ng-repeat="position in positions">
										<p data-position_id ="1">
											<span class="icon">
												<img src="/images/gmap-24x34.png" alt="" width="24" height="34"/>
											</span>267 Park Avenue New York, NY 90210
										</p>
									  </li>
									</ul>
								</div>
							</div>
							<div class="offset-top-15">
								<div class="form-inline-flex">
									<div class="form-group offset-top-15">
										<label for="message" class="form-label form-label-outside rd-input-label"><{$shopLanguageAry.shopcart_delivery_position}></label>
										<select  id="o_position_id" data-constraints="@Required"  name="o_position_id" class="form-control form-control-has-validation form-control-last-child">
											<option value="0">請選擇</option>
											<option data-y="{{position.p_lat}}"    data-x="{{position.p_lng}}" value="{{position.p_id}}" ng-repeat="position in positions">{{position.p_name}}</option>
										</select>
									</div>
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
</section>
</main>
<script>
function changeOrderNum(input)
{
	var index = $(input).data('index');
	var price = parseFloat($(input).data('price'));
	var order_num = parseInt(input.val());
	$('span[data-index='+index+']').html(price* order_num ).data('subtotal', price* order_num);
	var total = 0;
	$.each($('.subtotal'),function(i,e){
		var subtotal = parseFloat($(e).data('subtotal'),2);
		total+=subtotal ;
		
	})

	$('.total').html(parseFloat(total,2).toFixed(2));
}
window.onload=function(){
	
	$( "body" ).on( "click", ".stepper-arrow.up", function(e) {
		var input = $(this).parent().find('input');
		if($(input).hasClass( "ng-valid" ) ==false)
		{
			return false;
		}
		var max   =parseInt(input.attr('max'));
		var val   =parseInt(input.val());
		if(val > max)
		{
			return false;
		}
		input.val(val +1);
		changeOrderNum(input)
	});

	$( "body" ).on( "click", ".stepper-arrow.down", function() {
		var input = $(this).parent().find('input');
		if($(input).hasClass( "ng-valid" ) ==false)
		{
			return false;
		}
		var min   =parseInt(input.attr('min'));
		var val   =parseInt(input.val());
		if(val <= min)
		{
			return false;
		}
		input.val(val -1);
		changeOrderNum(input);
	});
}
</script>