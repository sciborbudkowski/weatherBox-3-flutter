import 'dart:ui';

import 'package:flutter/material.dart';

class Style {
  static const locationTextStyle = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static const temperatureMajorTextStyle = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 60.0,
    color: Colors.white,
  );

  static const temperatureMinorTextStyle = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 20.0,
    fontFeatures: [FontFeature.superscripts()],
    color: Colors.white,
  );

  static const dateTextStyle = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 12.0,
    color: Colors.white70,
  );

  static const iconTextStyle = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 12.0,
    color: Colors.white60,
  );

  static const valueTextStyle = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 22.0,
    color: Colors.white,
  );

  static const hourlyHourTextStyle = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 12.0,
    color: Colors.white,
  );

  static const hourlyTemperatureTextStyle = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 12.0,
    color: Colors.white,
    fontWeight: FontWeight.w800,
  );
}
