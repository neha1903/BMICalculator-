import 'package:flutter/material.dart';

const iconSize = 80.0;
const sizeBoxHeight = 10.0;
const allFontSize = 18.0;

class IconContent extends StatelessWidget {
  final String label;
  final IconData iconData;

  IconContent({required this.label, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: iconSize,
        ),
        SizedBox(
          height: sizeBoxHeight,
        ),
        Text(
          label,
          style: TextStyle(fontSize: allFontSize),
        )
      ],
    );
  }
}
