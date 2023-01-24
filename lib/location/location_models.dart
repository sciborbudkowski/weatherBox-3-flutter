import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationModel {
  const LocationModel({required this.position, required this.placemark});
  final Position position;
  final Placemark placemark;
}
