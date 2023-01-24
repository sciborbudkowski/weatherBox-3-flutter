import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:weatherbox/settings.dart' as settings;

import 'pirate_models.dart';

class PirateApi {
  static Future<WeatherModel> fetchData(Position position) async {
    var url = settings.pirateWeatherApiUrlString
        .replaceAll('%lat%', position.latitude.toString())
        .replaceAll('%lon%', position.longitude.toString());
    print(url);

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return weatherModelFromJson(response.body);
    } else {
      throw Exception('Failed to load weather data.');
    }
  }
}
