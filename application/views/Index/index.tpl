<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<{include file="frontend/meta.tpl"}>

    <title><{$language.website_name}></title>

	<{include file="frontend/css.tpl"}>
	<!-- Custom CSS -->


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <!-- Navigation -->
	<{include file="frontend/navigation.tpl"}>

    <!-- Page Content -->
<div id="wrap">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>我是主标题</h1>
			</div>
        </div>
    </div>
    <!-- /.container -->
    <div class="container">
		<div class="row">
			<div class="col-md-5 col-lg-5">
				<!-- artigo em destaque -->
				<div class="featured-article">
					<a href="#">
						<img src="http://placehold.it/482x350" alt="" class="thumb">
					</a>
					<div class="block-title">
						<h2>首页图标题</h2>
						<p class="by-author"><small>店家名</small></p>
					</div>
				</div>
				<!-- /.featured-article -->
			</div>
			<div class="col-md-7 col-lg-7">
				<ul class="media-list main-list">
				  <li class="media">
					<a class="pull-left" href="#">
					  <img class="media-object" src="http://placehold.it/150x90" alt="...">
					</a>
					<div class="media-body">
					  <h4 class="media-heading">图标题</h4>
					  <p class="by-author">店家名</p>
					</div>
				  </li>
				  <li class="media">
					<a class="pull-left" href="#">
					  <img class="media-object" src="http://placehold.it/150x90" alt="...">
					</a>
					<div class="media-body">
					  <h4 class="media-heading">图标题</h4>
					  <p class="by-author">店家名</p>
					</div>
				  </li>
				  <li class="media">
					<a class="pull-left" href="#">
					  <img class="media-object" src="http://placehold.it/150x90" alt="...">
					</a>
					<div class="media-body">
					  <h4 class="media-heading">图标题</h4>
					  <p class="by-author">店家名</p>
					</div>
				  </li>
				</ul>
			</div>
		</div>
	</div>
    <!-- /.container -->
    <div class="container dynamicTile">
		<div class="row ">
			<div class="col-sm-2 col-xs-4">
				<div id="tile1" class="tile">
				
				 <div class="carousel slide" data-ride="carousel">
				  <!-- Wrapper for slides -->
				  <div class="carousel-inner">
					<div class="item active">
					   <img src="http://handsontek.net/demoimages/tiles/twitter1.png" class="img-responsive"/>
					</div>
					<div class="item">
					   <img src="http://handsontek.net/demoimages/tiles/twitter2.png" class="img-responsive"/>
					</div>
				  </div>
				</div>
				 
				</div>
			</div>
			<div class="col-sm-2 col-xs-4">
				<div id="tile2" class="tile">
					<div class="carousel slide" data-ride="carousel">
						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
							  <img src="http://handsontek.net/demoimages/tiles/hot.png" class="img-responsive"/>
							</div>
							<div class="item">
							  <img src="http://handsontek.net/demoimages/tiles/hot2.png" class="img-responsive"/>
							</div>
							<div class="item">
							  <img src="http://handsontek.net/demoimages/tiles/hot3.png" class="img-responsive"/>
							</div>
						</div>
					</div>  
				</div>
			</div>
			<div class="col-sm-2 col-xs-4">
				<div id="tile3" class="tile">
					<div class="carousel slide" data-ride="carousel">
						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
							   <img src="http://handsontek.net/demoimages/tiles/weather2.png" class="img-responsive"/>
							</div>
							<div class="item">
							   <img src="http://handsontek.net/demoimages/tiles/weather.png" class="img-responsive"/>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-2 col-xs-4">
				<div id="tile4" class="tile">
					<div class="carousel slide" data-ride="carousel">
						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
							  <img src="http://handsontek.net/demoimages/tiles/facebook3.png" class="img-responsive"/>
							</div>
						<div class="item">
							<img src="http://handsontek.net/demoimages/tiles/facebook2.png" class="img-responsive"/>
						</div>
					  </div>
					</div>
				</div>
			</div>
			<div class="col-sm-2 col-xs-4">
				<div id="tile5" class="tile">
					<div class="carousel slide" data-ride="carousel">
						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
								<img src="http://handsontek.net/demoimages/tiles/neews.png" class="img-responsive"/>
							</div>
							<div class="item">
								<img src="http://handsontek.net/demoimages/tiles/neews2.png" class="img-responsive"/>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-2 col-xs-4">
				<div id="tile6" class="tile">
					<div class="carousel slide" data-ride="carousel">
						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
								<img src="http://handsontek.net/demoimages/tiles/skype.png" class="img-responsive"/>
							</div>
							<div class="item">
								<img src="http://handsontek.net/demoimages/tiles/skype2.png" class="img-responsive"/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4 col-xs-8">
				<div id="tile7" class="tile">	 
					<div class="carousel slide" data-ride="carousel">
						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
							  <img src="http://handsontek.net/demoimages/tiles/gallery.png" class="img-responsive"/>
							</div>
							<div class="item">
								<img src="http://handsontek.net/demoimages/tiles/gallery2.png" class="img-responsive"/>
							</div>
							<div class="item">
								<img src="http://handsontek.net/demoimages/tiles/gallery3.png" class="img-responsive"/>
							</div>
					  </div>
					</div>
				</div>
			</div>
			<div class="col-sm-2 col-xs-4">
				<div id="tile8" class="tile">
					<div class="carousel slide" data-ride="carousel">
						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
							   <img src="http://handsontek.net/demoimages/tiles/music.png" class="img-responsive"/>
							</div>
							<div class="item">
							   <img src="http://handsontek.net/demoimages/tiles/music2.png" class="img-responsive"/>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-2 col-xs-4">
				<div id="tile9" class="tile">
					<div class="carousel slide" data-ride="carousel">
						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
								<img src="http://handsontek.net/demoimages/tiles/calendar.png" class="img-responsive"/>
							</div>
							<div class="item">
								<img src="http://handsontek.net/demoimages/tiles/calendar2.png" class="img-responsive"/>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-4 col-xs-8">
				<div id="tile10" class="tile">
					<div class="carousel slide" data-ride="carousel">
					<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
								<h3 class="tilecaption"><i class="fa fa-child fa-4x"></i></h3>
							</div>
							<div class="item">
								<h3 class="tilecaption">Customize your tiles</h3>
							</div>
							<div class="item">
								<h3 class="tilecaption">Text, Icons, Images</h3>
							</div>
							<div class="item">
								<h3 class="tilecaption">Combine them and create your metro style</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    <!-- /.container -->

    <div class="container">
        <!-- Footer -->
		<{include file="frontend/footer.tpl"}>
    </div>
    <!-- /.container -->

	<{include file="frontend/js.tpl"}>
	<script src="/js/index.js"></script>
</body>
</html>
