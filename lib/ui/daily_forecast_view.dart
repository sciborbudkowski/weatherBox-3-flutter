import 'package:flutter/material.dart';

import 'package:weatherbox/pirate/pirate_models.dart' as pirate;
import 'package:weatherbox/styles/styles.dart';
import 'package:weatherbox/extensions/extensions.dart';
import 'package:weatherbox/pirate/weather_models.dart';

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
      if (counter++ == 0) {
        continue;
      }

      var cell = DailyCellView(
          forecast: item, aqiIcon: aqiIcon[counter], shadeOption: counter);
      dailyCells.add(cell);
    }
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(10.0),
        scrollDirection: Axis.vertical,
        children: dailyCells,
      ),
    );
  }
}

class DailyCellView extends StatelessWidget {
  const DailyCellView(
      {super.key,
      required this.forecast,
      required this.aqiIcon,
      required this.shadeOption});
  final pirate.Datum forecast;
  final String aqiIcon;
  final int shadeOption;

  @override
  Widget build(BuildContext context) {
    Color shadeColor =
        shadeOption % 2 == 0 ? Colors.transparent : Colors.white10;

    return Container(
      color: shadeColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            constraints: const BoxConstraints(minWidth: 80, maxWidth: 80),
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  forecast.time.toWeekdayName(context),
                  style: Style.hourlyTemperatureTextStyle,
                ),
                Text(
                  forecast.time.toMonthAndDay(),
                  style: Style.valueTextStyle,
                ),
              ],
            ),
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
                          image:
                              AssetImage('assets/images/sun_moon/sunrise.png'),
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
                          image:
                              AssetImage('assets/images/sun_moon/sunset.png'),
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                constraints: const BoxConstraints(minWidth: 50, maxWidth: 50),
                color: Colors.white54,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text(
                    '${forecast.temperatureHigh.toStringAsFixed(0)} °C',
                    style: Style.dateTextStyle,
                  ),
                ),
              ),
              Container(
                constraints: const BoxConstraints(minWidth: 50, maxWidth: 50),
                color: Colors.white24,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text(
                    '${forecast.temperatureLow.toStringAsFixed(0)} °C',
                    style: Style.dateTextStyle,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
          Container(
              padding: const EdgeInsets.only(right: 5),
              child: Image(image: AssetImage(aqiIcon), width: 25, height: 25)),
        ],
      ),
    );
  }
}
