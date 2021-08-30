import 'package:flutter/material.dart';

enum ContainerType {
  Gender,
  NoName,
  Height,
  weight,
  age,
}

enum Gender {
  male,
  female,
  unKnown,
}

enum ButtonType {
  plus,
  minus,
}

const kButtonContainerHeight = 80.0;
const kActiveCardColor = Color(0xFF1D1E33);
const kInActiveCardColor = Color(0xFF111328);
const kButtonContainerColor = Color(0xFFEB1555);
const kUpperContainerMargin = 15.0;
const kIconSize = 80.0;
const kSizeBoxHeight = 10.0;
const kAllFontSize = 18.0;
const kMinHeight = 100.0;
const kMaxHeight = 222.0;

const kLabelTextStyle = TextStyle(
  fontSize: kAllFontSize,
  color: Color(0xFF8D8E98),
);

const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

const kButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.w900,
);

const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);

const kGreenTextStyle = TextStyle(
  fontSize: 22.0,
  color: Color(0xFF24D876),
  letterSpacing: 2.5,
  fontWeight: FontWeight.bold,
);

const kBMITextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
);

const kBodyTextStyle = TextStyle(
  fontSize: 22.0,
);
