import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SingleCity extends StatefulWidget {
  final String Latitude;
  final String Longitude;
  final String Address;
  final String Name;
   SingleCity({Key? key, required this.Latitude, required this.Longitude,required this.Address,required this.Name,}) : super(key: key);

  @override
  State<SingleCity> createState() => _SingleCityState();
}

class _SingleCityState extends State<SingleCity>  {


  @override
  void initState() {
    print("fffffffffffffffffffffffff");
    print(widget.Latitude);
    print(widget.Longitude);
    print("fffffffffffffffffffffffff");
    super.initState();
   
  }

  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _markers.clear();
    setState(() {
      final marker = Marker(
        markerId: MarkerId(widget.Name),
        position: LatLng(double.parse(widget.Latitude), double.parse(widget.Longitude)),
        infoWindow: InfoWindow(
            title: widget.Name,
            snippet: widget.Address,
            onTap: () {
              print("${(widget.Latitude)}, ${(widget.Longitude)}");
            }),
        onTap: () {
          print("Clicked on marker");
        },
      );
      print("${double.parse(widget.Latitude)}, ${double.parse(widget.Longitude)}");
      _markers[widget.Name] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('About ${(widget.Name)}')),
      body: Column(
        children: [
          
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(double.parse(widget.Latitude), double.parse(widget.Longitude)),
                zoom: 7,
              ),
              markers: _markers.values.toSet(),
            ),
          )
        ],
      ),
    );
  }
}
