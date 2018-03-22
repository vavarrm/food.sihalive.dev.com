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

	button.addCart
	{
		font-size: 12px; 
		font-weight:normal;
		padding: 5px; 
		border-radius: 3px; 
		height: 30px;  
		margin-top: -10px;
		background: #f75d34
	}
    .ac-wrapper {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background:transparent;
        z-index: 1001;
    }
    .popup {
        width: 100%;
        height: 100%;

        box-shadow: #64686e 0px 0px 3px 3px;
        -moz-box-shadow: #64686e 0px 0px 3px 3px;
        -webkit-box-shadow: #64686e 0px 0px 3px 3px;
        position: fixed;margin: 0px;
        padding: 0px;


    }
    main{
        min-height: 800px;
    }
    .tab-pane{
        margin-top: 20px!important;
    }

    .active{

        color:orangered;
    }

</style>
<{$lat=""}>
<{$lng=""}>
<{$r_name=""}>
<{$r_about=""}>
<main class="page-content " style=""  ng-controller="shopCartCtrl" ng-init="r_id='<{$r_id}>'" onload="geoFindMe()" >
    <div class="this-sidebar this-bar-block this-border-right this-animate-right" style="display:none;width:100%;" id="shopshowPage"   ng-controller="userAddressCtrl" ng-init="address_()">
        <button  class="this-bar-item this-large bg-primary " style="width: 100%;">
            <span class="icon icon-sm fa fa-arrow-circle-left" id="closeShopcart"></span>
            <span class="this-center ">
                <{$mainpage_language_ary.CART}> </span>
        </button>
        <div class="row cartright">

            <div class="col-sm-12 this-white hidden cartdiv" ng-show="items .length>0" style="text-align: left"  >
                <div class="inner line-top relative">
                    <div class="item-order-wrap" style="border-top: 1px solid silver" >
                        <div class="item-order-list item-row this-border-top"  ng-repeat="(key ,item) in items |
                        filter as filterAry" ng-show="!item.del" >
                            <div class="col-xs-8 col-md-8 this-margin-top"  ng-bind="item.f_name">
                            </div>
                            <div class="col-xs-4 col-md-4" >
                                <p class="uk-text-small" ng-bind="'$'+item.f_price"></p>
                            </div>
                            <span>
                            <input 	type="number"    data-id="{{item.f_id}}" data-price="{{item.f_price}}" ng-model="item.order_num"  min="1" max="20" readonly class="form-control text-bold order_num">
							</span>
                            <span 	class="glyphicon glyphicon-trash" style="font-size:15px; cursor: pointer" ng-click="delete($index); $event.stopPropagation();"></span>
                            <div class="clear"></div>
                        </div>
                        <div class="summary-wrap" style="border-top: 1px solid silver">
                            <div class="row cart_total_wrap bold this-right this-padding">
                                <div class="col-md-12   text-right cart_total this-large">
                                    <span><{$mainpage_language_ary.Total}>:</span>
                                    <span class="total" ng-bind="Total(filterAry)"></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 this-padding-0" style="padding: 0px">
                                <div class="form-inline-flex">
                                    <div class="form-group" >
                                    <div class="col-sm-12" style="padding: 0px">
                                        <label for="message" class=" form-label-outside rd-input-label"><{$shopLanguageAry.shopcart_delivery_position}></label>
                                        <select   class="form-control form-control-has-validation
                                        form-control-last-child " id="o_position_id">
                                            <option value="">請選擇</option>
                                            <option ng-repeat="row in data.book_address"
                                                    value="{{row.p_bookId}}" >{{row.u_p_b_titel}}</option>
                                        </select>
                                    </div>
                                    </div>
                                    <center>
                                       <a href="/user/maps">
                                           <img src="/images/icon/g_map.png"height="40" style="cursor: pointer"   >
                                       </a>
                                    </center>
                                    <div class="form-group ">
                                        <div class="col-sm-12" style="padding: 0px">
                                            <label for="message" class="form-label form-label-outside rd-input-label"><{$shopLanguageAry.shopcart_delivery_message}></label>
                                            <input type="text"  id="message" placeholder="<{$shopLanguageAry.shopcart_delivery_message_placeholder}>" name="o_messge"  class="form-control form-control-has-validation form-control-last-child ">
                                            <span class="form-validation"></span>
                                        </div>
                                    </div>

                                    <br/>
                                </div>
                                <div class=" form-inline-flex form-group">
                                    <div class="col-sm-12" style="padding: 0px">
                                        <input type="text"  id="o_address" placeholder="o_address"
                                               name="o_messge"  class="form-control form-control-has-validation form-control-last-child ">
                                        <span class="form-validation"></span>
                                    </div>
                                </div>

                                <div class="offset-top-15">
                                    <div class="form-inline-flex">
                                        <div class="form-group">
                                            <button ng-click="checkout();$event.preventDefault();"  class="btn btn-primary btn-fullwidth"><{$shopLanguageAry.shopcart_proceed_to_checkout}></button>
                                        </div>
                                    </div>
                                </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Breadcrumbs & Page title-->
    <{include file="Frontend/breadcrumbs.tpl"}>
    <section class=" text-left container " >
        <div class="row ">
            <div class="this-container  this-text-white " style="height: 40px; background: #f75d34;border-radius:4px"  >
                <div class="col-sm-12 this-center" style="padding: 0px">
                    <div class="col-xs-3 col-md-3 this-padding">
                        <span class="fa fa-home" style="font-size: 20px"></span>
                        <span class="fa fa-arrow-right this-hide-small" style="padding-left: 20px"><{$mainpage_language_ary.Home}>  </span>
                    </div>
                    <div class="col-xs-3 col-md-3 this-padding this-white" style="margin-top:2px; border-radius: 2px">
                        <span class=" fa fa-shopping-cart" style="font-size: 20px"></span>
                        <span class="fa fa-arrow-right this-hide-small " style="padding-left: 20px">  <{$mainpage_language_ary.ORDER}> </span>
                    </div>
                    <div class="col-xs-3 col-md-3 this-padding " >
                        <span class="fa fa-credit-card" style="font-size: 20px"></span>
                        <span class="fa fa-arrow-right this-hide-small" style="padding-left:20px"> <{$mainpage_language_ary.CHECK_OUT}></span>
                    </div>
                    <div class="col-xs-3 col-md-3 this-padding">
                        <span class="fa fa-print" style="font-size: 20px"></span>
                        <span class="this-hide-small"><{$mainpage_language_ary.RECEIPT}></span>
                    </div>
                </div>
            </div>
            <div class="container " id="main-content"  style="padding: 0px" >
                <div class="col-sm-12" style="padding: 0px;  height: auto "  >
                    <div id="aside_main" class="col-sm-9  this-margin-top " style="padding: 0px; height: 100%;border:
                    1px solid
                    silver; border-radius: 0px!important;margin-bottom: 20px; border-radius: 5px">

                        <ul class="nav nav-tabs this-white "  style=" border: 0px!important;" >
                            <li class="active"><a data-toggle="tab" href="#home"> <{$mainpage_language_ary.Profile}></a></li>
                            <li><a data-toggle="tab" href="#menu1"><{$mainpage_language_ary.MAP}> </a></li>
                            <li><a data-toggle="tab" href="#open"><{$mainpage_language_ary.Opening}> </a></li>
                            <li><a data-toggle="tab" href="#about"><{$mainpage_language_ary.About}> </a></li>
                        </ul>

                        <div class="tab-content" style=" background: #f1f1f1!important;" id="cover" >
                            <div id="home" class="tab-pane fade in active "  >
                                <div class="col-sm-4 this-hide-small " style=" margin-top: 4px;position:relative;
                                z-index: 0;padding: 0px"   >
                                    <div id="sidebar__inner">
                                        <ul class="list-group" style="border:none!important;"  >
                                            <div  style="width:auto"  id="pro_left"  >
                                                <li class="list-group-item" style="overflow: hidden; ;
                                                background: silver; padding: 0px; height: 150px ">
                                                    <{foreach from=$shopId item=row}>
                                                    <{$lat=$row.r_lat}>
                                                    <{$lng=$row.r_lng}>
                                                    <{$r_name=$row.r_name}>
                                                    <{$r_about=$row.r_description}>
                                                    <center>
                                                        <img src="/images/food/1-43-310x260.png"
                                                             class="img-responsive img-Circle " style="
                                                             margin-top:-10px; position: relative; width: 200px;
                                                             ">
                                                        <h2 class="this-text-black" style="font-size: 18px;
                                                        text-transform: uppercase; margin-top: -30px">
                                                            <{$row.r_name}></h2>
                                                    </center>


                                                    <{/foreach}>
                                                </li>
                                                <li class="list-group-item bg-info" id="menu_clcik" style="color:
                                                white; background-color:orangered"> <span class="glyphicon
                                                glyphicon-th"></span> <{$mainpage_language_ary.MENU}> </li>
                                                <div id="menu__">
                                                    <{foreach from=$list_category_by_restaurant item=row key=index}>
                                                    <li class="list-group-item" style="cursor: pointer; color: black" ng-click="filterFood(<{$row.ca_id}>)">
                                                        <a href="#Id<{$row.ca_id}>">
                                                            <{$row.ca_name}>
                                                            <i class="ion-ios-arrow-right" style="right: 0px; text-align: right; float: right">
                                                                <span class="icon icon-sm icon-primary fa fa-arrow-circle-right"></span>
                                                            </i>
                                                        </a>
                                                    </li>

                                                    <{/foreach}>

                                                </div>
                                            </div>

                                        </ul>
                                    </div>
                                </div>
                                <div class="col-sm-8" style="padding: 0px;  cursor: pointer;overflow: auto;  min-height: 460px;" id="mainCol" ng-controller="productPageCtrl"  >
                                    <div id="content">
                                       <div class="col-sm-12 this-border this-hide-large this-hide-medium"
                                            style="padding:0px;margin-top:5px">
                                           <div class="this-dropdown-hover " style="width: 100%">
												<div class="this-container this-white this-padding"  style="height:40px;width:"> 
													<span class="icon icon-sm icon-primary fa fa-align-justify"></span>
													<span style="font-size: 17px; font-weight: bold;  padding-top: -5px"> </span><{$mainpage_language_ary.MENU}> </span>
												</div>
												<div class="this-dropdown-content this-bar-block this-border"
                                                    style="width: 100%">
                                                   <{foreach from=$list_category_by_restaurant item=row key=index}>

                                                   <a class="this-bar-item" href="#Id<{$row.ca_id}>" >

                                                       <{$row.ca_name}>

                                                   </a>

                                                   <{/foreach}>


                                               </div>
                                           </div>
                                       </div>
                                        <{foreach from=$foodList item=row key=index}>
                                        <div data-caid="<{$row.ca_id}>" class="col-xs-12 col-sm-6 col-md-4 food " style=";overflow-x: auto; overflow-y: hidden; min-height: 180px; padding: 10px" id="Id<{$row.f_ca_id}>">
                                            <div class="col-sm-12 this-white restaurant " style="height:auto;min-height: 90px;
                                            padding: 0px!important; "  >
                                                <div class="col-md-12" >
                                                   <center>
                                                       <img src="/images/category-1-310X260.png" alt=""
                                                             class="img-responsive img-circle
                                                         reveal-inline-block"  data-toggle="modal" data-target="#<{$row.f_id}>"/>
                                                   </center>
                                                </div>
                                                <div class="col-md-12 this-padding" style="text-align:center;
                                                overflow: hidden;height: 35px"  >
														<{$row.f_name|truncate:20:"...":true}>
                                                </div>
                                                <div class="col-sm-12  this-padding" id="m_<{$row.ca_id}>"  style="text-align:
                                                center;">
                                                        <button   class="this-btn this-btn-this this-small addCart" >$<{$row.f_large_price}></button>
                                                        <button  ng-click="addCart(<{$row.f_id}>,'<{$row.f_large_price}>','<{$row.f_name}>')" class="this-btn this-btn-this this-small addCart" > <{$mainpage_language_ary.ADD_TO_CART}></button>
                                                </div>

                                            </div>
                                        </div>
                                    <!--  Open Modal Order --->
                                        <div id="<{$row.f_id}>" class="modal fade this-center this-container"
                                             role="dialog"
                                             style="margin-top: 30px; padding: 0px!important; margin: 0px;
                                                border-radius:0px!important; margin-top: 50px">
                                            <div class="modal-dialog" style="border-radius: 0px; padding: 0px">
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
                                                                    <p> <{$mainpage_language_ary.Price}>  :<{$row.f_large_price}> $ </p>
                                                                    <p> <{$mainpage_language_ary.Quantity}></p>
                                                                    <div class="stepper-type-1">
                                                                        <div class="stepper ">
																			<input 	type="number" data-zeros="true" value="1" min="1" max="20" class="form-control text-bold stepper-input">
																		</div>
                                                                    </div>
                                                                    <hr class="offset-top-50">
                                                                    <button type="button" ng-click="addCart('<{$row.f_id}>','<{$row.f_large_price}>','<{$row.f_name}>');$event.stopPropagation();"  ng-model="$item.order_num" class="this-btn this-btn-this this-rightthis-margin-top "  >
                                                                        <{$mainpage_language_ary.ADD_TO_CART}>
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

                                    <div id="map_canvas"  style='height:500px;background-color:white;width:100%'></div>

                            </div>
                            <div id="open" class="tab-pane fade in ">
                                <div class="this-container this-padding this-margin-bottom">
                                    <h5> <{$mainpage_language_ary.Opening_Hours}> </h5>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <{foreach from=$operation item=row }>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                + <{$row.ro_open_day}>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <{$row.ro_open_time_start}>  - <{$row.ro_open_time_end}>
                                            </div>
                                            <{/foreach}>
                                        </div>

                                    </div>

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
                    <div id="aside_left" class="col-sm-3 this-hide-small   this-white "
                         style="margin-top:17px;margin-bottom:10px; ">
                <div id="inv"  >
                    <div class="row cartright" id="inv__">
                        <div class="this-container this-white" style="background:#f16121;height:40px; color: white; padding: 10px; ">
                            <{$mainpage_language_ary.CART}>
                        </div>
                        <div class="col-sm-12 this-white hidden cartdiv" ng-show="items .length>0" style="border-bottom: 1px solid silver ; padding: 10px; border-left: 1px solid white; margin-top: 6px">
                            <div class="inner line-top relative">
                                <div class="item-order-wrap" style="border-top: 1px solid silver" >
                                    <div class="item-order-list item-row"  ng-repeat="(key ,item) in items | filter as filterAry" ng-show="!item.del" >

                                        <div class="col-sm-12" style="margin-top: 5px">
                                            <div class="col-sm-9 col-md-9"  ng-bind="item.f_name">
                                            </div>
                                            <div class="col-sm-3">
                                                <p class="uk-text-small" ng-bind="'$'+item.f_price"></p>
                                            </div>
                                        </div>
                                        <div class="col-sm-12" style="text-align: right">
                                            <input 	type="number"    data-id="{{item.f_id}}" data-price="{{item.f_price}}" ng-model="item.order_num"  min="1" max="20" readonly
                                                      class="form-control text-bold input-sm order_num">
                                            <span 	class="glyphicon glyphicon-trash" style="font-size:15px; cursor: pointer" ng-click="delete($index); $event.stopPropagation();"></span>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                    <div class="this-container this-border-top" style="border-top: 1px solid silver">
                                        <div class="row cart_total_wrap bold this-border-top">
                                            <div class="col-md-12 col-xs-6  text-right cart_total"
                                                 style="font-weight: bold; font-size: 18px">
                                                <span><{$mainpage_language_ary.Total}>:</span>
                                                <span class="total" ng-bind="Total(filterAry)"></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="" style="margin-top: 10px">
                                        <center>
                                            <a ng-click="gotoCheckOut(<{$r_id}>)">
                                                <button   class="this-btn this-btn-this">
                                                    <span class="glyphicon glyphicon-log-out"></span>
                                                    <{$mainpage_language_ary.Checkout}>
                                                </button>
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
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">

var r_name="<{$r_name}>";
var r_id="<{$r_id}>";
var lat="<{$lat}>";
var lang="<{$lng}>";



function detectmob() {
    if (window.innerWidth <= 1100 || window.innerHeight <= 600) {
        return true;
    } else {
        return false;
    }
}

if (detectmob()){
    $('#aside_left').remove();
    $('#aside_main').removeClass('col-sm-9');
    $('#aside_main').addClass('col-sm-12');

}
$(document).ready(function () {
    $('#shopAlert').show();
    $('ul li a').click(function(){
        $('li a').removeClass("active");
        $(this).addClass("active");
    });
});
</script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"> </script>
<script src="/js/restaurant/index.js"></script>
<script>

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
                zoom:15,
                center: myLatLng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });
            var myMarker = new google.maps.Marker({
                map: gmap,
                position:myLatLng,
                label: r_name,
                draggable: true
            });
        }

        initialize();
    } catch (e) {
        alert(e);
    }
</script>

