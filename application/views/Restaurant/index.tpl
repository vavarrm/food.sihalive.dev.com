<!-- Page Content-->
<style>
    body{
        background: #eff2f5!important;
    }
    #sidebar{
        will-change: min-height;
    }

    #sidebar__inner{
        transform: translate(0, 0); /* For browsers don't support translate3d. */
        transform: translate3d(0, 0, 0);
        will-change: position, transform;
    }



</style>
<{$lat=""}>
<{$lng=""}>
<{$r_name=""}>
<{$r_about=""}>
<main class="page-content " style=""  ng-controller="shopCartCtrl"  >
    <!-- Breadcrumbs & Page title-->
    <{include file="Frontend/breadcrumbs.tpl"}>
    <section class=" text-left container " >
        <div class="row ">
            <div class="this-container  this-text-white " style="height: 40px; background: #f75d34;border-radius:4px"  >
                <div class="col-sm-12 this-center" style="padding: 0px">
                    <div class="col-xs-3 col-md-3 this-padding">
                        <span class="fa fa-home" style="font-size: 20px"></span>
                        <span class="fa fa-arrow-right this-hide-small" style="padding-left: 20px"> Home </span>
                    </div>
                    <div class="col-xs-3 col-md-3 this-padding this-white" style="margin-top:2px; border-radius: 2px">
                        <span class=" fa fa-shopping-cart" style="font-size: 20px"></span>
                        <span class="fa fa-arrow-right this-hide-small " style="padding-left: 20px">  ORDER </span>
                    </div>
                    <div class="col-xs-3 col-md-3 this-padding " >
                        <span class="fa fa-credit-card" style="font-size: 20px"></span>
                        <span class="fa fa-arrow-right this-hide-small" style="padding-left:20px"> CHECK OUT</span>
                    </div>
                    <div class="col-xs-3 col-md-3 this-padding">
                        <span class="fa fa-print" style="font-size: 20px"></span>
                        <span class="this-hide-small">RECEIPT</span>
                    </div>
                </div>
            </div>
            <div class="container "  id="main-content"  style="padding: 0px" >
                <div class="col-sm-12" style="padding: 0px;  height: auto "  >
                    <div class="col-sm-9  this-margin-top " style="padding: 0px; height: 100%; border: 1px
                    solid silver ;
                    margin-bottom: 20px; border-radius: 5px">

                        <ul class="nav nav-tabs this-white "  style=" border: 0px!important;" >
                            <li class="active"><a data-toggle="tab" href="#home">Profile</a></li>
                            <li><a data-toggle="tab" href="#menu1">MAP </a></li>
                            <li><a data-toggle="tab" href="#open">Opening </a></li>
                            <li><a data-toggle="tab" href="#about">About </a></li>
                        </ul>

                        <div class="tab-content" style="background: #f1f1f1!important;" id="cover" >
                            <div id="home" class="tab-pane fade in active "  >


                                <div class="col-sm-4 this-hide-small " style=" margin-top: 4px;position:relative;z-index: 0;" id="sidebar"   >

                                    <div id="sidebar__inner">
                                        <ul class="list-group" style="border:none!important;"  >
                                            <div  style="width:auto"  id="pro_left"  >

                                                <li class="list-group-item" id="menu_clcik" style="color: white;"> <span class="glyphicon glyphicon-th"></span> MENU </li>
                                                <div id="menu__">
                                                    <{foreach from=$list_category_by_restaurant item=row key=index}>
                                                    <li class="list-group-item" style="cursor: pointer; color: black">
                                                        <a href="#Id<{$row.ca_id}>">
                                                            <{$row.ca_name}>
                                                            <i class="ion-ios-arrow-right" style="right: 0px; text-align: right; float: right">
                                                                <span class="glyphicon glyphicon-menu-right" style="font-size: 12px; color: silver"></span>
                                                            </i>
                                                        </a>
                                                    </li>

                                                    <{/foreach}>

                                                </div>
                                            </div>

                                        </ul>
                                    </div>
                                </div>
                                <div class="col-sm-8" style="padding: 0px;  cursor: pointer;overflow: auto; " id="mainCol" ng-controller="productPageCtrl"  >
                                    <div id="content">
                                        <form class="form this-white this-hide-large" style="padding: 5px; ">
                                            <select class="form-control input-sm  " style="background: white!important;" >
                                                <{foreach from=$category item=row key=index}>
                                                <option value="<{$row.ca_id}>" > <{$row.ca_name}> </option>
                                                <{/foreach}>
                                            </select>
                                        </form>
                                        <{foreach from=$foodList item=row key=index}>
                                        <div class="col-xs-12 col-md-4  " style=";overflow-x: auto; overflow-y: hidden; min-height: 180px; padding: 10px" id="Id<{$row.f_ca_id}>">
                                            <div class="col-sm-12 restaurant  " style="height:auto;min-height: 90px; padding: 0px!important; " >
                                                <div class="col-xs-12 col-md-12 " >

                                                    <img src="/images/category-1-310X260.png" alt="" width="250"
                                                         height="200" class="img-responsive img-circle
                                                         reveal-inline-block"  data-toggle="modal" data-target="#<{$row.f_id}>"/>

                                                </div>
                                                <div class="col-sx-12 col-md-12 " style="padding: 5px; "  >
                                                    <div style="margin-top: -25px; position: relative" >
                                                        <{$row.f_name}> <{$row.f_ca_id}>
                                                    </div>
                                                    <div class="col-sm-12 " id="m_<{$row.ca_id}>"  style="text-align: center; margin-top: 10px">
                                                        <button class="this-btn this-btn-this this-small"
                                                                data-toggle="modal" data-target="#<{$row.f_id}>"

                                                                style="font-size: 12px; font-weight:normal;
                                              padding: 5px; border-radius: 3px; height: 30px;  margin-top: -10px;
                                              background: #f75d34">
                                                            <{$row.f_large_price}> $
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    <!--  Open Modal Order --->

                                        <div id="<{$row.f_id}>" class="modal fade this-center"  role="dialog"
                                             style="margin-top: 30px; padding: 0px!important; margin: 0px;
                                                border-radius:0px!important; margin-top: 50px">
                                            <div class="modal-dialog" style="border-radius: 0px">
                                                <div class="modal-content ">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        <h3><{$row.f_name}></h3>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="col-sm-6">
                                                                <span onclick="document.getElementById('<{$row.f_id}>').style.display='none'"></span>

                                                                <img src="/images/category-1-310X260.png" alt=""  class="img-responsive img-circle reveal-inline-block"/>

                                                            </div>
                                                            <div class="col-sm-6">
                                                                <form>
                                                                    <p>Price : <{$row.f_large_price}> $ </p>
                                                                    <p>Quantity</p>
                                                                    <div class="stepper-type-1">
                                                                        <div class="stepper "><input type="number" data-zeros="true" value="1" min="1" max="20" readonly="" class="form-control text-bold stepper-input"><span class="stepper-arrow up"></span><span class="stepper-arrow down"></span></div>
                                                                    </div>

                                                                    <hr class="offset-top-50">
                                                                    <button type="button"
                                                                            ng-click="click(<{$row.f_id}>, '1',
                                                                   '<{$row.f_large_price}>','<{$row.f_name}>');$event.stopPropagation();"
                                                                            ng-model="$item.order_num"
                                                                            class="this-btn this-btn-this this-right
                                                                            this-margin-top "  >

                                                                        ADD TO CART
                                                                    </button>
                                                                </form>

                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                        <!--Close Modal -->
                                        <{/foreach}>
                                    </div>
                                </div>

                            </div>

                            <div id="menu1" class="tab-pane fade">

                                <div id="hideMapOverflow">
                                    <div id="map_canvas" style="height:100%"></div>
                                </div>
                            </div>


                            <div id="open" class="tab-pane fade in ">
                                <div class="this-container this-padding">
                                    <h5> Opening Hours</h5>
                                    <hr class="offset-top-20">
                                    <ul class="this-ul">


                                        <{foreach from=$operation item=row }>


                                        <li>
                                            <div class="row">

                                                <div class="col-sm-4">
                                                    + <{$row.open_day}>
                                                </div>
                                                <div class="col-sm-4">
                                                    <{$row.open_time_start}>  - <{$row.open_time_end}>
                                                </div>

                                            </div>
                                        </li>

                                        <{/foreach}>

                                    </ul>

                                </div>

                            </div>
                            <div id="about" class="tab-pane fade">
                                <div class="this-container this-padding">
                                    <h4> <{$r_name}> </h4>
                                    <hr class="offset-top-20">

                                    <{$r_about}>

                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-sm-3 this-hide-small this-white " style="margin-top: 5px; margin-bottom: 10px; "
                         ng-controller="shopCartCtrl">
                        <div id="inv">
                            <div class="row" id="inv__">
                                <div class="this-container this-white" style="background:#f16121;height:
                                            40px; color:
                                            white; padding: 10px; ">
                                    Order Information
                                </div>
                                <div class="col-sm-12 this-white " style="border-bottom: 1px solid silver ; padding: 10px; border-left: 1px solid white; margin-top: 6px">
                                    <div class="inner line-top relative">


                                        <div class="item-order-wrap" style="border-top: 1px solid silver" >
                                            <div class="item-order-list item-row"  ng-repeat="item in items|filter as filterAry" ng-show="!item.del" >
                                                <div class="col-sm-9"  >
                                                                <span  class="grid-element-mod-2"　ng-bind="item.f_name">
                                                                    {{item.f_name}}
                                                                </span>
                                                </div>
                                                <div class="col-sm-3">
                                                    <p class="uk-text-small">
                                                        <span class="base-price" ng-bind="'$'+item.price"></span>
                                                    </p>
                                                </div>
                                                <span>
                                                            <input data-index="{{$index}}" data-price="{{item.price}}" type="number" data-zeros="true"  value="{{item.order_num}}" ng-model="$item.order_num" min="1" max="20" readonly class="form-control text-bold">

                                                            </span>
                                                <span class="glyphicon glyphicon-trash"
                                                      style="font-size:15px; cursor: pointer" ng-click="delete
                                                                  ($index);
                                                                  $event.stopPropagation();"></span>
                                                <div class="clear">
                                                </div>
                                            </div>
                                            <div class="summary-wrap" style="border-top: 1px solid silver">
                                                <div class="row">
                                                    <div class="col-md-6 col-xs-6 text-right ">Sub Total</div>
                                                    <div class="col-md-6 col-xs-6 text-right cart_subtotal">
                                                        <div class="offset-top-0"><span class="h5 text-sbold">$<span>
                                                                    <span data-index="{{$index}}"
                                                                          data-subtotal="{{item.subtotal}}"
                                                                          class="h5 text-sbold subtotal" ng-model="item.subtotal"
                                                                          ng-bind="item.subtotal"
                                                                          ng-init="item.subtotal=(item.price*item.order_num)">
                                                                        {{item.subtotal}}
                                                                    </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 col-xs-6 text-right ">Delivery Fee</div>
                                                    <div class="col-md-6 col-xs-6 text-right ">$1.00</div>
                                                </div>
                                                <div class="row cart_total_wrap bold">
                                                    <div class="col-md-6 col-xs-6  text-right">Total</div>
                                                    <div class="col-md-6 col-xs-6  text-right cart_total">
                                                        <span class="total" ng-bind="'Total:'+Total(filterAry)"></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="summary-wrap this-hide" style="border-top: 1px
                                                        solid silver">
                                                <{foreach from=$r_id item=row key=index}>
                                            <input type="text" id="r_id" value="<{$row.r_id}>"
                                                   name="o_r_id" style="display: none"
                                                   class="form-control form-control-has-validation form-control-last-child ">
                                                <{/foreach}>
                                                <input type="text"  id="message" placeholder="<{$shopLanguageAry.shopcart_delivery_message_placeholder}>" name="o_messge"
                                                       class="form-control form-control-has-validation
                                                                   form-control-last-child " style="margin-top: 10px">

                                                <div style="margin-top: 10px">
                                                    <select class="form-control input-sm" >
                                                        <option value="Delivery"> Delivery</option>

                                                    </select>
                                                </div>
                                                <div class="" style="margin-top: 10px">
                                                    <center>
                                                        <button  ng-click="checkout();$event.preventDefault();" class="this-btn this-btn-this">
                                                            <span class="glyphicon glyphicon-log-out"></span> <{$shopLanguageAry.shopcart_proceed_to_checkout}></button>
                                                    </center>
                                                </div>
                                            </div>
                                            <div class="" style="margin-top: 10px">
                                                <center>
                                                    <a href="/ShopCart">
                                                        <button   class="this-btn this-btn-this">
                                                            <span class="glyphicon glyphicon-log-out"></span>
                                                            结帐 </button>
                                                    </a>
                                                </center>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>




