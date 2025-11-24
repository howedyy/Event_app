import 'package:flutter/material.dart';
import 'package:location/location.dart';

class MapTabProvider extends ChangeNotifier{
 final Location location = Location();
 String locationMessage = '';

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


 Future<void> getUserLocation()async{
  bool isPermissionGranted = await _getLocationPermission();
  if(!isPermissionGranted){
    locationMessage = "Permission is denied";
    notifyListeners();
    return;
  }

  bool isGpsServiceEnabled = await _checkLocationService();
  if(!isGpsServiceEnabled){
    locationMessage = "GPS not enabled";
    notifyListeners();
    return;
  }

  locationMessage = "Getting location now...";
  notifyListeners();
 }
}