import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  final double locationLatitude;
  final double locationLongtitude;

  const MapScreen({
    Key? key,
    required this.locationLatitude,
    required this.locationLongtitude,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(locationLatitude, locationLongtitude),
          zoom: 15,
        ),
        markers: _createMarkers(),
      ),
    );
  }

  Set<Marker> _createMarkers() {
    Set<Marker> markers = {};
    Marker marker1 = Marker(
      markerId: MarkerId('marker1'),
      position: LatLng(locationLatitude, locationLongtitude),
      infoWindow: InfoWindow(
        title: 'Tourist Site',
        snippet: 'Deskripsi marker 1',
      ),
    );
    markers.add(marker1);
    return markers;
  }
}
