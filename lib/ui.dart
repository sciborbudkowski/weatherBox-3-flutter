import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:weatherbox/aqi/aqi_model.dart';
import 'package:weatherbox/location/location_models.dart';
import 'package:weatherbox/pirate/pirate_models.dart' as pirate;
import 'package:weatherbox/styles/styles.dart';
import 'package:weatherbox/pirate/weather_models.dart';
import 'package:weatherbox/extensions/extensions.dart';

class MainView extends StatelessWidget {
  const MainView(
      {super.key,
      required this.weather,
      required this.locationInfo,
      required this.aqi});

  final pirate.WeatherModel weather;
  final LocationModel locationInfo;
  final AqiModel aqi;

  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('EEEE, dd MMMM yyyy');

  @override
  Widget build(BuildContext context) {
    var currentDate = formatter.format(now);

    var city = locationInfo.placemark.name ?? '';
    var region = locationInfo.placemark.administrativeArea ?? '';

    var windSpeed = Beaufort.getIconFor(weather.currently.windSpeed);
    var moonPhase = Moon.getIconFor(weather.daily.data[0].moonPhase);
    var uvIndex = UVIndex.getIconFor((weather.currently.uvIndex).toInt());
    var airPollution = Aqi.getIconFor(aqi.list[0].main.aqi);
    var currentWeather = Weather.getIconFor(weather.currently.icon);
    var weatherDescription =
        Weather.getDescriptionPLFor(weather.currently.icon);
    var windSpeedValue = weather.currently.windSpeed.toStringAsFixed(0);
    var temperatureValue = weather.currently.temperature.toStringAsFixed(0);
    var humidityValue = (weather.currently.humidity * 100).toStringAsFixed(0);
    var pressureValue = weather.currently.pressure.toStringAsFixed(0);
    var feelsLikeValue =
        weather.currently.apparentTemperature.toStringAsFixed(0);
    var uvValue = weather.currently.uvIndex.toStringAsFixed(2);

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
            Row(
              children: [
                Text(currentDate, style: Style.dateTextStyle),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Row(
                    children: [
                      Text(city, style: Style.locationTextStyle),
                      city == ''
                          ? const Text('')
                          : const Text(', ', style: Style.locationTextStyle),
                      Text(region, style: Style.locationTextStyle),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconTextView(imageName: windSpeed, text: 'skala beauforta'),
                    const SizedBox(height: 10),
                    IconTextView(
                        imageName: airPollution, text: 'jakość powietrza'),
                  ],
                ),
                Image(
                    image: AssetImage(currentWeather),
                    width: MediaQuery.of(context).size.width / 2.5),
                Column(
                  children: [
                    IconTextView(imageName: uvIndex, text: 'index UV'),
                    const SizedBox(height: 10),
                    IconTextView(imageName: moonPhase, text: 'faza księżyca'),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(weatherDescription,
                      style: Style.temperatureMinorTextStyle),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    TextValueView(
                        description: 'wiatr', value: '$windSpeedValue km/h'),
                  ],
                ),
                Column(
                  children: [
                    TextValueView(
                        description: 'temperatura',
                        value: '$temperatureValue °C'),
                  ],
                ),
                Column(
                  children: [
                    TextValueView(
                        description: 'wilgotność', value: '$humidityValue%'),
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Divider(
                height: 2,
                thickness: 1,
                indent: 30,
                endIndent: 30,
                color: Colors.white54,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    TextValueView(
                        description: 'ciśnienie', value: '$pressureValue hPa'),
                  ],
                ),
                Column(
                  children: [
                    TextValueView(
                        description: 'odczuwalna', value: '$feelsLikeValue °C'),
                  ],
                ),
                Column(
                  children: [
                    TextValueView(description: 'index UV', value: uvValue),
                  ],
                ),
              ],
            ),
            HourlyForecastView(hourlyForecast: hourlyForecast),
            DailyForecastView(
                dailyForecast: weather.daily.data, aqiIcon: aqiForecast)
          ],
        ),
      ),
    );
  }
}

class IconTextView extends StatelessWidget {
  const IconTextView({super.key, required this.imageName, required this.text});
  final String imageName;
  final String text;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.transparent,
            )),
            width: MediaQuery.of(context).size.width / 6,
            height: MediaQuery.of(context).size.width / 6,
            child:
                Image(image: AssetImage(imageName), width: size, height: size)),
        Text(text, style: Style.iconTextStyle),
      ],
    );
  }
}

