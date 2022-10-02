// import 'package:authh_app/main.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// // import 'package:flutter_map/flutter_map.dart';
// // import 'package:geocoder/geocoder.dart';
// // import 'package:latlong2/latlong.dart';
// import 'package:geocoder/geocoder.dart';
// import 'package:latlong/latlong.dart';
// // import 'package:latlong2/latlong/LatLng.dart';

// class MapApp extends StatefulWidget {
//   @override
//   _MapAppState createState() => _MapAppState();
// }

// class _MapAppState extends State<MapApp> {
//   double  long = 49.5;
//   double lat = -0.09;
//   LatLng point = LatLng(49.5, -0.09);
//   var location=[];
  

//   @override
//   Widget build(BuildContext context) {
    
     
//        return Stack(
//       children: [
//         FlutterMap(
//           options: MapOptions(
//             onTap: (p) async {
//               location = await Geocoder.local.findAddressesFromCoordinates(
//                   new Coordinates(p.latitude, p.longitude));

//               setState(() {
//                 point = p;
//                 print(p);
//               });

//               print(
//                   "${location.first.countryName} - ${location.first.featureName}");
//             },
//             center: LatLng(49.5, -0.09),
//             zoom: 5.0,
//           ),
//           layers: [
//             TileLayerOptions(
//                 urlTemplate:
//                     "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
//                 subdomains: ['a', 'b', 'c']),
//                 // tileProvider: CachedNetworkTileProvider(),
//             MarkerLayerOptions(
//               markers: [
//                 Marker(
//                   width: 80.0,
//                   height: 80.0,
//                   point: point,
//                   builder: (ctx) => Container(
//                     child: Icon(
//                       Icons.location_on,
//                       color: Colors.red,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
        
//       ],
//     );
     
//   }
// }
