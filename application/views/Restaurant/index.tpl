<!-- Page Content-->
<style>
    #content{



        min-height: 800px;
        color: darkgrey;
    }

    #sidebar{


        will-change: min-height;
    }
    #inv{

        will-change: min-height;

    }
    #inv .inv{
        position: relative;
        transform: translate(0, 0);
        transform: translate3d(0, 0, 0);
        will-change: position, transform;
    }
    #sidebar .sidebar__inner{

        position: relative;
        transform: translate(0, 0);
        transform: translate3d(0, 0, 0);
        will-change: position, transform;
    }

</style>


<main class="page-content this-white" style="background: #F0F0F0">
    <!-- Breadcrumbs & Page title-->

    <{include file="Frontend/breadcrumbs.tpl"}>
    <section class=" text-left container " style="background: #fff; position:inherit"   >
        <div class=" row " >
            <div class="col-sm-12">
                <div class="col-sm-12" style="padding: 0px; z-index: 99999; height: auto "  id="" >
                    <div class="col-sm-12" style="padding: 0px;z-index:999; height: 100%; overflow: hidden ;margin-bottom: 20px">
                        <ul class="nav nav-tabs bg-primary "  style="margin-top: 5px" >
                            <li class="active"><a data-toggle="tab" href="#home">Profile</a></li>
                            <li><a data-toggle="tab" href="#menu1">MAP </a></li>
                            <li><a data-toggle="tab" href="#open">Opening </a></li>
                            <li><a data-toggle="tab" href="#about">About </a></li>
                        </ul>

                        <div class="tab-content" >
                            <div id="home" class="tab-pane fade in active">
                                <div class="col-sm-3 this-hide-small " style="padding: 2px; margin-top: 4px; position:relative; z-index: 0" id="sidebar"   >
                                   <div class="sidebar__inner">
                                       <ul class="list-group" style="border:none; margin-bottom: 40px"  >
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
                                                           <span class="glyphicon glyphicon-menu-right" style="font-size: 12px; color: silver"></span>
                                                       </i></li>

                                                   <{/foreach}>
                                                   <{foreach from=$category item=row key=index}>
                                                   <li class="list-group-item" style="cursor: pointer; color: black"><{$row.ca_name}>
                                                       <i class="ion-ios-arrow-right" style="right: 0px; text-align: right; float: right">
                                                           <span class="glyphicon glyphicon-menu-right" style="font-size: 12px; color: silver"></span>
                                                       </i>
                                                   </li>

                                                   <{/foreach}>
                                               </div>

                                               <li class="list-group-item" style="padding: 0px; margin-top: 20px; margin-bottom: 20px">
                                                   <img src="https://www.hostgator.com/images/banners/336x280/WordPress-336x280.gif" class="img-responsive" width="260">
                                               </li>
                                           </div>

                                       </ul>
                                   </div>

                                </div>
                                <div class="col-sm-6" style="padding: 0px;  cursor: pointer;overflow: auto;  " id="this_center"  >
                                    <div id="content">
                                        <form class="form this-white" style="padding: 5px; ">
                                            <select class="form-control input-sm  " style="background: white!important;" >


                                                <{foreach from=$category item=row key=index}>

                                                <option value="<{$row.ca_id}>" > <{$row.ca_name}> </option>


                                                <{/foreach}>
                                            </select>
                                        </form>
                                        <{foreach from=$category item=row key=index}>

                                        <div class="col-xs-12 col-md-4 this-center " style=";overflow-x: auto; overflow-y: hidden; min-height: 180px; padding: 10px">
                                            <div class="col-sm-12 restaurant  " style="height:auto;min-height: 90px; padding: 0px!important; " >
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
                                                        <button class="this-btn this-btn-this this-small" onclick="document.getElementById('<{$row.ca_id}>').style.display='block'"
                                                                style="font-size: 12px; font-weight:normal;
                                              padding: 8px; border-radius: 3px; height: 35px;  margin-top: -20px; background: #f75d34">
                                                            Price : 0.00$
                                                        </button>
                                                    </div>
                                                </div>




                                            </div>
                                        </div>

                                    <!--  Open Modal Order --->

                                        <div id="<{$row.ca_id}>" class="this-modal this-animate-opacity this-margin-top this-small">
                                            <div class="this-modal-content">
                                                <header class="this-container ">
                                            <span onclick="document.getElementById('<{$row.ca_id}>').style.display='none'"
                                                  class="this-button this-right this-btn-this" style="margin-right: -16px">&times;</span>
                                                    <h3><{$row.ca_name}></h3>
                                                </header>
                                                <div class="this-container this-padding">
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <span onclick="document.getElementById('<{$row.ca_id}>').style.display='none'"></span>

                                                            <img src="/images/category-<{$row.ca_id}>-310X260.png" alt=""  class="img-responsive img-circle reveal-inline-block"/>

                                                        </div>
                                                        <div class="col-sm-6">
                                                            <form>
                                                                <p>Price : 0.00$ </p>
                                                                <p>Quantity</p>
                                                                <div class="stepper-type-1">
                                                                    <div class="stepper ">
                                                                        <input type="number" data-zeros="true" value="1" min="1" max="20" readonly="" class="form-control stepper-input">
                                                                        <span class="stepper-arrow up"></span>
                                                                        <span class="stepper-arrow down"></span>
                                                                    </div>
                                                                </div>

                                                                <hr class="offset-top-50">
                                                                <button class="this-btn this-btn-this this-right this-margin-top "> ADD TO CART </button>
                                                            </form>

                                                        </div>
                                                    </div>
                                                </div>
                                                <footer class="this-container this-padding this-right">

                                                </footer>
                                            </div>
                                        </div>
                                        <!--Close Modal -->

                                        <{/foreach}>
                                        <{foreach from=$category item=row key=index}>

                                        <div class="col-xs-12 col-md-4 this-center " style=";overflow-x: auto; overflow-y: hidden; min-height: 180px; padding: 10px">
                                            <div class="col-sm-12 restaurant  " style="height:auto;min-height: 90px; padding: 0px!important; " >
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
                                                        <button class="this-btn this-btn-this this-small" onclick="document.getElementById('<{$row.ca_id}>').style.display='block'"
                                                                style="font-size: 12px; font-weight:normal;
                                              padding: 8px; border-radius: 3px; height: 35px;  margin-top: -20px; background: #f75d34">
                                                            Price : 0.00$
                                                        </button>
                                                    </div>
                                                </div>




                                            </div>
                                        </div>

                                    <!--  Open Modal Order --->

                                        <div id="<{$row.ca_id}>" class="this-modal this-animate-opacity this-margin-top this-small">
                                            <div class="this-modal-content">
                                                <header class="this-container ">
                                            <span onclick="document.getElementById('<{$row.ca_id}>').style.display='none'"
                                                  class="this-button this-right this-btn-this" style="margin-right: -16px">&times;</span>
                                                    <h3><{$row.ca_name}></h3>
                                                </header>
                                                <div class="this-container this-padding">
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <span onclick="document.getElementById('<{$row.ca_id}>').style.display='none'"></span>

                                                            <img src="/images/category-<{$row.ca_id}>-310X260.png" alt=""  class="img-responsive img-circle reveal-inline-block"/>

                                                        </div>
                                                        <div class="col-sm-6">
                                                            <form>
                                                                <p>Price : 0.00$ </p>
                                                                <p>Quantity</p>
                                                                <div class="stepper-type-1">
                                                                    <div class="stepper ">
                                                                        <input type="number" data-zeros="true" value="1" min="1" max="20" readonly="" class="form-control stepper-input">
                                                                        <span class="stepper-arrow up"></span>
                                                                        <span class="stepper-arrow down"></span>
                                                                    </div>
                                                                </div>
                                                                <button class="this-btn this-margin-top " id="Ins">
                                                                    <span class="glyphicon glyphicon-plus-sign"></span> Instructions
                                                                </button>
                                                                <textarea  class="form-control " rows="1" cols="2" id="show_Ins">
                                                       </textarea>

                                                                <hr class="offset-top-50">
                                                                <button class="this-btn this-btn-this this-right this-margin-top "> ADD TO CART </button>
                                                            </form>

                                                        </div>
                                                    </div>
                                                </div>
                                                <footer class="this-container this-padding this-right">

                                                </footer>
                                            </div>
                                        </div>
                                        <!--Close Modal -->

                                        <{/foreach}>
                                        <{foreach from=$category item=row key=index}>

                                        <div class="col-xs-12 col-md-4 this-center " style=";overflow-x: auto; overflow-y: hidden; min-height: 180px; padding: 10px">
                                            <div class="col-sm-12 restaurant  " style="height:auto;min-height: 90px; padding: 0px!important; " >
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
                                                        <button class="this-btn this-btn-this this-small" onclick="document.getElementById('<{$row.ca_id}>').style.display='block'"
                                                                style="font-size: 12px; font-weight:normal;
                                              padding: 8px; border-radius: 3px; height: 35px;  margin-top: -20px; background: #f75d34">
                                                            Price : 0.00$
                                                        </button>
                                                    </div>
                                                </div>




                                            </div>
                                        </div>

                                    <!--  Open Modal Order --->

                                        <div id="<{$row.ca_id}>" class="this-modal this-animate-opacity this-margin-top this-small">
                                            <div class="this-modal-content">
                                                <header class="this-container ">
                                            <span onclick="document.getElementById('<{$row.ca_id}>').style.display='none'"
                                                  class="this-button this-right this-btn-this" style="margin-right: -16px">&times;</span>
                                                    <h3><{$row.ca_name}></h3>
                                                </header>
                                                <div class="this-container this-padding">
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <span onclick="document.getElementById('<{$row.ca_id}>').style.display='none'"></span>

                                                            <img src="/images/category-<{$row.ca_id}>-310X260.png" alt=""  class="img-responsive img-circle reveal-inline-block"/>

                                                        </div>
                                                        <div class="col-sm-6">
                                                            <form>
                                                                <p>Price : 0.00$ </p>
                                                                <p>Quantity</p>
                                                                <div class="stepper-type-1">
                                                                    <div class="stepper ">
                                                                        <input type="number" data-zeros="true" value="1" min="1" max="20" readonly="" class="form-control stepper-input">
                                                                        <span class="stepper-arrow up"></span>
                                                                        <span class="stepper-arrow down"></span>
                                                                    </div>
                                                                </div>

                                                                <hr class="offset-top-50">
                                                                <button class="this-btn this-btn-this this-right this-margin-top "> ADD TO CART </button>
                                                            </form>

                                                        </div>
                                                    </div>
                                                </div>
                                                <footer class="this-container this-padding this-right">

                                                </footer>
                                            </div>
                                        </div>
                                        <!--Close Modal -->

                                        <{/foreach}>
                                        <{foreach from=$category item=row key=index}>

                                        <div class="col-xs-12 col-md-4 this-center " style=";overflow-x: auto; overflow-y: hidden; min-height: 180px; padding: 10px">
                                            <div class="col-sm-12 restaurant  " style="height:auto;min-height: 90px; padding: 0px!important; " >
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
                                                        <button class="this-btn this-btn-this this-small" onclick="document.getElementById('<{$row.ca_id}>').style.display='block'"
                                                                style="font-size: 12px; font-weight:normal;
                                              padding: 8px; border-radius: 3px; height: 35px;  margin-top: -20px; background: #f75d34">
                                                            Price : 0.00$
                                                        </button>
                                                    </div>
                                                </div>




                                            </div>
                                        </div>

                                    <!--  Open Modal Order --->

                                        <div id="<{$row.ca_id}>" class="this-modal this-animate-opacity this-margin-top this-small">
                                            <div class="this-modal-content">
                                                <header class="this-container ">
                                            <span onclick="document.getElementById('<{$row.ca_id}>').style.display='none'"
                                                  class="this-button this-right this-btn-this" style="margin-right: -16px">&times;</span>
                                                    <h3><{$row.ca_name}></h3>
                                                </header>
                                                <div class="this-container this-padding">
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <span onclick="document.getElementById('<{$row.ca_id}>').style.display='none'"></span>

                                                            <img src="/images/category-<{$row.ca_id}>-310X260.png" alt=""  class="img-responsive img-circle reveal-inline-block"/>

                                                        </div>
                                                        <div class="col-sm-6">
                                                            <form>
                                                                <p>Price : 0.00$ </p>
                                                                <p>Quantity</p>
                                                                <div class="stepper-type-1">
                                                                    <div class="stepper ">
                                                                        <input type="number" data-zeros="true" value="1" min="1" max="20" readonly="" class="form-control stepper-input">
                                                                        <span class="stepper-arrow up"></span>
                                                                        <span class="stepper-arrow down"></span>
                                                                    </div>
                                                                </div>
                                                                <button class="this-btn this-margin-top " id="Ins">
                                                                    <span class="glyphicon glyphicon-plus-sign"></span> Instructions
                                                                </button>
                                                                <textarea  class="form-control " rows="1" cols="2" id="show_Ins">
                                                       </textarea>

                                                                <hr class="offset-top-50">
                                                                <button class="this-btn this-btn-this this-right this-margin-top "> ADD TO CART </button>
                                                            </form>

                                                        </div>
                                                    </div>
                                                </div>
                                                <footer class="this-container this-padding this-right">

                                                </footer>
                                            </div>
                                        </div>
                                        <!--Close Modal -->

                                        <{/foreach}>

                                    </div>
                                </div>
                                <div class="col-sm-3 this-hide-small " style="margin-top: 5px; margin-bottom: 10px; overflow: hidden  ">
                                    <div id="inv">
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
                                                                    <button class="this-btn this-btn-this"> <span class="glyphicon glyphicon-log-out"></span> Checkout</button>
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

                            <div id="menu1" class="tab-pane fade">

                                <div id="map"> </div>

                            </div>
                            <div id="open" class="tab-pane fade in active">
                            </div>

                        </div>

                    </div>

                </div>



            </div>

        </div>




</main>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
    var stickySidebar = new StickySidebar('#sidebar', {
        topSpacing: 20,
        bottomSpacing: 20,
        containerSelector: '.container',
        innerWrapperSelector: '.sidebar__inner'
    });
    var stickySidebar_ = new StickySidebar('#inv', {
        topSpacing: 20,
        bottomSpacing: 20,
        leftSpacing:20,
        containerSelector: '.container',
        innerWrapperSelector: '.inv'
    });

</script>