class TextValueView extends StatelessWidget {
  const TextValueView(
      {super.key, required this.description, required this.value});
  final String description;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(description, style: Style.iconTextStyle),
        Text(value, style: Style.valueTextStyle),
      ],
    );
  }
}

class HourlyForecastView extends StatelessWidget {
  const HourlyForecastView({super.key, required this.hourlyForecast});
  final List<HourlyForecastModel> hourlyForecast;

  @override
  Widget build(BuildContext context) {
    var hourlyCells = <Widget>[];
    var scrollController = ScrollController();

    for (var item in hourlyForecast) {
      var cell = HourlyCellView(
          hour: item.getHour(),
          weatherIcon: item.getIcon(),
          temperature: item.getTemperature());
      hourlyCells.add(cell);
    }

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: SizedBox(
        height: 120,
        child: Scrollbar(
          controller: scrollController,
          child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(10.0),
              scrollDirection: Axis.horizontal,
              controller: scrollController,
              children: hourlyCells),
        ),
      ),
    );
  }
}

class DailyForecastView extends StatelessWidget {
  const DailyForecastView(
      {super.key, required this.dailyForecast, required this.aqiIcon});
  final List<pirate.Datum> dailyForecast;
  final List<String> aqiIcon;

  @override
  Widget build(BuildContext context) {
    var dailyCells = <Widget>[];
    int counter = 0;

    for (var item in dailyForecast) {
      var cell = DailyCellView(forecast: item, aqiIcon: aqiIcon[counter]);
      dailyCells.add(cell);
      break;
    }
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10.0),
        scrollDirection: Axis.vertical,
        children: dailyCells,
      ),
    );
  }
}

class HourlyCellView extends StatelessWidget {
  const HourlyCellView(
      {super.key,
      required this.hour,
      required this.weatherIcon,
      required this.temperature});
  final String hour;
  final String weatherIcon;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(hour, style: Style.hourlyHourTextStyle),
        Image(image: AssetImage(weatherIcon), width: 50, height: 50),
        Text(temperature, style: Style.hourlyTemperatureTextStyle),
      ],
    );
  }
}

class DailyCellView extends StatelessWidget {
  const DailyCellView(
      {super.key, required this.forecast, required this.aqiIcon});
  final pirate.Datum forecast;
  final String aqiIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              forecast.time.toWeekdayName(),
              style: Style.hourlyTemperatureTextStyle,
            ),
            Text(
              forecast.time.toMonthAndDay(),
              style: Style.valueTextStyle,
            ),
          ],
        ),
        Image(
            image: AssetImage(Weather.getIconFor(forecast.icon)),
            width: 50,
            height: 50),
        Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    const Image(
                        image: AssetImage('assets/images/sun_moon/sunrise.png'),
                        width: 25,
                        height: 25),
                    Text(forecast.sunriseTime.toHourAndMinutes(),
                        style: Style.dateTextStyle),
                  ],
                ),
                const Divider(
                  height: 1,
                  thickness: 5,
                  indent: 5,
                ),
                Column(
                  children: [
                    const Image(
                        image: AssetImage('assets/images/sun_moon/sunset.png'),
                        width: 25,
                        height: 25),
                    Text(forecast.sunsetTime.toHourAndMinutes(),
                        style: Style.dateTextStyle),
                  ],
                ),
              ],
            )
          ],
        ),
        Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.white54,
                  child: Text(
                    '${forecast.temperatureHigh.toStringAsFixed(0)} °C',
                    style: Style.dateTextStyle,
                  ),
                ),
                Container(
                  color: Colors.white24,
                  child: Text(
                    '${forecast.temperatureLow.toStringAsFixed(0)} °C',
                    style: Style.dateTextStyle,
                  ),
                ),
              ],
            )
          ],
        ),
        Column(
          children: [
            Image(
                image: AssetImage(Beaufort.getIconFor(forecast.windSpeed)),
                width: 25,
                height: 25),
            Text(
              '${forecast.windSpeed.toStringAsFixed(0)} km/h',
              style: Style.dateTextStyle,
            ),
          ],
        ),
        Image(image: AssetImage(aqiIcon)),
      ],
    );
  }
}
