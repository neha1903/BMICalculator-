import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButtonWidget extends StatelessWidget {
  final String label;
  final Function onPress;
  CustomButtonWidget({required this.label, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        padding: EdgeInsets.only(
          bottom: 20.0,
        ),
        height: kButtonContainerHeight,
        width: double.infinity,
        margin: EdgeInsets.only(top: kUpperContainerMargin),
        color: kButtonContainerColor,
        child: Center(
          child: Text(
            label,
            style: kButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
