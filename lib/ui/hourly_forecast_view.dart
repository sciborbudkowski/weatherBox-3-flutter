import 'package:flutter/material.dart';

import 'package:weatherbox/pirate/weather_models.dart';
import 'package:weatherbox/styles/styles.dart';

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
