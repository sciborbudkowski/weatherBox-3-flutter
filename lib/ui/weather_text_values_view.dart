import 'package:flutter/material.dart';
import 'package:weatherbox/ui/text_value_view.dart';

class WeatherTextValues extends StatelessWidget {
  const WeatherTextValues(
      {super.key,
      required this.windSpeedValue,
      required this.temperatureValue,
      required this.humidityValue,
      required this.pressureValue,
      required this.feelsLikeValue,
      required this.uvValue});

  final String windSpeedValue;
  final String temperatureValue;
  final String humidityValue;
  final String pressureValue;
  final String feelsLikeValue;
  final String uvValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                TextValueView(
                    description: 'wiatr', value: '$windSpeedValue km/h'),
              ],
            ),
            Container(
              constraints: const BoxConstraints(minWidth: 90, maxWidth: 90),
              child: Column(
                children: [
                  TextValueView(
                      description: 'temperatura',
                      value: '$temperatureValue °C'),
                ],
              ),
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                TextValueView(
                    description: 'ciśnienie', value: '$pressureValue hPa'),
              ],
            ),
            Container(
              constraints: const BoxConstraints(minWidth: 90, maxWidth: 90),
              child: Column(
                children: [
                  TextValueView(
                      description: 'odczuwalna', value: '$feelsLikeValue °C'),
                ],
              ),
            ),
            Column(
              children: [
                TextValueView(description: 'index UV', value: uvValue),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
