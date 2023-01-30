import 'package:flutter/material.dart';
import 'package:weatherbox/styles/styles.dart';

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
