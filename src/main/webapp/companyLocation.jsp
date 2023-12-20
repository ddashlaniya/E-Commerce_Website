<?xml version="1.0" encoding="UTF-8" ?>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Insert title here</title>
</head>
<body>

	 <!-- api keys -->
    <script src="AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg"></script>
<h1>the first google map created myself</h1>
    <div id="map" style="width: 100%; height: 400px;"> </div>
    <script>
        function createMap() {
            var mapCanvas = document.getElementById(map);
            var mapOptions=(){
                 center: new google.map.Lating(51.5,-0.2),zoom:10
                // center: {lat: -34.397, lng: 150.644},
                // zoom: 8
            };
            var map = new google.Map(mapCanvas);
        }
    </script>
</body>
</html>