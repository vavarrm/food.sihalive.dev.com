<!DOCTYPE html>
<html lang="en" class="wide wow-animation" ng-app="sihaliveApp">
  <head>
    <!-- Site Title-->
    <title><{$language.website_name}>-<{$language.website_title_menu}></title>
    <{include file="Frontend/meta.tpl"}>
    <link rel="icon" href="/images/favicon.ico" type="image/x-icon">
    <!-- Stylesheets-->
    <{include file="Frontend/css.tpl"}>
		<!--[if lt IE 10]>
    <div style="background: #212121; padding: 10px 0; box-shadow: 3px 3px 5px 0 rgba(0,0,0,.3); clear: both; text-align:center; position: relative; z-index:1;"><a href="http://windows.microsoft.com/en-US/internet-explorer/"><img src="/images/ie8-panel/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today."></a></div>
    <script src="js/html5shiv.min.js"></script>
		<![endif]-->
  </head>
  <body>
    <!-- Page-->
    <div class="page text-center">
      <header class="page-head">
        <!-- RD Navbar-->
        <{include file="Frontend/navbar.tpl"}>
      </header>
      <!-- Page Content-->
      <main class="page-content" ng-controller="productPageCtrl">
        <!-- Breadcrumbs & Page title-->
        <section class="text-center section-34 section-sm-60 section-md-top-100 section-md-bottom-105 bg-image bg-image-breadcrumbs">
          <div class="shell shell-fluid">
            <div class="range range-condensed">
              <div class="cell-xs-12 cell-xl-preffix-1 cell-xl-11">
                <p class="h3 text-white">Single Product</p>
                <ul class="breadcrumbs-custom offset-top-10">
                  <li><a href="index.html">Home</a></li>
                  <li><a href="#">Pages</a></li>
                  <li class="active">Single Product</li>
                </ul>
              </div>
            </div>
          </div>
        </section>

        <section class="section-50 section-sm-100">
          <div class="shell">
            <div class="range range-xs-center">
              <div class="cell-sm-6 text-lg-left">
                <div data-arrows="false" data-dots="false" data-loop="true" data-swipe="true" data-items="1" data-child="#child-carousel" data-for="#child-carousel" class="slick-slider carousel-parent">
                  <div class="item"><img src="/images/product-01-542x448.png" alt="" width="542" height="448"/>
                  </div>
                  <div class="item"><img src="/images/product-02-542x448.png" alt="" width="542" height="448"/>
                  </div>
                  <div class="item"><img src="/images/product-05-542x448.png" alt="" width="542" height="448"/>
                  </div>
                </div>
                <div id="child-carousel" data-for=".carousel-parent" data-arrows="false" data-loop="true" data-dots="false" data-swipe="true" data-items="3" data-xs-items="3" data-sm-items="3" data-md-items="3" data-lg-items="3" data-slide-to-scroll="1" data-center-mode="true" class="slick-slider carousel-child custom-pagination">
                  <div class="item">
                    <div><img src="/images/product-thumb-01-84x69.png" alt="" width="84" height="69"/>
                    </div>
                  </div>
                  <div class="item">
                    <div><img src="/images/product-thumb-02-84x69.png" alt="" width="84" height="69"/>
                    </div>
                  </div>
                  <div class="item">
                    <div><img src="/images/product-thumb-05-84x69.png" alt="" width="84" height="69"/>
                    </div>
                  </div>
                </div>
              </div>
              <div class="cell-sm-6 cell-lg-5 text-sm-left offset-top-60 offset-sm-top-0">
                <div class="reveal-xs-flex range-xs-middle range-xs-center range-sm-left">
                  <h4 class="font-default">Fruit Mix Basket</h4>
                  <div class="inset-xs-left-50 offset-top-0">
                    <div class="team-member-position team-member-position-primary"><span class="big text-italic text-middle">Hot</span></div>
                  </div>
                </div>
                <div class="offset-top-15">
                  <p>Fruit / Sweet / Basket / Tropical / Gift / Tray</p>
                </div>
                <div class="offset-top-15">
                  <div class="group-sm"><a href="#" class="link-zoom"><img src="/images/shop-single-01-57x21.png" alt="" width="57" height="21"/></a><a href="#" class="link-zoom"><img src="/images/shop-single-02-52x21.png" alt="" width="52" height="21"/></a><a href="#" class="link-zoom"><img src="/images/shop-single-03-54x21.png" alt="" width="54" height="21"/></a></div>
                </div>
                <hr class="offset-top-30 veil reveal-sm-block">
                <div class="offset-top-30">
                  <div class="responsive-tabs responsive-tabs-shop responsive-tabs-horizontal">
                    <ul class="resp-tabs-list">
                      <li><span class="price" data-price="25.90">$25.90</span><span class="icon icon-circle">Big</span></li>
                      <li><span class="price" data-price="13.90">$13.90</span><span class="icon icon-circle">Mini</span></li>
                    </ul>
                    <div class="resp-tabs-container">
                      <div>
                        <!-- Linear progress bar-->
                        <div data-to="43" class="progress-linear">
                          <div class="progress-header clearfix">
                            <div class="text-left">
                              <p class="text-uppercase">energy value</p>
                            </div>
                          </div>
                          <div class="progress-bar-linear-wrap offset-top-5">
                            <div class="progress-bar-linear bg-primary-lighter"></div><span class="progress-text">510kcal</span><span class="text-bold progress-value">43</span>
                          </div>
                        </div>
                        <!-- Linear progress bar-->
                        <div data-to="59" class="progress-linear">
                          <div class="progress-header clearfix">
                            <div class="text-left">
                              <p class="text-uppercase">proteins</p>
                            </div>
                          </div>
                          <div class="progress-bar-linear-wrap offset-top-5">
                            <div class="progress-bar-linear bg-primary"></div><span class="progress-text">44g</span><span class="text-bold progress-value">59</span>
                          </div>
                        </div>
                        <!-- Linear progress bar-->
                        <div data-to="20" class="progress-linear">
                          <div class="progress-header clearfix">
                            <div class="text-left">
                              <p class="text-uppercase">carbohydrates</p>
                            </div>
                          </div>
                          <div class="progress-bar-linear-wrap offset-top-5">
                            <div class="progress-bar-linear bg-secondary"></div><span class="progress-text">50g</span><span class="text-bold progress-value">20</span>
                          </div>
                        </div>
                      </div>
                      <div>
                        <!-- Linear progress bar-->
                        <div data-to="30" class="progress-linear">
                          <div class="progress-header clearfix">
                            <div class="text-left">
                              <p class="text-uppercase">energy value</p>
                            </div>
                          </div>
                          <div class="progress-bar-linear-wrap offset-top-5">
                            <div class="progress-bar-linear bg-primary-lighter"></div><span class="progress-text">360kcal</span><span class="text-bold progress-value">30</span>
                          </div>
                        </div>
                        <!-- Linear progress bar-->
                        <div data-to="39" class="progress-linear">
                          <div class="progress-header clearfix">
                            <div class="text-left">
                              <p class="text-uppercase">proteins</p>
                            </div>
                          </div>
                          <div class="progress-bar-linear-wrap offset-top-5">
                            <div class="progress-bar-linear bg-primary"></div><span class="progress-text">24g</span><span class="text-bold progress-value">39</span>
                          </div>
                        </div>
                        <!-- Linear progress bar-->
                        <div data-to="15" class="progress-linear">
                          <div class="progress-header clearfix">
                            <div class="text-left">
                              <p class="text-uppercase">carbohydrates</p>
                            </div>
                          </div>
                          <div class="progress-bar-linear-wrap offset-top-5">
                            <div class="progress-bar-linear bg-secondary"></div><span class="progress-text">40g</span><span class="text-bold progress-value">15</span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="offset-top-45" >
                  <div class="group-sm">
                    <div class="stepper-type-1">
                      <input type="number" id="order_num" data-zeros="true" value="1" min="1" max="20" readonly class="form-control">
                    </div>
					<a ng-click="click(1);$event.stopPropagation();" class="text-top btn btn-primary btn-shape-circle btn-min-width-sm">
						<span>Order Online</span>
					</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        <section class="text-left">
          <div class="responsive-tabs responsive-tabs-horizontal responsive-tabs-horizontal-background">
            <ul class="resp-tabs-list shell">
              <li>Description</li>
              <li>Delivery</li>
            </ul>
            <div class="resp-tabs-container">
              <div>
                <p class="text-base">The Fruit Mix Basket is a colorful and delicious way to share in the celebration of the holiday season with friends, family, and co-workers! A beautiful natural woven basket is loaded full of the following fruits: 3 Braeburn Apples, 1 Granny Smith Apple, 3 Comice Pears, 1 Red Pear, 5 to 6 Mandarin Oranges with Leaves, 2 Navel Oranges, and 1 Ruby Grapefruit and others.</p>
                <div class="unit unit-horizontal unit-spacing-xs offset-top-20">
                  <div class="unit-left">
                    <p class="h6">Ingredients:</p>
                  </div>
                  <div class="unit-body">
                    <p>Apples / Pears / Oranges / Grapefruits / Kiwis</p>
                  </div>
                </div>
              </div>
              <div>
                <p class="text-base">Here you can read some details about a nifty little lifecycle of your order's journey from the time you place your order to your new treasures arriving at your doorstep. At first, you choose the product you like. Then you put into your shopping cart and pass the checkout process in a few clicks. Our store offers several payment and delivery methods, so after placing your order, you'll have an opportunity to choose which one is the most convenient for you.</p>
              </div>
            </div>
          </div>
        </section>
      </main>
      <!-- Page Footers-->
	  <{include file="Frontend/footer.tpl"}>
	  <div class="page-foot text-center text-lg-left footer-light context-dark">
	  <section class="section-top-45 section-bottom-40">
	  <div class="col-xs-12">
		<div class="grid-element grid-element-outline cart-details-under">
		  <h6>1/1</h6>
		  <p>Welcome to our wonderful world. We sincerely hope that each and every user entering our website will find exactly what he/she is looking for. With advanced features of activating account and new login widgets, you will definitely have a great experience of using our web page. It will tell you lots of interesting things about our company, its products and services, highly professional staff and happy customers.</p>
		</div>
	  </div>
	  </section>
	  </div>
    </div>
    <!-- Global Mailform Output-->
    <div id="form-output-global" class="snackbars"></div>
    <!-- PhotoSwipe Gallery-->
    <{include file="Frontend/gallery.tpl"}>
    <!-- Java script-->
	<{include file="Frontend/js.tpl"}>
  </body>
</html>