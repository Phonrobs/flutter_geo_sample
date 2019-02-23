import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  final double lat;
  final double long;

  MapPage(this.lat, this.long);

  @override
  State<MapPage> createState() {
    return MapPageState();
  }
}

class MapPageState extends State<MapPage> {
  GoogleMapController mapController;
  CameraPosition initCameraPosition;

  @override
  void initState() {
    super.initState();

    initCameraPosition = CameraPosition(
        target: LatLng(widget.lat, widget.long),
        zoom: 17.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
      ),
      body: GoogleMap(
        initialCameraPosition: initCameraPosition,
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;

            mapController.addMarker(MarkerOptions(
              position: LatLng(widget.lat, widget.long),
              infoWindowText: InfoWindowText('My Position', ':)')
            ));
          });
        },
      ),
    );
  }
}
