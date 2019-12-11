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
      var map;
      function initMap() {
         map = new google.maps.Map(
            document.getElementById('map'), 
            {
               center : {
                  lat : -34.397,
                  lng : 150.644
            },
            zoom : 8
         });
      }
   </script>
   <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD5gkasmIeg0YiXtdQdSNN0aBf0dDP9RZY&callback=initMap"
      async defer></script>
</body>
</html>
