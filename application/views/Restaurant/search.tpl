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

                        <div class="col-sm-12 this-margin-bottom" style=" min-height: 400px"  >
                            <div  class="this-margin-top">

                                <{foreach from=$search item=row key=index}>
                                <{if empty($row.r_id)}>
                                <div class="this-container this-padding this-center" style="height: 200px">
                                    <h2> Restaurant Not found </h2>
                                </div>
                                <{else}>
                                <div class="col-xs-12 col-sm-4 col-md-4 this-center ">
                                    <div class="restaurant col-sm-12  ">
                                        <div class="col-sm-12">
                                            <img src="/images/category-<{$row.r_id}>-310X260.png" class="img-responsive" />
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="content">
                                                <h4 class="product-name"><{$row.r_name}></h4>
                                            </div>
                                            <div class="content this-margin">
                                                <a href="<{str_replace(" ", "-",$row.r_name)}>-store-<{$row.r_id}>" class="this-btn this-text-deep-orange" style="border: dashed 1px orangered;">Order Now</a>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <{/if}>
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

