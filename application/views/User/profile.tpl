<main class="page-content" ng-controller="userCtrl" ng-init="init()">
	<!-- Breadcrumbs & Page title-->
	<{include file="Frontend/breadcrumbs.tpl"}>
	<section class="bg-white container" style="padding: 0px; color: white!important; font-size: 14px">

				<div class="">
				<ul class="nav nav-tabs" style="background:#f16121; border: none; padding: 0px">
					<li class="active"><a data-toggle="tab" href="#home"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
					<li><a data-toggle="tab" href="#menu1"><span class="glyphicon glyphicon-map-marker"></span>  Address</a></li>
					<li><a data-toggle="tab" href="#menu1"><span class="glyphicon glyphicon-book"></span>  Order </a></li>

				</ul>

				<div class="tab-content w3-border w3-padding-top w3-padding " style="background:#f5f5f5; padding-top: 10px">

						<div id="home" class="tab-pane fade in active ">
							<div class="c">
								<div class="well w3-white">
									<div class="row">
										<div class="col-sm-3 align-center w3-center">
											<center>
												<img src="https://www.thestylease.com/images/user.png" width="150px" class="img-responsive">
											</center>
											<button class="-sm btn-danger">Browser
											</button>
										</div>

										<div class="col-sm-8">
											<form method="post"  class="rd-mailform form-contact-line text-left" >
												<div class="form-inline-flex">
													<div class="form-group">
														<label for="o_consignee" class="form-label form-label-outside rd-input-label"><{$userLanguageAry.user_delivery_consignee}></label>
														<input id="o_consignee" ng-model="u_consignee"  type="text" placeholder="<{$userLanguageAry.user_delivery_consignee}>" name="o_consignee"   data-constraints="@Required" class="form-control form-control-has-validation form-control-last-child">
														<span class="form-validation"></span>
													</div>
													<div class="form-group">
														<label for="o_phone" class="form-label form-label-outside rd-input-label"><{$userLanguageAry.user_delivery_phone}></label>
														<input id="o_phone" ng-model="u_phone" type="text" placeholder="<{$userLanguageAry.user_delivery_phone}>" name="o_phone" data-constraints="@Required" class="form-control form-control-has-validation form-control-last-child"><span class="form-validation"></span>
													</div>
												</div>
												<div class="form-inline-flex">
													<div class="form-group">
														<label for="o_consignee" class="form-label form-label-outside rd-input-label"><{$userLanguageAry.user_delivery_consignee}></label>
														<input id="o_consignee" ng-model="u_consignee"  type="text" placeholder="<{$userLanguageAry.user_delivery_consignee}>" name="o_consignee"   data-constraints="@Required" class="form-control form-control-has-validation form-control-last-child">
														<span class="form-validation"></span>
													</div>
													<div class="form-group">
														<label for="o_phone" class="form-label form-label-outside rd-input-label"><{$userLanguageAry.user_delivery_phone}></label>
														<input id="o_email" ng-model="u_email" type="text" placeholder="<{$userLanguageAry.user_delivery_phone}>" name="o_phone" data-constraints="@Required" class="form-control form-control-has-validation form-control-last-child"><span class="form-validation"></span>
													</div>
												</div>
												<div class="form-inline-flex">
													<div class="form-group">
														<label for="o_consignee" class="form-label form-label-outside rd-input-label"><{$userLanguageAry.user_delivery_consignee}></label>
														<input id="o_consignee" ng-model="u_consignee"  type="text" placeholder="<{$userLanguageAry.user_delivery_consignee}>" name="o_consignee"   data-constraints="@Required" class="form-control form-control-has-validation form-control-last-child">
														<span class="form-validation"></span>
													</div>
													<div class="form-group">
														<label for="o_phone" class="form-label form-label-outside rd-input-label"><{$userLanguageAry.user_delivery_phone}></label>
														<input id="o_email" ng-model="u_email" type="text" placeholder="<{$userLanguageAry.user_delivery_phone}>" name="o_phone" data-constraints="@Required" class="form-control form-control-has-validation form-control-last-child"><span class="form-validation"></span>
													</div>
												</div>
												<div class="offset-top-30">
													<div class="form-inline-flex">
														<div class="form-group">
															<button ng-click="setProfile();$event.preventDefault();"  class="btn btn-primary"><{$language.from_button_sumbit}></button>
														</div>
													</div>
												</div>
											</form>

										</div>

									</div>
								</div>
							</div>
						</div>

						<div id="menu1" class="tab-pane fade">
							<h3>Address Book</h3>
							<p class="text-silver" style="color: black!important;">Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
						</div>


				</div>
			</div>
		<hr class="offset-top-50">


			<div class="range range-xs-center offset-top-50">
			</div>



	</section>
</main>