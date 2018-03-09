

<main class="page-content this-white" style="background: #F0F0F0"  >
    <!-- Breadcrumbs & Page title-->
    <!--
<section class="container-fluid this-padding this-center" style="height: 300px; background-image: url('/images/bg-image-3.jpg'); background-size: cover; background-position: center"></section>
-->
    <{include file="Frontend/breadcrumbs.tpl"}>
    <section class=" text-left container " style="background: #fff; position:inherit;padding: 0px"   >
        <div class="row">
            <div class="col-sm-1"></div>
            <div class="col-sm-10 this-card" style="margin-bottom: 30px; padding-bottom: 20px">
                <br>
                <{foreach from=$sum item=row key=index}>
                <center><h5 style="font-weight: bold">  Food Delivery  </h5></center>
                <hr/>
                <div class="col-sm-12">
                    <p>ORDER ID :<{$row.o_id}></p>
                    <p>ORDER DATE:<{$row.add_datetime}></p>
                </div>
                <CENTER><h6 style="font-weight: bold"><u> INVOICE </u> </h6></CENTER>
                <div class="this-container" style="padding: 0px">

                    <table class="table table-striped table-condensed">
                        <thead>
                        <tr>
                            <th style="text-align:center; width: 50%; border-bottom: 2px solid #ddd;">Description</th>
                            <th style="text-align:center; width: 12%; border-bottom: 2px solid #ddd;">Quantity</th>
                            <th style="text-align:center; width: 24%; border-bottom: 2px solid #ddd;">Price</th>
                            <th style="text-align:center; width: 26%; border-bottom: 2px solid #ddd;">Subtotal</th>
                        </tr>
                        </thead>
                        <tbody>
                        <{foreach from=$order item=row key=index}>
                        <tr>
                            <td style="text-align:left;"><{$row.f_name}></td>
                            <td style="text-align:center;"><{$row.od_num}></td>
                            <td style="text-align:right;"><{$row.f_large_price}></td>
                            <td style="text-align:right;"><{$row.od_price}></td>
                        </tr>
                            <{/foreach}>
                        <tfoot>

                        <tr>
                            <th colspan="2" style="text-align:left;">Total : </th>
                            <th colspan="2" style="text-align:right;"><{$row.total}></th>
                        </tr>

                        <tr><th colspan="2" style="text-align:left;">Deliver Fee :</th><th colspan="2"
                                                                                     style="text-align:right;">1
                                .00</th></tr>

                        <tr>
                            <th colspan="2" style="text-align:left;">Grand Total : </th>
                            <th colspan="2" style="text-align:right;"><{$row.total+1}></th>
                        </tr>

                        </tfoot>
                    </table>

                </div>
                <{/foreach}>
            </div>
        </div>
    </section>





</main>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js"></script>
<script type="text/javascript" src="/js/ResizeSensor.js"></script>
<script type="text/javascript" src="/js/sticky-sidebar.js"></script>
<script>

    jQuery(function($) {

        var $inv=$('#inv');

        if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) )
        {
            $cache.removeClass("stuck");
            $inv.addClass('this-hide');
            $inv.hide();

        }
</script>
<script type="text/javascript">
    var stickySidebar = new StickySidebar('#sidebar', {
        topSpacing: 20,
        bottomSpacing: 20,
        containerSelector: '.container',
        innerWrapperSelector: '.sidebar__inner'
    });
    var stickySidebar_ = new StickySidebar('#inv', {
        topSpacing: 20,
        bottomSpacing: 20,
        leftSpacing:20,
        containerSelector: '.container',
        innerWrapperSelector: '.inv'
    });

    var lat="<{$lat}>";
    var lang="<{$lng}>";
    var r_name="<{$r_name}>";

    // The following example creates a marker in Stockholm, Sweden using a DROP

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


</script>
