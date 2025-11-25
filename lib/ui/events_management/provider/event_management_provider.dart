import 'dart:developer';

import 'package:evently/ui/events_management/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

class EventManagementProvider extends ChangeNotifier {
  EventManagementProvider() {
    getUserLocation();
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  TextEditingController get titleController => _titleController;
  TextEditingController get descriptionController => _descriptionController;

  Category _selectedCategory = Category.categories[0];
  DateTime? _currentDate;
  TimeOfDay? _currentTime;

  Category get selectedCategory => _selectedCategory;
  DateTime? get currentDate => _currentDate;
  TimeOfDay? get currentTime => _currentTime;

  void setSelectedCategory(int index) {
    if (_selectedCategory.id != Category.categories[index].id) {
      _selectedCategory = Category.categories[index];
      notifyListeners();
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: _currentDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (newSelectedDate != null) {
      _currentDate = newSelectedDate;
      notifyListeners();
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? newSelectedTime = await showTimePicker(
      context: context,
      initialTime: _currentTime ?? TimeOfDay.now(),
    );
    if (newSelectedTime != null) {
      _currentTime = newSelectedTime;
      notifyListeners();
    }
  }

  String getFormattedDate(String chooseDateText) {
    return _currentDate == null
        ? chooseDateText
        : DateFormat("dd/MM/yyyy").format(_currentDate!);
  }

  String getFormattedTime(BuildContext context, String chooseTimeText) {
    return _currentTime != null
        ? _currentTime!.format(context)
        : chooseTimeText;
  }

  late GoogleMapController mapController;

  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 17,
  );

  Set<Marker> markers = {};

  final Location location = Location();

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

  LatLng? eventLocation;
  String? area;
  String? city;
  String? country;

  void pickLocation(LatLng location) {
    eventLocation = location;
    markers.add(
      Marker(
        markerId: MarkerId('2'),
        position: location,
        infoWindow: InfoWindow(
          title: 'Event Location',
          snippet: 'New location is selected',
        ),
      ),
    );
    notifyListeners();
  }

  Future<void> convertLatLng() async {
    if (eventLocation == null) return;
    List<geocoding.Placemark> placemarks = await geocoding
        .placemarkFromCoordinates(
          eventLocation?.latitude ?? 0,
          eventLocation?.longitude ?? 0,
        );

    if (placemarks.isNotEmpty) {
      area = placemarks.first.locality ?? 'unknown';
      city = placemarks.first.administrativeArea ?? 'unknown';
      country = placemarks.first.country ?? 'unknown';
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
