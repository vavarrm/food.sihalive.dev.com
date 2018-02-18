<!-- Page Content-->
<style>
    #map {
        height: 100%;
    }
</style>


<main class="page-content" style="background:transparent">
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
    <section class="container text-left restaurant" style="background: white">
        <div class="row">
            <div class="col-sm-8" style="padding: 0px; ">
                <ul class="nav nav-tabs bg-primary " >
                    <li class="active"><a data-toggle="tab" href="#home">Menu</a></li>
                    <li><a data-toggle="tab" href="#menu1">MAP </a></li>
                    <li><a data-toggle="tab" href="#menu1">Opening </a></li>
                    <li><a data-toggle="tab" href="#menu1">Review </a></li>
                    <li><a data-toggle="tab" href="#menu1">About </a></li>
                </ul>

                <div class="tab-content">
                    <div id="home" class="tab-pane fade in active">
                       <div class="col-sm-4" style="padding: 2px">
                           <ul class="list-group" style="border:none;">
                               <li class="list-group-item">food <span class="badge">12</span></li>
                               <li class="list-group-item">drink <span class="badge">5</span></li>
                               <li class="list-group-item">beer <span class="badge">3</span></li>
                               <li class="list-group-item">food <span class="badge">12</span></li>
                               <li class="list-group-item">drink <span class="badge">5</span></li>
                               <li class="list-group-item">beer <span class="badge">3</span></li>
                               <li class="list-group-item">food <span class="badge">12</span></li>
                               <li class="list-group-item">drink <span class="badge">5</span></li>
                               <li class="list-group-item">beer <span class="badge">3</span></li>
                               <li class="list-group-item">food <span class="badge">12</span></li>
                               <li class="list-group-item">drink <span class="badge">5</span></li>
                               <li class="list-group-item">beer <span class="badge">3</span></li>
                           </ul>

                       </div>
                        <div class="col-sm-8" style="padding: 0px; border-left: 1px solid silver; cursor: pointer;border-right: 1px solid silver " >
                            <form class="form" style="padding: 5px">
                                <input type="text" class="form-control input-sm " placeholder="search... " style="border: 1px solid #f16121">
                                <i class="fa-search#f002"></i>
                            </form>
                            <{foreach from=$category item=row key=index}>

                            <div class="col-xs-6 col-md-6 " style=";overflow-x: auto; overflow-y: hidden; min-height: 100px; padding: 10px">
                                <div class="col-sm-12 restaurant  " style="margin-top: 5px; margin-bottom: 5px; min-height: 90px; padding: 0px!important; border-bottom: 1px solid silver" >
                                    <div class="col-xs-12 col-md-12 ">
                                        <a href="/Menu?ca_id=<{$row.ca_id}>">
                                            <img src="/images/category-<{$row.ca_id}>-310X260.png" alt="" width="250" height="200" class="img-responsive img-circle reveal-inline-block"/>
                                        </a>
                                    </div>
                                    <div class="col-sx-12 col-md-12 " style="padding: 5px" >
                                        <p style="margin-top: 10px" >
                                            <a href="/Menu?ca_id=<{$row.ca_id}>" class="link"><{$row.ca_name}></a>
                                        </p>
                                        <span class="btn-danger"
                                              style="font-size: 12px; font-weight:normal;
                                              padding: 8px; border-radius: 3px; height: 35px;  margin-top: -20px">
                                              Buy +
                                      </span>
                                    </div>

                                </div>
                            </div>

                            <{/foreach}>
                        </div>
                    </div>
                    <div id="menu1" class="tab-pane fade">

                        <div id="map"></div>

                    </div>

                </div>


            </div>

            <div class="col-sm-4 ">
                   <div class="row">
                       <div class="col-sm-12" style="border-bottom: 1px solid silver;
                       background:#f16121;height: 47px; color: white; padding: 10px; border-left: 1px solid white">
                           Your Order
                       </div>
                       <div class="col-sm-12" style="border-bottom: 1px solid silver;
                      height: 47px; padding: 10px; border-left: 1px solid white">
                           Your Order
                       </div>
                   </div>
               </div>

            </div>
        </div>


    </section>

</main>
