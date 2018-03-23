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
    #mapid { height: 180px; }
</style>
<main class="page-content" style="background: #F0F0F0">
    <!-- Breadcrumbs & Page title-->
    <section class="container-fluid text-center" style="background: silver;height: 350px;
    background-image:url('http://sihalive.dev.com/demo/images/home-slide-4-1920x800.jpg');
    background-size: cover; background-position: center ">
        <div style="margin-top: 100px" >

        </div>
    </section>
    <section class="container-fluid text-center this-white">
        <div class="container">
            <div class="row">

                <div class="col-sm-12 " style="padding: 0px">
                    <{foreach from=$group item=row key=index}>
                    <!-- Each popular food item starts -->
                    <a href="/shop/<{$row.g_r_name|replace:' ':'-'}>">
                        <div class="col-xs-4 col-sm-2 col-md-2 this-padding" style="margin-top: -10px">
                            <div class="food-item-wrap this-center img-circle this-margin-top this-padding-bottom this-margin-bottom">
                                <{if $row.g_r_img !=""}>
                            <img src="/images/restaurant/<{$row.g_r_img}>"
                                 class="img-responsive img-circle this-padding 	"/>
                                <{else}>
                            <img src="http://suezhoudoesfood.com/wp-content/uploads/2014/09/logo_grey.png"
                                 class="img-responsive img-circle this-padding 	"/>
                                <{/if}>

                                <div class="content">
                                    <div class="badge this-orange product-name this-text-bold " style="color: white!important;">
                                        <{$row.g_r_name}>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </a>
                    <{/foreach}>
                </div>
            </div>
        </div>

    </section>
    <section class=" text-left  container " style="background: #F0F0F0; min-height: 400px"   >
        <div class=" row " >
           <!--
            <div class="col-sm-3  " >
                <div class="col-md-12 this-white this-margin" style="min-height: 500px; padding:0px">
                    <div class="list-group">
                        <a href="#" class="list-group-item active this-text-white">
                            <span class="icon icon-sm fa fa-filter"></span><span style="font-size:
                            17px; font-weight: bold">Filters</span></a>
                        <a href="#" class="list-group-item">Second item</a>
                        <a href="#" class="list-group-item">Third item</a>
                    </div>
                </div>
            </div>
           -->
            <div class="col-sm-12">
                <div class="tab-content" >
                    <div id="home" class="tab-pane fade in active this-margin-top this-margin-bottom">
                            <div class="row">
                                <{foreach from=$shopId item=row key=index}>

                                <{if empty($row.r_id)}>

                                <div class="this-container this-padding this-center" style="height: 200px">
                                    <h2> Restaurant Not found </h2>
                                </div>
                                <{else}>
                                <div class="col-xs-12 col-sm-4 col-md-3 this-margin-top ">
                                    <a href="<{str_replace(" ", "-",$row.r_name)}>-store-<{$row.r_id}>">
                                        <div class="col-sm-12 restaurant this-card this-center this-padding-0 " >
                                            <div class="col-xs-12 this-padding this-border">
                                                <{if $row.r_logo_310X260!=''}>
                                                <div class="ratio"  style="background-image: url('/images/restaurant/<{$row.r_logo_310X260}>')"></div>
                                                <{else}>
                                                <div class="ratio"  style="background-image: url('https://caryelementary.files.wordpress.com/2014/04/dinner-table-setting.jpg')"></div>
                                                <{/if}>
                                            </div>
                                            <div class="col-xs-12 this-border" style="min-height: 100px">
                                                <div class="content">
                                                    <h6 class="product-name "><{$row.r_name}></h6>
                                                </div>
                                                <a href="<{str_replace(" ", "-",$row.r_name)}>-store-<{$row.r_id}>"
                                                   class="this-btn this-text-deep-orange this-margin-top"
                                                   style="border: dashed 1px orangered;">Order Now</a>
                                            </div>


                                        </div>
                                    </a>
                                </div>

                                <{/if}>
                                <{/foreach}>

                            </div>
                    </div>


                </div>


            </div>



</main>
