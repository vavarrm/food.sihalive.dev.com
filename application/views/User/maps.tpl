
<!DOCTYPE html >
<html ng-app="sihaliveApp">

<head lang="en">
    <title>Location</title>
    <meta charset="UTF-8">
    <!-- Bootstrap stuff -->
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/css/sihalive-style.css">
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script type="text/javascript" src='https://maps.google.com/maps/api/js?sensor=false&libraries=places'></script>
    <script src="https://www.jqueryscript.net/demo/Location-Picker-Place-Autocomplete-Plugin-For-Google-Maps-Location-Picker/dist/locationpicker.jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <script src="/js/main.js"></script>
    <script type="text/javascript" src="/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/js/script.min.js"></script>
    <script src="/js/socket.io.js"></script>
    <script type="text/javascript" src="/js/angular.min.js"></script>
    <script type="text/javascript" src="/js/angular-cookies.min.js"></script>


    <script type="text/javascript" src="/js/main.js"></script>
</head>

<body onload="geoFindMe()" ng-controller="bodyCtrl" ng-init="init()"  >
<div class="form-horizontal" style="width: 100%"  ng-controller="userCtrl" ng-init="init()" >


    <div id="us3" style="width:100%; height:800px;"></div>
    <div class="clearfix">&nbsp;</div>
    <div class="m-t-small">


        <div class="col-sm-3">
            <div id="out"></div>

                <button onclick="window.history.back();" class=" this-margin-top this-top this-right this-btn-this
                btn" style="width:80px" >
                    <span class="glyphicon glyphicon-circle-arrow-left"></span>Back
                </button>

                <button id="location" class=" this-margin-top this-top this-right this-btn-this
                btn" style="width: 150px; right: 10px" ><span class="glyphicon glyphicon-map-marker"></span>Your
                    Location</button>

        </div>

        <div class="col-sm-12 this-bottom this-white this-padding this-border-top " style="height: 25%">
           <form method="post" action="/User_Position/google_insert">
               <div class="col-sm-12  this-hide-small">
                   <div class="col-xs-6 col-sm-4 col-md-4">
                       <input type="text" class="form-control" style="display: none"   id="o_consignee"
                              ng-model="u_id" name="u_id" required>
                       <input type="text" class="form-control"  id="us3-lat" name="lat" required readonly />
                   </div>
                   <div class="col-xs-6 col-sm-4 col-md-4 ">
                       <input type="text" class="form-control" id="us3-lon" name="lag" required="required" readonly/>
                   </div>
               </div>
               <div class="col-sm-12">
                   <div class="col-xs-12 col-sm-4 col-md-4 this-padding">
                       <input type="text" class="form-control " name="title" placeholder="Title name ... "required="required">
                   </div>
                   <div class="col-xs-12 col-sm-4 col-md-4 this-padding">
                       <input type="text" class="form-control " name="desc" placeholder="Description.." required="required">
                   </div>

               </div>
               <div class="col-sm-12">
                   <input type="submit" class="btn this-btn-this" value="Save" name="save_google" style="margin-left: 15px">
               </div>
           </form>
        </div>
    </div>
    <div class="clearfix"></div>
    <script>
        var lat="0",lag="0";
          function geoFindMe()
          {


              if (!navigator.geolocation){
                  output.innerHTML = "<p>Geolocation is not supported by your browser</p>";
                  return;
              }
              function success(position) {
                  lat  = position.coords.latitude;
                  lag = position.coords.longitude;
                  $('#us3').locationpicker({
                      location: {
                          latitude:lat,
                          longitude:lag,
                          zoom: 10,
                      },
                      radius:400,
                      inputBinding: {
                          latitudeInput: $('#us3-lat'),
                          longitudeInput: $('#us3-lon'),
                      },
                      enableAutocomplete: true,
                      onchanged: function (currentLocation, radius, isMarkerDropped) {
                      }
                  });
              }
              function error() {
                alert("get location Error ");
              }
              navigator.geolocation.getCurrentPosition(success, error);
          }

          $('#location').on('click', function (exx) {
              //geoFindMe();
              exx.type = 'change';
              $('#us3-lat').val(lat).trigger(exx);
              $('#us3-lon').val(lag).trigger(exx);


          })




    </script>
</div>
</body>

</html>