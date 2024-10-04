import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class GpsHandler extends GetxController{
  String latitude = '';
  String longitude = '';

  checkLocationPermission()async{
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
    }

    if(permission == LocationPermission.deniedForever){
      return;
    }

    if(permission == LocationPermission.whileInUse || 
      permission == LocationPermission.always)  {
      getCurrentLocation();
    }
  }

  getCurrentLocation()async{
    Position position = await Geolocator.getCurrentPosition();
      latitude = position.latitude.toString();
      longitude = position.longitude.toString();
      update();
  }
}