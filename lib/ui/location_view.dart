import 'package:flutter/material.dart';
import 'package:weatherbox/styles/styles.dart';

class LocationView extends StatelessWidget {
  const LocationView(
      {super.key,
      required this.currentDate,
      required this.city,
      required this.region});

  final String currentDate;
  final String city;
  final String region;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      ],
    );
  }
}
