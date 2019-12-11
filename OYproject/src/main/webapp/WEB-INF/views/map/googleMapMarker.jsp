<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Simple Map</title>
<style type="text/css">
	#map{
		height: 100%;
	}
	html, body{
		height: 100%;
		margin: 0;
		padding: 0;
	}
</style>

</head>
<body>
   <div id="map"></div>
   <script>
   function initMap() {
       // The location of Uluru
       var uluru = {
          lat : -25.344,
          lng : 131.036
       };
       var uluru2 = {
          lat : -29.344,
          lng : 129.036
       };
       // The map, centered at Uluru
       var map = new google.maps.Map(
          document.getElementById('map'), {
          zoom : 4,
          center : uluru
       });
       // The marker, positioned at Uluru
       var marker = new google.maps.Marker({
          position : uluru,
          map : map
       });
       var marker2 = new google.maps.Marker({
          position : uluru2,
          map : map
       });
    }
   </script>
   <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD5gkasmIeg0YiXtdQdSNN0aBf0dDP9RZY&callback=initMap"
      async defer></script>
</body>
</html>
