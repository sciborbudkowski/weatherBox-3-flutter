import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weatherbox/location/location_models.dart';

class Location {
  static Future<LocationModel> determinePosition() async {
    bool enabled;
    LocationPermission permission;

    enabled = await Geolocator.isLocationServiceEnabled();
    if (!enabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    final placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    return LocationModel(position: position, placemark: placemark.first);
  }
}
