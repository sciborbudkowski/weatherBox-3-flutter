import 'package:flutter/material.dart';
import 'package:weatherbox/styles/styles.dart';

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
