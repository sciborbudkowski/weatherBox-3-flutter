import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:weatherbox/settings.dart' as settings;

import 'aqi_model.dart';

class AqiApi {
  static Future<AqiModel> fetchData(Position position) async {
    var url = settings.openWeatherApiUrlString
        .replaceAll('%lat%', position.latitude.toString())
        .replaceAll('%lon%', position.longitude.toString());
    print(url);

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return aqiModelFromJson(response.body);
    } else {
      throw Exception('Failed to load AQI data.');
    }
  }
}
