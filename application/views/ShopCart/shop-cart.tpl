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
      <main class="page-content" ng-controller="shopCartCtrl">
        <!-- Breadcrumbs & Page title-->
        <section class="text-center section-34 section-sm-60 section-md-top-100 section-md-bottom-105 bg-image bg-image-breadcrumbs">
          <div class="shell shell-fluid">
            <div class="range range-condensed">
              <div class="cell-xs-12 cell-xl-preffix-1 cell-xl-11">
                <p class="h3 text-white">Cart Page</p>
                <ul class="breadcrumbs-custom offset-top-10">
                  <li><a href="index.html">Home</a></li>
                  <li><a href="#">Pages</a></li>
                  <li class="active">Cart Page</li>
                </ul>
              </div>
            </div>
          </div>
        </section>

        <section class="section-50 section-sm-100">
          <div class="shell">
            <div class="range">
              <div class="cell-xs-12">
                <h4 class="text-left font-default"><span ng-bind="cartnums"></span>  Items in your cart</h4>
                <div class="table-responsive offset-top-10">
                  <table class="table table-shopping-cart">
                    <tbody>
                      <tr ng-repeat="item in items|filter as filterAry" ng-show="!item.del">
                        <td style="width: 1px">
                          <div class="form-group stepper-type-2">
                            <input type="number" data-zeros="true"  value="{{item.order_num}}" ng-model="$item.order_num" min="1" max="20" readonly class="form-control text-bold">
                          </div>
                        </td>
                        <td style="width: 1px">
                          <div class="inset-left-20">
                            <div class="product-image"><img src="/images/shop-cart-1-130x130.png" width="130" height="130" alt=""></div>
                          </div>
                        </td>
                        <td style="min-width: 340px;">
                          <div class="inset-left-30 text-left"><span class="product-brand text-italic">Fruits</span>
                            <div class="h5 text-sbold offset-top-0"><a href="shop-single.html" class="link-default">Fruit Mix Basket</a></div>
                          </div>
                        </td>
                        <td>
                          <div class="inset-left-20"><span class="h5 text-sbold">${{item.price}}</span></div>
                        </td>
                        <td>
                          <div class="inset-left-20"><a  class="icon icon-sm mdi mdi-window-close link-gray-lightest" ng-click="delete($index);$event.stopPropagation();"></a></div>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                <div class="offset-top-35 text-right">
                  <div class="h4 font-default text-bold"><small class="inset-right-5 text-gray-light">Total: </small> ${{Total(filterAry)}}</div><a href="#" class="btn btn-icon btn-icon-left btn-primary btn-shape-circle offset-top-35"><span class="icon icon-xs mdi mdi-cart-outline"></span><span>Proceed to checkout</span></a>
                </div>
              </div>
            </div>
          </div>
        </section>
      </main>
      <!-- Page Footers-->
	  <{include file="Frontend/footer.tpl"}>
    </div>
    <!-- Global Mailform Output-->
    <{include file="Frontend/gallery.tpl"}>
    <!-- Java script-->
	<{include file="Frontend/js.tpl"}>
  </body>
</html>