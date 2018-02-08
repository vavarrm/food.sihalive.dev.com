<!-- Page Content-->
<script>
    var url_back ='<{$smarty.get.back}>';
</script>
<main class="page-content" ng-controller="loginCtrl" ng-model="back" ng-init="back='<{$smarty.get.back}>'">
	<!-- Breadcrumbs & Page title-->
	<{include file="Frontend/breadcrumbs.tpl"}>

	<!-- Buttons-->
	<section class="bg-white text-center section-50 section-sm-100">
		<div class="shell">
			<div class="range range-xs-center">
				<div class="cell-sm-8 cell-lg-6">
					<div class="responsive-tabs responsive-tabs-modern responsive-tabs-modern-mod-1 responsive-tabs-horizontal">
						<ul class="resp-tabs-list">
							<li>Login</li>
							<li>Registration</li>
						</ul>
						<div class="resp-tabs-container">
							<div>
								<div class="group-sm">
									<a id="FBloginBtn"  class="btn btn-facebook btn-icon btn-icon-left">
										<span class="icon icon-lg fa-facebook"></span>
										<span>Facebook</span>
									</a>
								</div>
								<div class="divider-custom offset-top-30">
									<p class="small text-uppercase">Or</p>
								</div>
								<!-- RD Mailform-->
								<form class="rd-mailform form-register text-center offset-top-20" id="Loginfrm">
									<div class="form-group">
										<label for="contact-name" class="form-label form-label-outside">Username or E-mail</label>
										<input id="contact-name" type="text" name="username_email" data-constraints="@Required" class="form-control">
									</div>
									<div class="form-group">
										<label for="contact-email" class="form-label form-label-outside">Password</label>
										<input id="contact-email" type="password" name="u_passwd" data-constraints="@Required" class="form-control">
									</div>
									<div class="offset-top-50">
										<button type="submit" ng-click="doLogin()" class="btn btn-primary btn-fullwidth btn-shadow">Enter</button>
									</div>
								</form>
							</div>
							<div >
								<div class="group-sm">
									<a href="#" class="btn btn-facebook btn-icon btn-icon-left"  id="fbReg">
										<span class="icon icon-xs fa-facebook"></span>
										<span>Facebook</span>
									</a>
									<{*
						<a href="#" class="btn btn-twitter btn-icon btn-icon-left">
							<span class="icon icon-xs fa-twitter"></span>
							<span>Twitter</span>
						</a>
						<a href="#" class="btn btn-google-plus btn-icon btn-icon-left">
							<span class="icon icon-xs fa-google-plus"></span>
							<span>Google +</span>
						</a>
						*}>
								</div>
								<div class="divider-custom offset-top-30">
									<p class="small text-uppercase">Or</p>
								</div>
								<!-- RD Mailform-->
								<form class="rd-mailform form-register text-center offset-top-20">
									<div class="form-group">
										<label for="register-form-name" class="form-label form-label-outside">USERNAME</label>
										<input id="register-form-name" ng-blur="UserIsExist(name)" maxlength="20"   ng-model="name" type="text" name="u_name" data-constraints="@Required" class="form-control">
										<span  ng-show="username_isexist" class="small text-uppercase" style="color:red;" ><{$language.register_form_username_isexist}></span>
									</div>
									<div class="form-group">
										<label for="register-form-email" class="form-label form-label-outside">E-mail</label>
										<input id="register-form-email" ng-blur="EmailIsExist(email.text)" ng-model="email.text" type="email" name="u_email" data-constraints="@Required @Email" class="form-control">
										<span  ng-show="email_isexist" class="small text-uppercase" style="color:red;" ><{$language.register_form_email_isexist}></span>
									</div>
									<div class="form-group">
										<label for="register-form-password" class="form-label form-label-outside">Password</label>
										<input id="register-form-password"  maxlength="12" ng-model="u_passwd" type="password" name="u_passwd" data-constraints="@Required" class="form-control">
									</div>
									<div class="form-group">
										<label for="register-form-password-confirm" class="form-label form-label-outside">Confirm Password</label>
										<input id="register-form-password-confirm" maxlength="12" ng-model="u_passwd_confirm" type="password" name="u_passwd_confirm" data-constraints="@Required" class="form-control">
									</div>
									<div class="offset-top-50">
										<button type="submit" ng-click="register($event);" class="btn btn-primary btn-fullwidth btn-shadow">Register</button>
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