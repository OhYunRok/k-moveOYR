<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
   height: 100%;
}
/* Optional: Makes the sample page fill the window. */
html, body {
   height: 500px;
   margin: 0;
   padding: 0;
}

.place {
   padding: 3px;
}

.place_nm {
   font-size: 18px;
   font-weight: bold;
   margin-bottom: 5px;
}

.place_address {
   margin-bottom: 5px;
}
/* ???? */
.pac-container {
   z-index: 9999;
}
</style>
</head>
<body>
  
    <!-- Page -->
    <div class="page">
      <div class="page-header">
        <h1 class="page-title">BOARD</h1>
      </div>

      <div class="page-content container-fluid">

                <button id="btnAddPlace" class="btn btn-sm btn-primary btn-outline" type="button">장소 추가</button>
                
            <!-- Modal insert-->
            <div class="modal fade" id="addPlaceModal" aria-hidden="false" aria-labelledby="addPlacetModalTitle" role="dialog" tabindex="-1">
               <div class="modal-dialog modal-simple">
                  <form class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">×</span>
                        </button>
                        <h4 class="modal-title" id="addPlaceModalTitle">장소 추가</h4>
                     </div>
                     <div class="modal-body">
                        <div class="row">
                           <div class="col-xl-12 form-group">
                              <input id="inputSearch" type="text" class="form-control" name="title" placeholder="검색어를 입력하세요.">
                           </div>
                           <div class="col-xl-12 form-group" style="height: 500px;">
                              <div id="map"></div>
                           </div>
                           <div class="col-md-12 float-right">
                              <button id="btnAddPlaceInsert" class="btn btn-sm btn-primary btn-outline" data-dismiss="modal" type="button">등록</button>
                           </div>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
            <!-- End Modal -->
            
      </div>
    </div>
    <!-- End Page -->
    
<script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD5gkasmIeg0YiXtdQdSNN0aBf0dDP9RZY&libraries=places&callback=initMap"
      async defer></script>
      
      <script>
      var MAP_VIEW;
      var DEFAULT_MAP_LOCATION = {
         lat : 37.5701,
         lng : 126.9769
      }; //kwanghwamoon
      var MARKER;

      $(document).ready(function() {

         $("#btnAddPlace").click(function() {
            $("#addPlaceModal").modal("show");
         });
      });

      function initMap() {

         MAP_VIEW = new google.maps.Map(document.getElementById("map"), {
            center : DEFAULT_MAP_LOCATION,
            scrollwheel : false,
            zoom : 8
         });

         var input = document.getElementById("inputSearch");

         var autocomplete = new google.maps.places.Autocomplete(input);

         autocomplete.bindTo('bounds', MAP_VIEW);

         MARKER = new google.maps.Marker({
            map : MAP_VIEW
         });

         google.maps.event.addListener(MARKER, 'click', function() {
            INFO_WINDOW.open(MAP_VIEW, MARKER);
         });

         google.maps.event
               .addListener(
                     autocomplete,
                     'place_changed',
                     function() {

                        //INFO_WINDOW.close();
                        var place = autocomplete.getPlace();
                        if (!place.geometry) {
                           return;
                        }

                        if (place.geometry.viewport) {
                           MAP_VIEW.fitBounds(place.geometry.viewport);
                        } else {
                           MAP_VIEW.setCenter(place.geometry.location);
                           MAP_VIEW.setZoom(SEARCHED_MAP_LEVEL);
                        }

                        // Set the position of the marker using the place ID and location.
                        MARKER.setPlace(/** @type {!google.maps.Place} */
                        ({
                           placeId : place.place_id,
                           location : place.geometry.location
                        }));
                        MARKER.setVisible(true);

                        var place_html = '<div class="place" '
                              + 'data-place_id="'
                              + place.place_id
                              + '" '
                              + 'data-place_lat="'
                              + place.geometry.location.lat()
                              + '" '
                              + 'data-place_lng="'
                              + place.geometry.location.lng()
                              + '">'
                              + '   <div class="place_nm">'
                              + place.name
                              + '</div>'
                              + '   <div class="place_address">'
                              + place.formatted_address
                              + '</div>'
                              + '   <button type="button" class="btn btn-xs btn-primary btnAddPlace">추가</button>'
                              + '</div>';

                        INFO_WINDOW = new google.maps.InfoWindow({
                           content : place_html
                        });

                        INFO_WINDOW.open(MAP_VIEW, MARKER);

                        google.maps.event.addListener(INFO_WINDOW,
                              'domready', add_place_event_handler);

                     });
      }

      function add_place_event_handler() {

         $(".btnAddPlace").click(
               function() {

                  var place_id = $(this).closest(".place").data(
                        "place_id");
                  var place_lat = $(this).closest(".place").data(
                        "place_lat");
                  var place_lng = $(this).closest(".place").data(
                        "place_lng");
                  var place_nm = $(this).closest(".place").find(
                        ".place_nm").html();
                  var place_address = $(this).closest(".place").find(
                        ".place_address").html();

                  console.log("place_id : " + place_id);
                  console.log("place_lat : " + place_lat);
                  console.log("place_lng : " + place_lng);
                  console.log("place_nm : " + place_nm);
                  console.log("place_address : " + place_address);

                  //INFO_WINDOW.close();
               });
      }
   </script>

</body>
</html>