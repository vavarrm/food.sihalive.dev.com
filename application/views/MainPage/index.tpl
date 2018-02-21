<!-- Page Content-->
<main class="page-content" >
<!-- Swiper variant 3-->
<section class="bg-gray-darker" style="max-height: 560px; background: white">
  <div class="swiper-variant-1" style="max-height: 560px">
	<div data-slide-effect="fade" data-min-height="550px" class="swiper-container swiper-slider" style="max-height: 560px">
	  <div class="swiper-wrapper" style="max-height: 558px">
		<div data-slide-bg="images/home-slide-3-1920x800.jpg" class="swiper-slide">
		  <div class="swiper-slide-caption slide-caption-2 text-center">
			<div class="shell">
			  <div class="range range-sm-center">
				<div class="cell-sm-11 cell-lg-9">
				  <h5 data-caption-animate="fadeInUpSmall" data-caption-delay="100" class="text-italic font-secondary text-white">Your Favourite</h5>
				  <h2 data-caption-animate="fadeInUpSmall" data-caption-delay="400" class="text-uppercase text-white offset-top-0">Food delivery service</h2>
				  <p data-caption-animate="fadeInUpSmall" data-caption-delay="700" class="text-white offset-top-18">Welcome to Food Delivery, a place where you can order your favorite restaurant dishes, drinks, and desserts at affordable price. We are glad to offer you the best food in the area to everyone.</p><a href="#" data-caption-animate="fadeInUpSmall" data-caption-delay="1000" class="btn btn-secondary btn-md btn-shape-circle offset-top-20">order online</a>
				</div>
			  </div>
			</div>
		  </div>
		</div>
		<div data-slide-bg="images/home-slide-4-1920x800.jpg" class="swiper-slide">
		  <div class="swiper-slide-caption slide-caption-2 text-center">
			<div class="shell">
			  <div class="range range-sm-center">
				<div class="cell-sm-10 cell-lg-8">
				  <h5 data-caption-animate="fadeInUpSmall" data-caption-delay="100" class="text-italic font-secondary text-white">Affordable Organic Food</h5>
				  <h2 data-caption-animate="fadeInUpSmall" data-caption-delay="400" class="text-uppercase text-white offset-top-0">Healthy Breakfasts</h2>
				  <p data-caption-animate="fadeInUpSmall" data-caption-delay="700" class="text-white offset-top-18">Looking for fresh and tasty breakfasts and lunches? At Food Delivery, you can order any kind of morning snack from local restaurants at reasonable prices without any extra charges.</p><a href="#" data-caption-animate="fadeInUpSmall" data-caption-delay="1000" class="btn btn-secondary btn-md btn-shape-circle offset-top-20">order online</a>
				</div>
			  </div>
			</div>
		  </div>
		</div>
		<div data-slide-bg="images/home-slide-2-1920x800.jpg" class="swiper-slide">
		  <div class="swiper-slide-caption slide-caption-2 text-center">
			<div class="shell">
			  <div class="range range-sm-center">
				<div class="cell-sm-10 cell-lg-8">
				  <h5 data-caption-animate="fadeInUpSmall" data-caption-delay="100" class="text-italic font-secondary text-white">A Variety of Dishes</h5>
				  <h2 data-caption-animate="fadeInUpSmall" data-caption-delay="400" class="text-uppercase text-white offset-top-0">pizzas and seafood</h2>
				  <p data-caption-animate="fadeInUpSmall" data-caption-delay="700" class="text-white offset-top-18">In our menu you can find lots of tasty and interesting dishes, including pizzas of all kinds. We also offer a wide range of seafood dishes, even if you are just looking for an affordable snack.</p><a href="#" data-caption-animate="fadeInUpSmall" data-caption-delay="1000" class="btn btn-secondary btn-md btn-shape-circle offset-top-20">order online</a>
				</div>
			  </div>
			</div>
		  </div>
		</div>
	  </div>
	  <!-- Swiper Navigation-->
	  <div class="swiper-pagination-wrap">
		<div class="swiper-pagination"></div>
	  </div>
	</div>
  </div>