</main>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js"></script>
<script type="text/javascript" src="/js/ResizeSensor.js"></script>
<script type="text/javascript" src="/js/sticky-sidebar.js"></script>
<script>

    jQuery(function($) {

        var $inv=$('#inv');

        if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) )
        {
            $cache.removeClass("stuck");
            $inv.addClass('this-hide');
            $inv.hide();

        }
</script>
<script type="text/javascript">

    var sidebar = new StickySidebar('#sidebar', {
        topSpacing: 20,
        bottomSpacing: 20,
        leftSpacing:20,
        rightSpacing:20,
        containerSelector:  '#main-content',
        innerWrapperSelector: '#sidebar__inner',

    });

    var inv = new StickySidebar('#inv', {
        topSpacing: 20,
        bottomSpacing: 20,
        containerSelector: '#main-content',
        innerWrapperSelector: '#inv__'
    });

</script>
<script type="text/javascript">

    var lat="<{$lat}>";
    var lang="<{$lng}>";
    var r_name="<{$r_name}>";

    // The following example creates a marker in Stockholm, Sweden using a DROP

    try {

        var point = {
            lat: lat,
            lng: lang,
        };
        var markerSize = {
            x: 22,
            y: 40
        };


        google.maps.Marker.prototype.setLabel = function(label) {
            this.label = new MarkerLabel({
                map: this.map,
                marker: this,
                text: label
            });
            this.label.bindTo('position', this, 'position');
        };

        var MarkerLabel = function(options) {
            this.setValues(options);
            this.span = document.createElement('span');
            this.span.className = 'map-marker-label';
        };

        MarkerLabel.prototype = $.extend(new google.maps.OverlayView(), {
            onAdd: function() {
                this.getPanes().overlayImage.appendChild(this.span);
                var self = this;
                this.listeners = [
                    google.maps.event.addListener(this, 'position_changed', function() {
                        self.draw();
                    })
                ];
            },
            draw: function() {
                var text = String(this.get('text'));
                var position = this.getProjection().fromLatLngToDivPixel(this.get('position'));
                this.span.innerHTML = text;
                this.span.style.left = (position.x - (markerSize.x / 2)) - (text.length * 3) + 10 + 'px';
                this.span.style.top = (position.y - markerSize.y + 40) + 'px';
            }
        });

        function initialize() {
            var myLatLng = new google.maps.LatLng(point.lat, point.lng);
            var gmap = new google.maps.Map(document.getElementById('map_canvas'), {
                zoom:16,
                center: myLatLng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });
            var myMarker = new google.maps.Marker({
                map: gmap,
                position: myLatLng,
                label: r_name,
                draggable: true
            });
        }

        initialize();
    } catch (e) {
        alert(e);
    }

    $("#sidebar ul li a[href^='#']").on('click', function(e) {

        // prevent default anchor click behavior
        e.preventDefault();

        // store hash
        var hash = this.hash;

        // animate
        $('html, body').animate({
            scrollTop: $(hash).offset().top
        }, 1000, function(){

            // when done, add hash to url
            // (default click behaviour)
            window.location.hash = hash;
        });

    });
</script>
