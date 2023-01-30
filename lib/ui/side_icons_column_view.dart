import 'package:flutter/material.dart';
import 'package:weatherbox/ui/widgets.dart';

class SideIconsColumnView extends StatelessWidget {
  const SideIconsColumnView(
      {super.key,
      required this.windSpeed,
      required this.airPollution,
      required this.currentWeather,
      required this.uvIndex,
      required this.moonPhase});

  final String windSpeed;
  final String airPollution;
  final String currentWeather;
  final String uvIndex;
  final String moonPhase;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            IconTextView(imageName: windSpeed, text: 'skala beauforta'),
            const SizedBox(height: 10),
            IconTextView(imageName: airPollution, text: 'jakość powietrza'),
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
    );
  }
}
