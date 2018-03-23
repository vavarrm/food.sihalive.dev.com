
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">

<main class="page-content this-white" ng-controller="userCtrl" ng-init="init()"  style="min-height: 500px" >

	<!-- Breadcrumbs & Page title-->
	<{include file="Frontend/breadcrumbs.tpl"}>
	<section class="bg-white container this-margin-top this-margin-button " style="margin-bottom: 80px">

		<div class="row">
			<div class="col-sm-3 ">
				<img src="/images/icon/phone.png" class="img-responsive this-hide-small"/>

			</div>
			<div class="col-sm-6 this-padding " style="text-align: left" >

				<h5 style="font-size: 20px"><span class="icon icon-sm icon-primary fa fa-comment-o"
													 style="font-size:50px"></span>
					 <{$mainpage_language_ary.Verif_you_phone}> </h5>
				<p style="color: #302f35">   <{$mainpage_language_ary.Type_verification_code_you_received_in_sms}></p>
				<span style="color: #302f35; font-size: 12px"><{$mainpage_language_ary.Please_check_your_phone_number}>
					</span>
				<form method="post" action="" >
					<input type="text" class="form-control" style="border: 1px  solid silver" placeholder="Enter verification code" name="txtcode">

					<a href="#send">
						<span style="margin-top: 10px; padding-top: 10px; color: orangered">  <{$mainpage_language_ary.Resend_verification_code}> </span>
					</a>
					<br/>
					<br/>
					<input type="submit" class="this-btn this-btn-this" value="<< <{$mainpage_language_ary.Back}>" style="margin-top: 5px;
					background: silver!important;"
						   name="verify">
					<input type="submit" class="this-btn this-btn-this this-right" value=" <{$mainpage_language_ary.Verify}> >> "style="margin-top:5px"
						   name="verify">

				</form>
			</div>
		</div>



	</section>



</main>

</script>
