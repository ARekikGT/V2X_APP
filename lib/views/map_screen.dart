import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../services/geolocation_service.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // ignore: unused_field
  late GoogleMapController _controller;
  LatLng _initialPosition = LatLng(37.7749, -122.4194);
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    var location = await GeolocationService().getCurrentLocation();
    setState(() {
      _initialPosition = LatLng(location.latitude, location.longitude);
      _markers.add(
        Marker(
          markerId: MarkerId("current_location"),
          position: _initialPosition,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 14,
        ),
        myLocationEnabled: true,
        markers: _markers,
        onMapCreated: (controller) => _controller = controller,
      ),
    );
  }
}
