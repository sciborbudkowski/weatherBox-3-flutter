import 'package:http/http.dart' as http;
import 'package:weatherbox/aqi/aqi_model.dart';
import 'package:weatherbox/location/location_models.dart';
import 'package:weatherbox/pirate/pirate_api.dart';

import 'package:weatherbox/pirate/pirate_models.dart';
import 'package:weatherbox/unsplash/unsplash_api.dart';
import 'package:weatherbox/location/location.dart';
import 'package:weatherbox/aqi/aqi_api.dart';

class DataModel {
  const DataModel(
      {required this.weather,
      required this.photos,
      required this.locationInfo,
      required this.aqi});
  final WeatherModel weather;
  final List<Photo> photos;
  final LocationModel locationInfo;
  final AqiModel aqi;
}

Future<DataModel> getAppData() async {
  final position = await Location.determinePosition();
  final unsplash = await UnsplashPhoto.fetchPhotos(http.Client());
  final weather = await PirateApi.fetchData(position.position);
  final aqi = await AqiApi.fetchData(position.position);

  final data = DataModel(
      weather: weather, photos: unsplash, locationInfo: position, aqi: aqi);

  return data;
}
