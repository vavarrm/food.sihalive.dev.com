<!-- Page Content-->
<main class="page-content"  >
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
	<section class="container" style="margin-top: 10px; background: white">
		<div class=" text-center">
			<h4>餐厅类型</h4>

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
					</div>
				</div>

				<{/foreach}>
			</div>
		</div>

	</section>
<section class="section-50 section-sm-top-90 section-sm-bottom-100 " style="margin-top: -30px">
  <div class="container text-center" style="padding: 0px">

	<div  style="border-bottom: 2px solid #f16121; align-content: center; text-align: center; position:relative" >

		<div style="padding: 4px; background:#f16121;width: 200px;  margin-top: -20px; position:relative; color: white;height: 30px">
			<h6 style="color: white">受欢迎的餐厅</h6>
		</div>

	</div>

<br/>
	  <div class="row">
		  <{foreach from=$category item=row key=index}>

		  <div class="col-xs-12 col-md-2" >
			  <div class="restaurant" >
				  <a href="/restaurant?ca_id=<{$row.ca_id}>">
					  <img src="images/category-<{$row.ca_id}>-310X260.png" alt="" width="310" height="260" class="img-responsive reveal-inline-block"/>
				  </a>

					 <div style="height: 50px">
						 <p style="margin-top: -5px" >
							 <a href="/restaurant?ca_id=<{$row.ca_id}>" class="link"><{$row.ca_name}></a>
						 </p>
					 </div>


			  </div>
		  </div>


		  <{/foreach}>
	  </div>

  </div>
</section>
</main>