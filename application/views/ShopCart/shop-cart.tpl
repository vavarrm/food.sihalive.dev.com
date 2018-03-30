<!-- Page Content-->

<style>
	.ac-wrapper {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background:transparent;
		z-index: 1;
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
<main class="page-content this-white" ng-controller="shopCartCtrl" ng-init="r_id='<{$r_id}>';invoices()"   >
	<!-- Breadcrumbs & Page title-->
	<{include file="Frontend/breadcrumbs.tpl"}>
	<section class="section-0 section-sm-10">
		<div class="container" style="padding: 0px">
			<div class="this-container  this-text-white " style="height: 40px; background: #f75d34;border-radius:4px"  >
				<div class="col-sm-12 this-center" style="padding: 0px">
					<div class="col-xs-3 col-md-3 this-padding">
						<span class="fa fa-home" style="font-size: 20px"></span>
						<span class="fa fa-arrow-right this-hide-small" style="padding-left: 20px"><{$mainpage_language_ary.Home}>  </span>
					</div>
					<div class="col-xs-3 col-md-3 this-padding " >
						<span class=" fa fa-shopping-cart" style="font-size: 20px"></span>
						<span class="fa fa-arrow-right this-hide-small " style="padding-left: 20px">  <{$mainpage_language_ary.ORDER}> </span>
					</div>
					<div class="col-xs-3 col-md-3 this-padding this-white "  style="margin-top:2px; border-radius: 2px">
						<span class="fa fa-credit-card" style="font-size: 20px"></span>
						<span class="fa fa-arrow-right this-hide-small " style="padding-left:20px"> <{$mainpage_language_ary.CHECK_OUT}></span>
					</div>
					<div class="col-xs-3 col-md-3 this-padding">
						<span class="fa fa-print" style="font-size: 20px"></span>
						<span class="this-hide-small"><{$mainpage_language_ary.RECEIPT}></span>
					</div>
				</div>
			</div>
		</div>
		<div class="container text-left" style="padding: 0px; margin-top: 0px;">
			<div class="col-sm-12" >
				<div class="col-sm-12  this-margin-top this-margin-bottom" STYLE="border-radius: 4PX">
					<div class="this-container this-padding" style="border-bottom: 1px solid silver">
						<div class="h5 text-bold"> <{$mainpage_language_ary.Order_Information}></div>
					</div>
					<div ng-repeat="item in items|filter as filterAry" ng-show="!item.del" class="row grid-system-row grid-element-outline-bottom ">
						<div class="col-xs-1">
							<div class="form-group stepper-type-2 offset-top-20">
								<input data-index="{{$index}}" data-price="{{item.price}}" type="number" data-zeros="true"  value="{{item.order_num}}" ng-model="$item.order_num" min="1" max="20" readonly class="form-control ">
							</div>
						</div>
						<div class="col-xs-4">
							<div class="product-image">
								<img src="http://admin.sihalive.dev.com/upload/1518417582947.jpg" width="130" height="130" alt="">
							</div>
						</div>
						<div class="col-xs-4  text-left">
							<div class=" offset-top-20">
								<span ng-bind="item.f_name"></span>
							</div>
							<div class="offset-top-0">
								<span class="" ng-bind="'$'+item.f_price"></span>
							</div>
						</div>
						<div class="col-xs-2  text-left">
							<div class="text-sbold offset-top-20 ">
								<span  class=" grid-element-mod-2"></span>
							</div>
							<div class="offset-top-0">
								<span class=" text-sbold">$<span>
								<span data-index="{{$index}}" data-subtotal="{{item.subtotal}}"
									  class=" text-sbold subtotal"
									  ng-model="item.subtotal" ng-bind="item.subtotal"
									  ng-init="item.subtotal=(item.f_price*item.order_num)">
								</span>
							</div>
						</div>
						<div class="col-xs-1">
							<div class="text-left offset-top-20">
								<span class="glyphicon glyphicon-trash" style="font-size:15px; cursor: pointer" ng-click="idelete($index);$event.stopPropagation();"></span>
							</div>
						</div>
					</div>
					<div  class="row grid-system-row offset-top-30 text-right">
						<div class="col-xs-12 this-padding ">
							<div class=" font-default text-bold this-padding">
								<{$mainpage_language_ary.Sub_Total}> : <span class="total" ng-bind=" Total(filterAry)"></span>
							</div>
							<div class=" font-default text-bold this-padding">
								<{$mainpage_language_ary.Total}> : <span class="total" ng-bind=" Total(filterAry)"></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="bg-white text-center   section-sm-bottom-100">
	  <div class="shell">
		<h5>Contact us</h5>
		<div class="range range-xs-center offset-top-15">
		  <div class="cell-sm-10 cell-md-12">
			<div class="inset-lg-left-50 inset-lg-right-50">
			  <!-- RD Mailform-->
			  <form data-form-output="form-output-global" data-form-type="contact" method="post" action="bat/rd-mailform.php" class="rd-mailform form-contact-line text-left" novalidate="novalidate">
				<div class="form-inline-flex">
				  <div class="form-group">
					<label for="contact-name-2" class="form-label form-label-outside rd-input-label">First name</label>
					<input id="contact-name-2" type="text" placeholder="Your First Name" name="name" data-constraints="@Required" class="form-control form-control-has-validation form-control-last-child"><span class="form-validation"></span>
				  </div>
				  <div class="form-group">
					<label for="contact-username" class="form-label form-label-outside rd-input-label">last name</label>
					<input id="contact-username" type="text" placeholder="Your Last Name" name="password" data-constraints="@Required" class="form-control form-control-has-validation form-control-last-child"><span class="form-validation"></span>
				  </div>
				</div>
				<div class="form-group offset-top-15">
				  <label for="message" class="form-label form-label-outside rd-input-label">your message</label>
				  <textarea id="message" placeholder="Write your message here" name="message" data-constraints="@Required" class="form-control form-control-has-validation form-control-last-child"></textarea><span class="form-validation"></span>
				</div>
				<div class="offset-top-15">
				  <div class="form-inline-flex">
					<div class="form-group">
					  <label for="contact-email-2" class="form-label form-label-outside rd-input-label">E-mail</label>
					  <input id="contact-email-2" type="email" placeholder="Enter your email" name="email" data-constraints="@Email @Required" class="form-control form-control-has-validation form-control-last-child"><span class="form-validation"></span>
					</div>
					<div class="form-group">
					  <button type="submit" class="btn btn-primary btn-fullwidth">Send message</button>
					</div>
				  </div>
				</div>
			  </form>
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
