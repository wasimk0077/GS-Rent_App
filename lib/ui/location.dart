import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:geocoder/geocoder.dart';
import 'package:latlong2/latlong.dart';
// import 'package:latlong/latlong.dart';
// import 'package:latlong2/latlong/LatLng.dart';

class MapApp extends StatefulWidget {
  @override
  _MapAppState createState() => _MapAppState();
}

class _MapAppState extends State<MapApp> {
  double  long = 49.5;
  double lat = -0.09;
  LatLng point = LatLng(49.5, -0.09);
  

  @override
  Widget build(BuildContext context) {
    
      return  FlutterMap(
       
    options: MapOptions(
        // screenSize: Size(10, 10),
        center: LatLng(51.509364, -0.128928),
        zoom: 9.5,
    ),
    nonRotatedChildren: [
        AttributionWidget.defaultWidget(
            source: 'OpenStreetMap contributors',
            onSourceTapped: null,
        ),
    ],
    children: [
        TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
        ),
         MarkerLayer(
            markers: [
                Marker(
                  point: point,
                  width: 80,
                  height: 80,
                  builder: (context) => Icon(Icons.podcasts_rounded),
                ),
            ],
        ),
    ],
);
        
     
  }
}
