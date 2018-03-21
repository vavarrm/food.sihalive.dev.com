$(function(){
	var $inv=$('#inv');

	if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) )
	{
		//$cache.removeClass("stuck");
		$inv.addClass('this-hide');
		$inv.hide();

	}
	// 先取得 #cart 及其 top 值
	var $cart = $('#sidebar__inner'),
		_top = $cart.offset().top;
	var $cart2 = $('#inv'),
	if(typeof  $cart2 !="undefined"")
	{
		_top2 = $cart2.offset().top;
    }
	// 當網頁捲軸捲動時
	var $win = $(document).scroll(function(){
		// 如果現在的 scrollTop 大於原本 #cart 的 top 時
		if($win.scrollTop() >= _top){
			// 如果 $cart 的座標系統不是 fixed 的話
			if($cart.css('position')!='fixed'){
				// 設定 #cart 的座標系統為 fixed
				$cart.css({
					position: 'fixed',
					top: 0
				});
			}
		}else{
			// 還原 #cart 的座標系統為 absolute
			$cart.css({
				position: 'absolute',
				width:'260px',
			});
		}

		// 如果現在的 scrollTop 大於原本 #cart 的 top 時
		if($win.scrollTop() >= _top2){
			// 如果 $cart 的座標系統不是 fixed 的話
			if($cart2.css('position')!='fixed'){
				// 設定 #cart 的座標系統為 fixed
				$cart2.css({
					position: 'fixed',
					top: 0
				});
			}
		}else{
			// 還原 #cart 的座標系統為 absolute
			$cart2.css({
				position: 'absolute',
				top: '',
				width:'260px',
			});
		}
	});
	
	
	try {

		var point = {
			lat: lat,
			lng: lang,
		};
		var markerSize = {
			x: 22,
			y: 40
		};


		google.maps.Marker.prototype.setLabel = function(label) {
			this.label = new MarkerLabel({
				map: this.map,
				marker: this,
				text: label
			});
			this.label.bindTo('position', this, 'position');
		};

		var MarkerLabel = function(options) {
			this.setValues(options);
			this.span = document.createElement('span');
			this.span.className = 'map-marker-label';
		};

		MarkerLabel.prototype = $.extend(new google.maps.OverlayView(), {
			onAdd: function() {
				this.getPanes().overlayImage.appendChild(this.span);
				var self = this;
				this.listeners = [
					google.maps.event.addListener(this, 'position_changed', function() {
						self.draw();
					})
				];
			},
			draw: function() {
				var text = String(this.get('text'));
				var position = this.getProjection().fromLatLngToDivPixel(this.get('position'));
				this.span.innerHTML = text;
				this.span.style.left = (position.x - (markerSize.x / 2)) - (text.length * 3) + 10 + 'px';
				this.span.style.top = (position.y - markerSize.y + 40) + 'px';
			}
		});

		function initialize() {
			var myLatLng = new google.maps.LatLng(point.lat, point.lng);
			var gmap = new google.maps.Map(document.getElementById('map_canvas'), {
				zoom:16,
				center: myLatLng,
				mapTypeId: google.maps.MapTypeId.ROADMAP
			});
			var myMarker = new google.maps.Marker({
				map: gmap,
				position: myLatLng,
				label: r_name,
				draggable: true
			});
		}

		initialize();
	} catch (e) {
		alert(e);
	}
	
	function changeOrderNum(input)
	{
		
		var total = 0;
		$.each($('.order_num'),function(i,e){
			// var subtotal = parseFloat($(e).data('subtotal'),2);
			total+=$(e).val()*$(e).data('price');		
		})
		$('.total').html(parseFloat(total,2).toFixed(2));
	}
	
	$( "body" ).on( "click", ".stepper-arrow.up", function(e) {	
		var input = $(this).parent().find('input');
		if($(input).hasClass( "ng-valid" ) ==false)
		{
			return false;
		}
		var max   =parseInt(input.attr('max'));
		var val   =parseInt(input.val());
		if(val > max)
		{
			return false;
		}
		input.val(val +1);
		changeOrderNum(input)
	});

	$( "body" ).on( "click", ".stepper-arrow.down", function() {
		var input = $(this).parent().find('input');
		if($(input).hasClass( "ng-valid" ) ==false)
		{
			return false;
		}
		var min   =parseInt(input.attr('min'));
		var val   =parseInt(input.val());
		if(val <= min)
		{
			return false;
		}
		input.val(val -1);
		changeOrderNum(input);
	});
	
});





// The following example creates a marker in Stockholm, Sweden using a DROP


$("#sidebar ul li a[href^='#']").on('click', function(e) {

	// prevent default anchor click behavior
	e.preventDefault();

	// store hash
	var hash = this.hash;

	// animate
	$('html, body').animate({
		scrollTop: $(hash).offset().top
	}, 1000, function(){

		// when done, add hash to url
		// (default click behaviour)
		window.location.hash = hash;
	});

});