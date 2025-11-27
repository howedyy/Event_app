import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapTabProvider extends ChangeNotifier{
  MapTabProvider(){
    getUserLocation();
  }

  late GoogleMapController mapController;
  CameraPosition cameraPosition = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 17,
  );

  Set<Marker> markers = {};

 final Location location = Location();
 late final StreamSubscription<LocationData> _locationStream;

 Future<bool> _getLocationPermission() async{
  PermissionStatus permissionStatus = await location.hasPermission();

  if(permissionStatus == PermissionStatus.denied){
    permissionStatus = await location.requestPermission();
  }
return permissionStatus == PermissionStatus.granted;
}

Future<bool> _checkLocationService()async {
   bool serviceEnabled = await location.serviceEnabled();
   if(!serviceEnabled){
     serviceEnabled = await location.requestService();
   }
   return serviceEnabled;
}


void changeCameraPositionOnMap(LocationData locationData){
  CameraPosition cameraPosition = CameraPosition(
      target: LatLng(
        locationData.latitude?? 0,
        locationData.longitude?? 0,
      ),

      zoom: 19
  );
  markers.add(
    Marker(markerId: MarkerId("1"),
      position:  LatLng(
        locationData.latitude?? 0,
        locationData.longitude?? 0,
      ),
      infoWindow: InfoWindow(
        title: "My Location", snippet: "This is marker 1",
      ),
    ),

  );

  mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
}

void setLocationListener(){
   location.changeSettings(accuracy: LocationAccuracy.high, interval: 500);
  _locationStream = location.onLocationChanged.listen((LocationData currentLocation) {
   changeCameraPositionOnMap(currentLocation);
   notifyListeners();
  });
}


 Future<void> getUserLocation()async{
  bool isPermissionGranted = await _getLocationPermission();
  if(!isPermissionGranted)  return;
  bool isGpsServiceEnabled = await _checkLocationService();
  if(!isGpsServiceEnabled) return;
  LocationData locationData = await location.getLocation();
  changeCameraPositionOnMap(locationData);
  notifyListeners();
 }


 @override
  void dispose() {
   mapController.dispose();
   _locationStream.cancel();
    print("Provider Disposed");
    super.dispose();
  }
}