</section>
<section class="container" style="margin-top: 10px">
	<div class="container text-center   " style="padding: 10px  ">
		<h5 class="h5 text-uppercase "> Sihalive food Delivery</h5>

		<form class="form-inline" style="margin-bottom: 10px"action="search">
			<div class="form-group">
				<label class="sr-only" for="exampleInputAmount">I would like to eat....</label>
				<div class="form-group">
					<input type="text" class="form-control form-control-has-validation form-control-last-child " id="search" placeholder="I would like to eat...."> </div>
			</div>
			<button  type="submit" class="this-btn this-btn-this">Search food</button>
		</form>

		<section class="popular">
			<div class="container">

				<div class="row">
					<{foreach from=$category item=row key=index}>
					<!-- Each popular food item starts -->
					<div class="col-xs-12 col-sm-6 col-md-2" ">
					<div class="food-item-wrap restaurant this-center  " style="margin-top: 5px; padding-bottom: 5px; margin-bottom: 5px"  >
						<img src="images/category-<{$row.ca_id}>-310X260.png" class="img-responsive"/>
						<div class="content">
							<div class="product-name"><{$row.ca_name}></div>
						</div>

					</div>
				</div>
				<{/foreach}>
				<!-- Each popular food item starts -->

			</div>
			<hr class="offset-top-50">
		</section>
	</div>
<<<<<<< HEAD
	</section>


	</div>
	<br/>

	<section class="popular" style="margin-bottom: 20px">
		<div class="container">
           <h5 class="h5 text-uppercase">Restaurants in Shihanoukville </h5>
			<div class="row">
				<{foreach from=$category item=row key=index}>
				<!-- Each popular food item starts -->
				<div class="col-xs-12 col-sm-6 col-md-3" ">
					<div class="food-item-wrap restaurant this-center " style="margin-top: 5px; padding-bottom: 5px; margin-bottom: 5px"  >
						<img src="images/category-<{$row.ca_id}>-310X260.png" class="img-responsive"/>
						<div class="content">
							<div class="product-name"><{$row.ca_name}></div>
						</div>
						<a href="/restaurant" class="btn btn-sm w3-text-deep-orange" style="border: dashed 1px orangered;">Order Now</a>

					</div>
				</div>
				<{/foreach}>
				<!-- Each popular food item starts -->
=======
	<div class="row">
		<{foreach from=$category item=row key=index}>

		<div class="col-xs-4 col-md-2" style="padding: 5px;overflow-x: auto; overflow-y: hidden">
			<div class="" style="border-radius: 100%; border: 1px solid silver;" >
				<a href="/Menu?ca_id=<{$row.ca_id}>">
					<img src="images/category-<{$row.ca_id}>-310X260.png" alt="" width="250" height="200" class="img-responsive img-circle reveal-inline-block"/>
				</a>

				<p style="margin-top: -5px" >
					<a href="/Menu?ca_id=<{$row.ca_id}>" class="link"><{$row.ca_name}></a>
				</p>
>>>>>>> 60e0ccf57a0e4f11021eb7d646acf5b5d638e016
			</div>
		</div>

