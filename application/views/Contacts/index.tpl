<main class="page-content"  ng-controller="contactsCtrl">
<!-- Breadcrumbs & Page title-->
<{include file="Frontend/breadcrumbs.tpl"}>
<section class="text-center text-sm-left section-50 section-sm-top-100 section-sm-bottom-100">
  <div class="shell">
	<div class="range range-xs-center">
	  <div class="cell-md-8">
		<h4 class="font-default text-center">Get in Touch</h4>
		<p class="text-center">We are available 24/7 by fax, e-mail or by phone. You can also use our quick contact form to ask a question about our services that we offer on a regular basis. We would be pleased to answer your questions.</p>
		<!-- RD Mailform-->
		<form data-form-output="form-output-global" data-form-type="contact" method="post" action="bat/rd-mailform.php" class="rd-mailform form-contact-line text-left offset-top-35">
		  <div class="form-inline-flex">
			<div class="form-group">
			  <label for="contact-name" class="form-label form-label-outside">Name</label>
			  <input id="contact-name" ng-model="co_name" type="text" placeholder="Enter your name" name="name" data-constraints="@Required" class="form-control">
			</div>
			<div class="form-group">
			  <label for="contact-phone" class="form-label form-label-outside">Phone</label>
			  <input id="contact-phone" ng-model="co_phone" type="text" placeholder="Enter phone" name="phone" data-constraints="@Numeric @Required" class="form-control">
			</div>
		  </div>
		  <div class="form-group offset-top-15">
			<label for="message" class="form-label form-label-outside">your message</label>
			<textarea id="message" ng-model="co_message" placeholder="Write your message here" name="message" data-constraints="@Required" class="form-control"></textarea>
		  </div>
		  <div class="offset-top-15">
			<div class="form-inline-flex">
			  <div class="form-group">
				<label for="contact-email-2" class="form-label form-label-outside">E-mail</label>
				<input id="contact-email-2"  ng-model="co_email" type="email" placeholder="Enter your email" name="email" data-constraints="@Email @Required" class="form-control">
			  </div>
			  <div class="form-group">
				<button type="submit" ng-click="send();$event.preventDefault();" class="btn btn-primary btn-fullwidth">Send message</button>
			  </div>
			</div>
		  </div>
		</form>
	  </div>
	  <div class="cell-md-4 offset-top-50 offset-md-top-0 text-left">
		<aside class="inset-lg-left-70">
		  <div class="range">
			<div class="cell-xs-6 cell-md-12">
			  <div class="h6 text-uppercase">Follow us</div>
			  <div class="text-subline offset-top-15"></div>
			  <div class="offset-top-25">
				<ul class="list-inline">
				  <li><a href="<{$website.fbfanspage}>" class="icon icon-xs link-gray-light fa-facebook"></a></li>
				</ul>
			  </div>
			</div>
			<div class="cell-xs-6 cell-md-12 offset-top-50 offset-xs-top-0 offset-md-top-50">
			  <div class="h6 text-uppercase">Phone</div>
			  <div class="text-subline offset-top-15"></div>
			  <div class="offset-top-25">
				<div class="unit unit-horizontal unit-middle unit-spacing-xs">
				  <div class="unit-left"><span class="icon icon-xs icon-primary text-middle mdi mdi-phone"></span></div>
				  <div class="unit-body"><a href="callto:#" class="link-default"><{$website.phone}></a></div>
				</div>
			  </div>
			</div>
			<div class="cell-xs-6 cell-md-12 offset-top-50 offset-xs-top-0 offset-md-top-50">
			  <div class="h6 text-uppercase">E-mail</div>
			  <div class="text-subline offset-top-15"></div>
			  <div class="offset-top-25">
				<div class="unit unit-horizontal unit-middle unit-spacing-xs">
				  <div class="unit-left">
					<span class="icon icon-xs icon-primary text-middle mdi fa-envelope"></span>
				</div>
				  <div class="unit-body"><a href="mailto:<{$website.email}>" class="link-default"><{$website.email}></a></div>
				</div>
			  </div>
			</div>
		  </div>
		</aside>
	  </div>
	</div>
  </div>
</section>
</main>