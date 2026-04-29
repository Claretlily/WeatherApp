import 'package:geolocator/geolocator.dart';

class LocationService {
  double? longitude;
  double? latitude;
  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.low,
  );

  Future<void> getLocation() async {
    try {
      LocationPermission permission;
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      throw Exception('Failed to get location: $e');
    }
  }
}
