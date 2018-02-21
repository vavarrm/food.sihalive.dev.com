<!-- Page Content-->
<style>
    #map {
        height: 100%;
    }
    .stuck {
        position:fixed;

        overflow: auto;
        top: 50px;
        min-width: 255px;


    }
</style>


<main class="page-content" style="background: #F0F0F0">
    <!-- Breadcrumbs & Page title-->

    <section class="container-fluid text-center" style="background: silver;height: 350px;
    background-image:url('http://sihalive.dev.com/demo/images/home-slide-4-1920x800.jpg');
    background-size: cover; background-position: center ">
        <div style="margin-top: 100px" >
            <center>
                <img src="http://freedesignfile.com/upload/2017/07/chef-restaurant-logo-design-vector.jpg" width="120" class="img-responsive img-circle">
                <div class="" style="width: 300px;height: 100px;background: rgba(0,0,0,0.6) no-repeat 0 0; color: white">
                <h5 style="color: white"> My Restaurant </h5>
                </div>
            </center>
        </div>

    </section>
    <section class=" text-left container " style="background: #F0F0F0"   >
        <div class=" row  " >
            <div class="col-sm-8" style="padding: 0px; "  >
                <ul class="nav nav-tabs bg-primary "  style="margin-top: 5px" >
                    <li class="active"><a data-toggle="tab" href="#home">Profile</a></li>
                    <li><a data-toggle="tab" href="#menu1">MAP </a></li>
                    <li><a data-toggle="tab" href="#menu1">Opening </a></li>
                    <li><a data-toggle="tab" href="#menu1">About </a></li>
                </ul>

                <div class="tab-content" >
                    <div id="home" class="tab-pane fade in active">
                       <div class="col-sm-4" style="padding: 2px; margin-top: 4px"   >
                           <ul class="list-group" style="border:none;"  >
                               <div  style="width:auto"  id="pro_left"  >
                                   <li class="list-group-item" style="padding-top: 2px">
                                       <center>
                                           <img src="http://freedesignfile.com/upload/2017/07/chef-restaurant-logo-design-vector.jpg" width="120" class="img-responsive img-circle">

                                       </center>
                                   </li>
                                   <li class="list-group-item" id="menu_clcik" style="background:#f16121;color: white;"> <span class="glyphicon glyphicon-th"></span> MENU </li>
                                   <div id="menu__">
                                       <{foreach from=$category item=row key=index}>
                                       <li class="list-group-item" style="cursor: pointer; color: black"><{$row.ca_name}>
                                           <i class="ion-ios-arrow-right" style="right: 0px; text-align: right; float: right">
                                               <span class="glyphicon glyphicon-menu-right"></span>
                                           </i></li>

                                       <{/foreach}>
                                   </div>

                                   <li class="list-group-item" style="padding: 0px; margin-top: 20px; margin-bottom: 20px">
                                       <img src="https://www.hostgator.com/images/banners/336x280/WordPress-336x280.gif" class="img-responsive" width="260">
                                   </li>
                               </div>





                           </ul>

                       </div>
                        <div class="col-sm-8" style="padding: 0px;  cursor: pointer;overflow: auto  "  >
                            <div  style="position: relative">
                                <form class="form" style="padding: 5px; ">
                                    <select class="form-control input-sm  " style="background: white!important;" >


                                        <{foreach from=$category item=row key=index}>

                                        <option value="<{$row.ca_id}>" > <{$row.ca_name}> </option>


                                        <{/foreach}>
                                    </select>
                                </form>
                                <{foreach from=$category item=row key=index}>

                                <div class="col-xs-6 col-md-4 " style=";overflow-x: auto; overflow-y: hidden; min-height: 100px; padding: 10px">
                                    <div class="col-sm-12 restaurant  " style="height:200px;margin-top: 5px; margin-bottom: 5px; min-height: 90px; padding: 0px!important; " >
                                        <div class="col-xs-12 col-md-12 ">
                                            <a href="/Menu?ca_id=<{$row.ca_id}>">
                                                <img src="/images/category-<{$row.ca_id}>-310X260.png" alt="" width="250" height="200" class="img-responsive img-circle reveal-inline-block"/>
                                            </a>
                                        </div>
                                        <div class="col-sx-12 col-md-12 " style="padding: 5px" >
                                            <p style="margin-top: 10px" >
                                                <a href="/Menu?ca_id=<{$row.ca_id}>" class="link"><{$row.ca_name}></a>
                                            </p>
                                            <div class="col-sm-12 "  style="text-align: center; margin-top: 10px">
                                            <span class="btn-danger"
                                                  style="font-size: 12px; font-weight:normal;
                                              padding: 8px; border-radius: 3px; height: 35px;  margin-top: -20px; background: #f75d34">
                                               Price : 0.00$
                                      </span>
                                            </div>
                                        </div>


                                    </div>
                                </div>

                                <{/foreach}>
                                <{foreach from=$category item=row key=index}>

                                <div class="col-xs-6 col-md-4 " style=";overflow-x: auto; overflow-y: hidden; min-height: 100px; padding: 10px">
                                    <div class="col-sm-12 restaurant  " style="height:200px;margin-top: 5px; margin-bottom: 5px; min-height: 90px; padding: 0px!important; " >
                                        <div class="col-xs-12 col-md-12 ">
                                            <a href="/Menu?ca_id=<{$row.ca_id}>">
                                                <img src="/images/category-<{$row.ca_id}>-310X260.png" alt="" width="250" height="200" class="img-responsive img-circle reveal-inline-block"/>
                                            </a>
                                        </div>
                                        <div class="col-sx-12 col-md-12 " style="padding: 5px" >
                                            <p style="margin-top: 10px" >
                                                <a href="/Menu?ca_id=<{$row.ca_id}>" class="link"><{$row.ca_name}></a>
                                            </p>
                                            <div class="col-sm-12 "  style="text-align: center; margin-top: 10px">
                                            <span class="btn-danger"
                                                  style="font-size: 12px; font-weight:normal;
                                              padding: 8px; border-radius: 3px; height: 35px;  margin-top: -20px; background: #f75d34">
                                               Price : 0.00$
                                      </span>
                                            </div>
                                        </div>


                                    </div>
                                </div>

                                <{/foreach}>
                                <{foreach from=$category item=row key=index}>

                                <div class="col-xs-6 col-md-4 " style=";overflow-x: auto; overflow-y: hidden; min-height: 100px; padding: 10px">
                                    <div class="col-sm-12 restaurant  " style="height:200px;margin-top: 5px; margin-bottom: 5px; min-height: 90px; padding: 0px!important; " >
                                        <div class="col-xs-12 col-md-12 ">
                                            <a href="/Menu?ca_id=<{$row.ca_id}>">
                                                <img src="/images/category-<{$row.ca_id}>-310X260.png" alt="" width="250" height="200" class="img-responsive img-circle reveal-inline-block"/>
                                            </a>
                                        </div>
                                        <div class="col-sx-12 col-md-12 " style="padding: 5px" >
                                            <p style="margin-top: 10px" >
                                                <a href="/Menu?ca_id=<{$row.ca_id}>" class="link"><{$row.ca_name}></a>
                                            </p>
                                            <div class="col-sm-12 "  style="text-align: center; margin-top: 10px">
                                            <span class="btn-danger"
                                                  style="font-size: 12px; font-weight:normal;
                                              padding: 8px; border-radius: 3px; height: 35px;  margin-top: -20px; background: #f75d34">
                                               Price : 0.00$
                                      </span>
                                            </div>
                                        </div>


                                    </div>
                                </div>

                                <{/foreach}>
                            </div>
                        </div>
                    </div>
                    <div id="menu1" class="tab-pane fade">

                        <div id="map"></div>

                    </div>

                </div>


            </div>

            <div class="col-sm-4  " style="margin-top: 5px; margin-bottom: 10px">
                   <div class="row">
                       <div class="col-sm-12" style="
                       background:#f16121;height: 46px; color: white; padding: 10px; ">
                           Order Information
                       </div>
                       <div class="col-sm-12 restaurant" style="border-bottom: 1px solid silver;
                      ; padding: 10px; border-left: 1px solid white; margin-top: 6px">
                           <div class="inner line-top relative">

                               <p class="bold center">Your Order</p>
                               <div class="item-order-wrap" style="border-top: 1px solid silver">
                                   <div class="item-order-list item-row">
                                       <div class="b">2. Thai Tomyum Noodle <p class="uk-text-small">
                                               <span class="base-price">$1.75</span></p>
                                       </div>
                                       <span class="glyphicon glyphicon-edit" style="font-size: 15px"></span>
                                       <span class="glyphicon glyphicon-trash" style="font-size: 15px"></span>
                                       <div class="clear">
                                       </div>
                                </div>
                                   <div class="summary-wrap" style="border-top: 1px solid silver">
                                       <div class="row">
                                           <div class="col-md-6 col-xs-6 text-right ">Sub Total</div>
                                           <div class="col-md-6 col-xs-6 text-right cart_subtotal">$1.75</div>
                                       </div>
                                       <div class="row">
                                           <div class="col-md-6 col-xs-6 text-right ">Delivery Fee</div>
                                           <div class="col-md-6 col-xs-6 text-right ">$1.00</div>
                                       </div>
                                       <div class="row cart_total_wrap bold">
                                           <div class="col-md-6 col-xs-6  text-right">Total</div>
                                           <div class="col-md-6 col-xs-6  text-right cart_total">$2.75</div>
                                       </div>
                                 </div>
                                   <div class="summary-wrap" style="border-top: 1px solid silver">

                                      <div style="margin-top: 10px">
                                          <select class="form-control input-sm" >
                                              <option> Delivery</option>
                                              <option> Pickup </option>
                                          </select>
                                      </div>
                                       <div class="" style="margin-top: 10px">
                                           <center>
                                               <button class="btn-danger"> <span class="glyphicon glyphicon-log-out"></span> Checkout</button>
                                           </center>
                                       </div>
                                   </div>
                   </div>
               </div>

            </div>
        </div>


    </section>

</main>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(document).ready(function(){
        //$("#menu__").hide();
        $("#menu_clcik").click(function(){
            $("#menu__").slideToggle("slow");
        });
    });
    //store the element
    $(window).scroll(function(){
        if($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
            $('#pro_left').css('position','relative');
        }
    });

    jQuery(function($) {
        function fixDiv() {
            var $cache = $('#pro_left');
            if ($(window).scrollTop() > 400) {
                $cache.addClass("stuck");

            } else if($(window).scrollTop() + $(window).height() > $(document).height() - 100){
                $cache.removeClass("stuck");
            }else{
                $cache.removeClass("stuck");
            }
        }

        $(window).scroll(fixDiv);
        fixDiv();
    });

</script>
