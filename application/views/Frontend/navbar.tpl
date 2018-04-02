<div class="rd-navbar-wrap rd-navbar-default "  ng-controller="navCtrl" >
	<nav data-layout="rd-navbar-fixed w3-card" data-sm-layout="rd-navbar-fixed" data-md-device-layout="rd-navbar-fixed" data-lg-layout="rd-navbar-static" data-lg-device-layout="rd-navbar-static" data-stick-up-clone="false" data-md-stick-up-offset="100px" data-lg-stick-up-offset="150px" class="rd-navbar">

	<div class="shell shell-fluid">
	  <div class="rd-navbar-inner">
		<div class="rd-navbar-nav-wrap-outer">
		  <div class="rd-navbar-aside">
			<div class="rd-navbar-aside-content">
			  <!-- RD Navbar Panel-->
			  <div class="rd-navbar-panel rd-navbar-aside-left">
				<!-- RD Navbar Toggle-->
				<button data-rd-navbar-toggle=".rd-navbar-nav-wrap" class="rd-navbar-toggle"><span></span></button>
				<div class="cart-right-top "  >
					<div  class="link link-shop link-default" id="shopAlert">
						<span class="icon icon-sm mdi mdi-cart-outline"  ></span>
						<span class="hidden">(</span>
						<span class="label-inline big text-white cartnums hidden"   ng-model="cartnums" ng-change="change()" ng-bind = "cartnums"></span>
						<span class="hidden">)</span>
					</div>
				</div>
				<!-- RD Navbar Brand-->
					<a href="/" class="rd-navbar-brand brand" >
						<div class="brand-logo" >
							<img src="/images/brand-232x49.png"  style="margin-top:6px;" alt="" width="232" height="49"/>
						</div>
					</a>
			  </div>
			  <div class="rd-navbar-aside-right">
				<!-- RD Navbar Aside-->
				<ul class="list-links list-inline text-left">
				  <li>
					<div class="unit unit-horizontal unit-middle unit-spacing-xs">

					</div>
				  </li>
				</ul>
			  </div>
			</div>
		  </div>
		</div>
		<!-- RD Navbar Nav-->
		<div class="rd-navbar-nav-wrap" >
		  <!-- RD Navbar Shop-->

		  <!-- RD Navbar Nav-->
		  <ul class="rd-navbar-nav">
			<li>
				<a href="/"><{$mainpage_language_ary.Home}></a>
			</li>
			<li>
				<a href="/contacts"><{$mainpage_language_ary.contacts}></a>
			</li>

			<li>
				<a href="#"><{$mainpage_language_ary.Language}></a>
				<!-- RD Navbar Dropdown-->
				<ul class="rd-navbar-dropdown">
					<li >
						<a ng-click="setLanguage('en')"><img src="/images/icon/en.png"/> english</a>
					</li>
					<li>
						<a ng-click="setLanguage('zh-cn')"> <img src="/images/icon/zh-cn.png"/> 简体中文</a>
					</li>
				</ul>
			</li>
			<li  ng-show="islogin" >
				<a href="#"><{$mainpage_language_ary.Account}></a>
				<!-- RD Navbar Dropdown-->
				<ul class="rd-navbar-dropdown">
					<!--
					<li>
						<a href="/Food/orderList"><{$mainpage_language_ary.nav_user_orderlist}></a>
					</li>\
					-->
					<li>
						<a href="/profile"><{$mainpage_language_ary.Account}></a>
					</li>
					<li>
						<a ng-click="logout()"><{$mainpage_language_ary.logout}></a>
					</li>
				</ul>
			</li>
			<li  ng-show="islogin == false">
				<a href="/login/"><{$mainpage_language_ary.login}></a>
			</li>
		  </ul>
		  <div class="rd-navbar-aside-right">
			<ul class="list-links list-inline text-left">
			  <li>
				<div class="unit unit-horizontal unit-middle unit-spacing-xs">
				  <div class="unit-left"><span class="icon icon-circle icon-gray-dark icon-xxs mdi mdi-phone text-middle"></span></div>
				  <div class="unit-body">
					<address class="contact-info"><a href="callto:#" class="link-default link-xs"><{$website.phone}></a><span class="reveal-block text-base link-xs">Mon – Sat: 9:00–18:00</span></address>
				  </div>
				</div>
			  </li>
			  <li>
				<ul class="list-inline list-inline-sm">
				  <li><a href="" class="link-silver-light"><span class="icon icon-sm-mod-1 fa fa-facebook"></span></a></li>
				</ul>
			  </li>
			</ul>
		  </div>
		</div>
	  </div>
	</div>
  </nav>
</div>
