import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color cardColor;
  final Widget cardChild;
  ReusableCard({required this.cardColor, required this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: cardChild,
    );
  }
}
