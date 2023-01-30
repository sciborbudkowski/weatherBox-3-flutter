import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'package:weatherbox/aqi/aqi_model.dart';
import 'package:weatherbox/location/location_models.dart';
import 'package:weatherbox/pirate/pirate_models.dart' as pirate;
import 'package:weatherbox/pirate/weather_models.dart';
import 'package:weatherbox/ui/weather_description_view.dart';
import 'package:weatherbox/unsplash/unsplash_api.dart';
import 'package:weatherbox/ui/location_view.dart';
import 'package:weatherbox/ui/side_icons_column_view.dart';
import 'package:weatherbox/ui/weather_text_values_view.dart';
import 'package:weatherbox/ui/daily_forecast_view.dart';
import 'package:weatherbox/ui/hourly_forecast_view.dart';
import 'package:weatherbox/ui/attribution_view.dart';

class MainView extends StatelessWidget {
  const MainView({
    super.key,
    required this.weather,
    required this.locationInfo,
    required this.aqi,
    required this.photo,
  });

  final pirate.WeatherModel weather;
  final LocationModel locationInfo;
  final AqiModel aqi;
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    String locale = Localizations.localeOf(context).languageCode;
    print(locale);
    DateTime now = DateTime.now();
    // DateFormat formatter = DateFormat.EEEE(locale).add_d() //('EEEE, dd MMMM yyyy').;
    initializeDateFormatting(locale);
    String date =
        '${DateFormat.EEEE(locale).format(now)}, ${DateFormat.d(locale).format(now)} ${DateFormat.MMMM(locale).format(now)} ${DateFormat.y(locale).format(now)}';
    print(date);

    var hourlyForecast = <HourlyForecastModel>[];
    for (var item in weather.hourly.data) {
      hourlyForecast.add(HourlyForecastModel(
          hour: item.time.toInt(),
          icon: item.icon,
          temperature: item.temperature));
    }

    var aqiForecast = <String>[];
    for (var item in aqi.list) {
      aqiForecast.add(Aqi.getIconFor(item.main.aqi));
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LocationView(
                currentDate: date,
                city: locationInfo.placemark.name ?? '',
                region: locationInfo.placemark.administrativeArea ?? ''),
            SideIconsColumnView(
                windSpeed: Beaufort.getIconFor(weather.currently.windSpeed),
                airPollution: Aqi.getIconFor(aqi.list[0].main.aqi),
                currentWeather: Weather.getIconFor(weather.currently.icon),
                uvIndex:
                    UVIndex.getIconFor((weather.currently.uvIndex).toInt()),
                moonPhase: Moon.getIconFor(weather.daily.data[0].moonPhase)),
            WeatherDescriptionView(
                description:
                    Weather.getDescriptionPLFor(weather.currently.icon)),
            WeatherTextValues(
                windSpeedValue: weather.currently.windSpeed.toStringAsFixed(0),
                temperatureValue:
                    weather.currently.temperature.toStringAsFixed(0),
                humidityValue:
                    (weather.currently.humidity * 100).toStringAsFixed(0),
                pressureValue: weather.currently.pressure.toStringAsFixed(0),
                feelsLikeValue:
                    weather.currently.apparentTemperature.toStringAsFixed(0),
                uvValue: weather.currently.uvIndex.toStringAsFixed(2)),
            HourlyForecastView(hourlyForecast: hourlyForecast.sublist(1)),
            DailyForecastView(
                dailyForecast: weather.daily.data, aqiIcon: aqiForecast),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child:
                  AttributionView(name: photo.username, url: photo.profileUrl),
            ),
          ],
        ),
      ),
    );
  }
}
