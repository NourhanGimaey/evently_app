import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapTabProvider extends ChangeNotifier {
  MapTabProvider() {
    log('MapTabProvider initialized, getting location...');
    getUserLocation();
  }

  late GoogleMapController mapController;

  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 17,
  );
  
  Set<Marker> markers = {};

  final Location location = Location();

  late final StreamSubscription<LocationData> locationStream;

  Future<bool> _getLocationPermissoion() async {
    log('Checking location permission...');
    PermissionStatus permissionStatus = await location.hasPermission();

    if (permissionStatus == PermissionStatus.denied) {
      log('Permission denied, requesting permission...');
      permissionStatus = await location.requestPermission();
    }

    bool isGranted = permissionStatus == PermissionStatus.granted;
    log('Permission granted: $isGranted');
    return isGranted;
  }

  Future<bool> _checkLocationService() async {
    log('Checking location service status...');
    bool serviceEnabled = await location.serviceEnabled();

    if (!serviceEnabled) {
      log('Service not enabled, requesting service...');
      serviceEnabled = await location.requestService();
    }

    log('Service enabled: $serviceEnabled');
    return serviceEnabled;
  }

  void changeCameraPositionOnMap(LocationData locationData) {
    cameraPosition = CameraPosition(
      target: LatLng(locationData.latitude ?? 0, locationData.longitude ?? 0),
      zoom: 17,
    );

    markers.add(
      Marker(
        markerId: const MarkerId('1'),
        position: LatLng(
          locationData.latitude ?? 0,
          locationData.longitude ?? 0,
        ),
        infoWindow: const InfoWindow(
          title: 'My Location',
          snippet: 'This is marker 1',
        ),
      ),
    );
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  Future<void> getUserLocation() async {
    bool isPermissionGranted = await _getLocationPermissoion();
    if (!isPermissionGranted) return;

    bool isLocationServiceEnabled = await _checkLocationService();
    if (!isLocationServiceEnabled) return;

    LocationData locationData = await location.getLocation();
    changeCameraPositionOnMap(locationData);
    notifyListeners();
  }

  @override
  void dispose() {
    log('MapTabProvider got disposed');
    super.dispose();
  }
}
