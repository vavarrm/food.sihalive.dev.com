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

        </div>

    </section>
    <section class=" text-left container " style="background: #F0F0F0"   >
        <div class=" row  " >
            <div class="col-sm-12" style="padding: 0px; "  >


                <div class="tab-content" >
                    <div id="home" class="tab-pane fade in active">
                        <div class="col-sm-3" style="padding: 2px; margin-top: 13px"   >
                            <ul class="list-group" style="border:none;"  >
                                <div  style="width:auto"  id="pro_left"  >

                                    <li class="list-group-item" id="menu_clcik" style="background:#f16121;color: white;">
                                        <span class="glyphicon glyphicon-th-list"></span> Filter </li>

                                    <li class="list-group-item">
                                        <a href="javascript:;"> <span style="font-family: 'Lato', Helvetica, Arial, sans-serif;">
                                                <i class="ion-ios-arrow-thin-right"></i> Search Restaurant  </span> <b></b> </a>
                                        <hr class="offset-top-10">
                                        <form class="form" style="padding: 5px; ">
                                            <select class="form-control input-sm  " style="background: white!important;" >


                                                <{foreach from=$category item=row key=index}>

                                                <option value="<{$row.ca_id}>" > <{$row.ca_name}> </option>


                                                <{/foreach}>
                                            </select>
                                        </form>
                                    </li>

                                    <li class="list-group-item">
                                        <a href="javascript:;"> <span style="font-family: 'Lato', Helvetica, Arial, sans-serif;">
                                                <i class="ion-ios-arrow-thin-right"></i> By Delivery  </span> <b></b> </a>
                                        <hr class="offset-top-10">
                                        <form class="form" style="padding: 5px; ">
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input">
                                                <span class="custom-control-indicator"></span>
                                                <span class="custom-control-description">Free</span> </label>
                                            <br/>
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input">
                                                <span class="custom-control-indicator"></span>
                                                <span class="custom-control-description">Delivery</span> </label>
                                            <br/>
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input">
                                                <span class="custom-control-indicator"></span>
                                                <span class="custom-control-description">Pick Up</span> </label>
                                            <br/>
                                        </form>
                                    </li>



                                    <li class="list-group-item" style="cursor: pointer; color: black">
                                            <span> By Restaurant Type :</span><br/>
                                            <hr class="offset-top-10">
                                        <{foreach from=$category item=row key=index}>

                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input">
                                                <span class="custom-control-indicator"></span>
                                                <span class="custom-control-description"><{$row.ca_name}></span> </label>
                                                <br/>

                                        <{/foreach}>
                                            </li>


                                    <li class="list-group-item" style="padding: 0px; margin-top: 20px; margin-bottom: 20px">
                                        <img src="https://www.hostgator.com/images/banners/336x280/WordPress-336x280.gif" class="img-responsive" width="260">
                                    </li>
                                </div>





                            </ul>

                        </div>
                        <div class="col-sm-9 this-margin-bottom" style=";  cursor: pointer;  "  >
                            <div  style="position: relative">


                                <{foreach from=$search item=row key=index}>



                                    <div class=" restaurant-entry  ">
                                       <div class="row">
                                           <div class="col-sm-12  this-margin-top this-border this-padding this-white">
                                               <div class="col-sm-9  text-xs-center text-sm-left">
                                                   <div class="col-sx-12 col-md-4">
                                                       <a class="img-responsive  " href="/<{$row.r_id}>">
                                                           <img src="/images/category-<{$row.r_id}>-310X260.png" alt="Food logo" class="img-responsive">
                                                       </a>
                                                   </div>
                                                   <!-- end:Logo -->
                                                   <div class="col-xs-12 col-md-8">
                                                       <h5><a href="/<{$row.r_id}>"><{$row.r_name}></a></h5>
                                                       <span style="font-weight: 300;font-size: 14px;    font-family: 'Lato', Helvetica, Arial, sans-serif;"><{$row.r_description}> <a href="#">...</a></span>
                                                       <ul class="list-inline">
                                                          <li class="list-inline-item"><i class="fa
                                                          fa-check"></i>
                                                               Delivery Fee: $ 1,00</li>
                                                           <li class="list-inline-item"><i class="fa
                                                           fa-motorcycle"></i> 20 min</li>
                                                       </ul>
                                                   </div>
                                                   <!-- end:Entry description -->
                                               </div>
                                               <div class="col-sm-3 text-xs-center">
                                                   <div class="right-content bg-white">
                                                       <div class="right-review">
                                                           <p> 50 Views</p> <a href="/<{$row.r_id}>" class="btn
                                                           btn-sm​​​​​​​​​​​ this-hover-text-deep-orange this-text-deep-orange" style="border: dashed 1px orangered;">View Menu</a> </div>
                                                   </div>
                                                   <!-- end:right info -->
                                               </div>
                                           </div>
                                           <!--end:row -->
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



</main>

