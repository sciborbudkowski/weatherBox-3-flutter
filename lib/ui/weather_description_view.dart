import 'package:flutter/material.dart';
import 'package:weatherbox/styles/styles.dart';

class WeatherDescriptionView extends StatelessWidget {
  const WeatherDescriptionView({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Text(description.toLowerCase(),
              style: Style.temperatureMinorTextStyle),
        ),
      ],
    );
  }
}
