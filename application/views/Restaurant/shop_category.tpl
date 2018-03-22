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
    <section class="container-fluid text-center this-white">
        <div class="container">
            <div class="row">

                <div class="col-sm-12 " style="padding: 0px">
                    <{foreach from=$group item=row key=index}>
                    <!-- Each popular food item starts -->
                    <a href="/shop/<{$row.g_r_name|replace:' ':'-'}>">
                        <div class="col-xs-4 col-sm-2 col-md-2" style="padding: 0px">
                            <div class="food-item-wrap this-center img-circle this-margin-top this-padding-bottom this-margin-bottom">

                                <img src="http://kcthaiplace.com/wp-content/uploads/2016/10/img03-300x300.png" class="img-responsive img-circle "/>
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
                                                <a href="/<{str_replace(" ", "-",$row.r_name)}>-store-<{$row.r_id}>"
                                                   class="this-btn this-text-deep-orange" style="border: dashed 1px orangered;">Order Now</a>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <{/if}>
                                <{/foreach}>

                            </div>
                    </div>


                </div>


            </div>



</main>

