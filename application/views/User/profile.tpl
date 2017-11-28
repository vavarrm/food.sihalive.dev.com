<main class="page-content" ng-controller="userCtrl">
	<!-- Breadcrumbs & Page title-->
	<{include file="Frontend/breadcrumbs.tpl"}>
	<section class="bg-white text-center section-100 section-sm-bottom-100 section-sm-top-80" ng-controller="shopCartCtrl">
		<div class="shell">
		<h5>Profile</h5>
			<div class="range range-xs-center offset-top-15">
				<div class="cell-sm-10 cell-md-8">
					<div class="inset-lg-left-50 inset-lg-right-50">
					  <!-- RD Mailform-->
						<form data-form-output="form-output-global" data-form-type="contact" method="post" action="bat/rd-mailform.php" class="rd-mailform form-contact-line text-left" novalidate="novalidate">
							<div class="form-inline-flex">
								<div class="form-group">
									<label for="u_consignee" class="form-label form-label-outside rd-input-label"><{$userLanguageAry.user_delivery_consignee}></label>
									<input id="u_consignee" type="text" placeholder="<{$userLanguageAry.user_delivery_consignee}>" name="u_consignee" data-constraints="@Required" class="form-control form-control-has-validation form-control-last-child"><span class="form-validation"></span>
								</div>
								<div class="form-group">
									<label for="contact-name-2" class="form-label form-label-outside rd-input-label"><{$userLanguageAry.user_delivery_phone}></label>
									<input id="contact-name-2" type="text" placeholder="<{$userLanguageAry.user_delivery_phone}>" name="u_phone" data-constraints="@Required" class="form-control form-control-has-validation form-control-last-child"><span class="form-validation"></span>
								</div>
							</div>
							<div class="offset-top-15">
							  <div class="form-inline-flex">
								<div class="form-group">
									<button type="submit" ng-click="setProfile();$event.preventDefault();" class="btn btn-primary btn-fullwidth"><{$language.from_button_sumbit}></button>
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