<<<<<<< HEAD
                <!-- 3 block sections starts -->
                <div class="row how-it-works-solution">
                    <div class="col-xs-12 col-sm-12 col-md-4 how-it-works-steps white-txt col1">
                        <div class="how-it-works-wrap">
                            <div class="step step-1">

                                <div class="icon" data-step="1">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 483 483" width="70" >
                                        <g fill="#FFF">
                                            <path d="M467.006 177.92c-.055-1.573-.469-3.321-1.233-4.755L407.006 62.877V10.5c0-5.799-4.701-10.5-10.5-10.5h-310c-5.799 0-10.5 4.701-10.5 10.5v52.375L17.228 173.164a10.476 10.476 0 0 0-1.22 4.938h-.014V472.5c0 5.799 4.701 10.5 10.5 10.5h430.012c5.799 0 10.5-4.701 10.5-10.5V177.92zM282.379 76l18.007 91.602H182.583L200.445 76h81.934zm19.391 112.602c-4.964 29.003-30.096 51.143-60.281 51.143-30.173 0-55.295-22.139-60.258-51.143H301.77zm143.331 0c-4.96 29.003-30.075 51.143-60.237 51.143-30.185 0-55.317-22.139-60.281-51.143h120.518zm-123.314-21L303.78 76h86.423l48.81 91.602H321.787zM97.006 55V21h289v34h-289zm-4.198 21h86.243l-17.863 91.602h-117.2L92.808 76zm65.582 112.602c-5.028 28.475-30.113 50.19-60.229 50.19s-55.201-21.715-60.23-50.19H158.39zM300 462H183V306h117v156zm21 0V295.5c0-5.799-4.701-10.5-10.5-10.5h-138c-5.799 0-10.5 4.701-10.5 10.5V462H36.994V232.743a82.558 82.558 0 0 0 3.101 3.255c15.485 15.344 36.106 23.794 58.065 23.794s42.58-8.45 58.065-23.794a81.625 81.625 0 0 0 13.525-17.672c14.067 25.281 40.944 42.418 71.737 42.418 30.752 0 57.597-17.081 71.688-42.294 14.091 25.213 40.936 42.294 71.688 42.294 24.262 0 46.092-10.645 61.143-27.528V462H321z"></path>
                                            <path d="M202.494 386h22c5.799 0 10.5-4.701 10.5-10.5s-4.701-10.5-10.5-10.5h-22c-5.799 0-10.5 4.701-10.5 10.5s4.701 10.5 10.5 10.5z"></path> </g>
                                    </svg>
                                </div>
                                <img src="/images/icon/arrow-big.png" class="this-hide-small" style="position: absolute; margin-left: 50px"/>
                                <h6 class="text-white">Choose a restaurant</h6>
                                <p>We"ve got your covered with menus from over 345 delivery restaurants online.</p>
                            </div>

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-4 how-it-works-steps white-txt col2">
                        <div class="step step-2">
                            <div class="icon" data-step="2">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 380.721 380.721" width="70">
                                    <g fill="#FFF">
                                        <path d="M58.727 281.236c.32-5.217.657-10.457 1.319-15.709 1.261-12.525 3.974-25.05 6.733-37.296a543.51 543.51 0 0 1 5.449-17.997c2.463-5.729 4.868-11.433 7.25-17.01 5.438-10.898 11.491-21.07 18.724-29.593 1.737-2.19 3.427-4.328 5.095-6.46 1.912-1.894 3.805-3.747 5.676-5.588 3.863-3.509 7.221-7.273 11.107-10.091 7.686-5.711 14.529-11.137 21.477-14.506 6.698-3.724 12.455-6.982 17.631-8.812 10.125-4.084 15.883-6.141 15.883-6.141s-4.915 3.893-13.502 10.207c-4.449 2.917-9.114 7.488-14.721 12.147-5.803 4.461-11.107 10.84-17.358 16.992-3.149 3.114-5.588 7.064-8.551 10.684-1.452 1.83-2.928 3.712-4.427 5.6a1225.858 1225.858 0 0 1-3.84 6.286c-5.537 8.208-9.673 17.858-13.995 27.664-1.748 5.1-3.566 10.283-5.391 15.534a371.593 371.593 0 0 1-4.16 16.476c-2.266 11.271-4.502 22.761-5.438 34.612-.68 4.287-1.022 8.633-1.383 12.979 94 .023 166.775.069 268.589.069.337-4.462.534-8.97.534-13.536 0-85.746-62.509-156.352-142.875-165.705 5.17-4.869 8.436-11.758 8.436-19.433-.023-14.692-11.921-26.612-26.631-26.612-14.715 0-26.652 11.92-26.652 26.642 0 7.668 3.265 14.558 8.464 19.426-80.396 9.353-142.869 79.96-142.869 165.706 0 4.543.168 9.027.5 13.467 9.935-.002 19.526-.002 28.926-.002zM0 291.135h380.721v33.59H0z"></path> </g>
                                </svg>
                            </div>
                            <img src="/images/icon/arrow-big-dotted.png" class="this-hide-small" style="position: absolute; margin-left: 50px"/>
=======
		<{/foreach}>
	</div>
</section>
<section class="section-50 section-sm-top-90 section-sm-bottom-100 " style="margin-top: -30px">
  <div class="container text-center">
	<h3><{$mainpage_language_ary.our_menu}></h3>

	  <div class="row">
		  <{foreach from=$category item=row key=index}>

		  <div class="col-xs-6 col-md-2" style="padding: 5px;overflow-x: auto; overflow-y: hidden">
			  <div class="restaurant" >
				  <a href="/Menu?ca_id=<{$row.ca_id}>">
					  <img src="images/category-<{$row.ca_id}>-310X260.png" alt="" width="310" height="260" class="img-responsive reveal-inline-block"/>
				  </a>

					  <p style="margin-top: -5px" >
						  <a href="/Menu?ca_id=<{$row.ca_id}>" class="link"><{$row.ca_name}></a>
					  </p>
				     <p> <span class="glyphicon glyphicon-star"></span>
						 <span class="glyphicon glyphicon-star"></span>
						 <span class="glyphicon glyphicon-star"></span>
						 <span class="glyphicon glyphicon-star"></span>
						 <span class="glyphicon glyphicon-star"></span>
					 </p>
>>>>>>> 60e0ccf57a0e4f11021eb7d646acf5b5d638e016

			  </div>
		  </div>

		  <{/foreach}>
	  </div>

  </div>
</section>
</main>