import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  //1 getCurrentPosition() method from Geolocator package
//2 asking users permission for tracking location for both ios + android
//using Future for promise: sending it to a new location obj on loading_screen.dart
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
