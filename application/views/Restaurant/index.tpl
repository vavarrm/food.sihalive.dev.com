<!-- Page Content-->
<style>
    #map {
        height: 100%;
    }
</style>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBPngVG5lVOI5sJmC75DFnxYFyDtxmHfrE&callback=initMaps">
</script>

<main class="page-content" style="background:transparent">
    <!-- Breadcrumbs & Page title-->
    <section class="container-fluid text-center" style="background: silver;height: 380px;
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
    <section class="container" style="background: white">
        <div class="row">
            <div class="col-sm-9" style="padding: 0px;">
                <ul class="nav nav-tabs bg-primary " >
                    <li class="active"><a data-toggle="tab" href="#home">Menu</a></li>
                    <li><a data-toggle="tab" href="#menu1">Location </a></li>

                </ul>

                <div class="tab-content">
                    <div id="home" class="tab-pane fade in active">
                        <{foreach from=$category item=row key=index}>

                        <div class="col-xs-12 col-md-6 " style=";overflow-x: auto; overflow-y: hidden">
                            <div class="col-sm-12 restaurant " style="padding: 2px; margin-top: 5px; margin-bottom: 5px" >
                                <div class="col-xs-5 col-md-5 ">
                                    <a href="/Menu?ca_id=<{$row.ca_id}>">
                                        <img src="/images/category-<{$row.ca_id}>-310X260.png" alt="" width="250" height="200" class="img-responsive img-circle reveal-inline-block"/>
                                    </a>
                                </div>
                                <div class="col-sx-7 col-md-7" >

                                    <p style="margin-top: 10px" >
                                        <a href="/Menu?ca_id=<{$row.ca_id}>" class="link"><{$row.ca_name}></a>
                                    </p>
                                    <form>
                                        <input type="number">
                                    </form>

                                    <span class="btn-danger"
                                          style="font-size: 12px; font-weight:normal;
                                      padding: 8px; border-radius: 3px; height: 35px; ma">
                                      add cart
                                </span>

                                </div>
                            </div>
                        </div>

                        <{/foreach}>
                    </div>
                    <div id="menu1" class="tab-pane fade">

                        <div id="map"></div>

                    </div>

                </div>


            </div>
            <div class="col-sm-3 restaurant">
                <h5> Delivery Information</h5>
            </div>
        </div>


    </section>

</main>
<script>
    function initMaps() {
        var uluru = {lat: -25.363, lng: 131.044};
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 4,
            center: uluru
        });
        var marker = new google.maps.Marker({
            position: uluru,
            map: map
        });
    }
</script>
