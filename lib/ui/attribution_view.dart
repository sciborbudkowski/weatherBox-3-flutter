import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:weatherbox/extensions/extensions.dart';
import 'package:weatherbox/styles/styles.dart';

class AttributionView extends StatelessWidget {
  const AttributionView({super.key, required this.name, required this.url});
  final String name;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text.rich(
          TextSpan(
            style: Style.attributionTextTextStyle,
            text: 'Photo by ',
          ),
        ),
        Text.rich(TextSpan(
          style: Style.attributionUrlTextStyle,
          text: name,
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              UrlParser.loadUrl(url);
            },
        )),
        const Text.rich(
          TextSpan(
            style: Style.attributionTextTextStyle,
            text: ' / ',
          ),
        ),
        Text.rich(TextSpan(
            style: Style.attributionUrlTextStyle,
            text: 'Unsplash',
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                UrlParser.loadUrl('https://unsplash.com');
              })),
      ],
    );
  }
}
