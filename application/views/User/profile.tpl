<main class="page-content" ng-controller="userCtrl" ng-init="init()">
	<!-- Breadcrumbs & Page title-->
	<{include file="Frontend/breadcrumbs.tpl"}>
	<section class="bg-white text-center section-100 section-sm-bottom-100 section-sm-top-50" ng-controller="shopCartCtrl">
		<div class="shell">
		<h5>Profile</h5>
			<div class="range range-xs-center offset-top-15">
				<div class="cell-sm-10 cell-md-10">
					<div class="inset-lg-left-50 inset-lg-right-50">
					  <!-- RD Mailform-->
						<form method="post"  class="rd-mailform form-contact-line text-left" >
							<div class="form-inline-flex">
								<div class="form-group">
									<label for="o_consignee" class="form-label form-label-outside rd-input-label"><{$userLanguageAry.user_delivery_consignee}></label>
									<input id="o_consignee" ng-model="u_consignee"  type="text" placeholder="<{$userLanguageAry.user_delivery_consignee}>" name="o_consignee" data-constraints="@Required" class="form-control form-control-has-validation form-control-last-child">
									<span class="form-validation"></span>
								</div>
								<div class="form-group">
									<label for="o_phone" class="form-label form-label-outside rd-input-label"><{$userLanguageAry.user_delivery_phone}></label>
									<input id="o_phone" ng-model="u_phone" type="text" placeholder="<{$userLanguageAry.user_delivery_phone}>" name="o_phone" data-constraints="@Required" class="form-control form-control-has-validation form-control-last-child"><span class="form-validation"></span>
								</div>
							</div>
							<div class="offset-top-30">
								<div class="form-inline-flex">
									<div class="form-group">
										<button ng-click="setProfile();$event.preventDefault();"  class="btn btn-primary btn-fullwidth"><{$language.from_button_sumbit}></button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="range range-xs-center offset-top-50">
			</div>
		</div>
	</section>
</main>