<main class="page-content"  ng-controller="contactsCtrl">
<!-- Breadcrumbs & Page title-->
<{include file="Frontend/breadcrumbs.tpl"}>
<section class="text-center text-sm-left section-50 section-sm-top-100 section-sm-bottom-100 this-white">
  <div class="shell">
	<div class="range range-xs-center  this-padding">
	  <div class="cell-md-8">
		<h4 class="font-default text-center"><{$language.text_contacts}></h4>

		  <form id="frmContact" data-form-output="form-output-global" data-form-type="contact" class="rd-mailform form-contact-line text-left offset-top-35">
			  <div class="form-inline-flex">
				  <div class="form-group">
					  <label for="contact-name" class="form-label form-label-outside"><{$language.text_name}></label>
					  <input id="contact-name" ng-model="co_name" type="text" placeholder="<{$language.text_enter_name}>" name="name" data-constraints="@Required" class="form-control">
				  </div>
				  <div class="form-group">
					  <label for="contact-phone" class="form-label form-label-outside"><{$language.text_phone}></label>
					  <input id="contact-phone" ng-model="co_phone" type="text" placeholder="<{$language.text_enter_phone}>" name="phone" data-constraints="@Numeric @Required" class="form-control">
				  </div>
			  </div>
			  <div class="form-group offset-top-15">
				  <label for="message" class="form-label form-label-outside"><{$language.text_your_message}></label>
				  <textarea id="message" ng-model="co_message" placeholder="<{$language.text_enter_your_message}>" name="message" data-constraints="@Required" class="form-control"></textarea>
			  </div>
			  <div class="offset-top-15">
				  <div class="form-inline-flex">
					  <div class="form-group">
						  <label for="contact-email-2" class="form-label form-label-outside"><{$language.text.email}></label>
						  <input id="contact-email-2"  ng-model="co_email" type="email" placeholder="<{$language.text_enter_email}>" name="email" data-constraints="@Email @Required" class="form-control">
					  </div>
					  <div class="form-group">
						  <input type="submit" name="btn_send"  class="btn btn-primary btn-fullwidth" value="<{$language.button_text_send}>">
					  </div>
				  </div>
			  </div>
		  </form>

	  </div>
	  <div class="cell-md-4 offset-top-50 offset-md-top-0 text-left">
		<aside class="inset-lg-left-70">
		  <div class="range">
			<div class="cell-xs-6 cell-md-12">
			  <div class="h6 text-uppercase"><{$language.text_your_follow_us}></div>
			  <div class="text-subline offset-top-15"></div>
			  <div class="offset-top-25">
				<ul class="list-inline">
				  <li><a href="<{$website.fbfanspage}>" class="icon icon-xs link-gray-light fa-facebook"></a></li>
				</ul>
			  </div>
			</div>
			<div class="cell-xs-6 cell-md-12 offset-top-50 offset-xs-top-0 offset-md-top-50">
			  <div class="h6 text-uppercase"><{$language.text_phone}></div>
			  <div class="text-subline offset-top-15"></div>
			  <div class="offset-top-25">
				<div class="unit unit-horizontal unit-middle unit-spacing-xs">
				  <div class="unit-left"><span class="icon icon-xs icon-primary text-middle mdi mdi-phone"></span></div>
				  <div class="unit-body"><a href="callto:#" class="link-default"><{$website.phone}></a></div>
				</div>
			  </div>
			</div>
			<div class="cell-xs-6 cell-md-12 offset-top-50 offset-xs-top-0 offset-md-top-50">
			  <div class="h6 text-uppercase"><{$language.text_email}></div>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $('form').submit(function(event) {
            event.preventDefault();
                $.ajax({
                    type: "POST",
                    url:sendContact,
                    data: $('#frmContact').serialize(),
                    dataType: 'json',
                    success: function (msg) {
                        if(msg){
                            $("#frmContact")[0].reset();
                            var obj = {
                                message :'Successfully'
                            };
                            dialog(obj)
                        }else{

                        }

                    }
                });
            return false;
        });
    });
</script>