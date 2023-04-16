import 'package:flutter/material.dart';

const double kBottomContainerHeight = 60.0;
const Color kActiveCardColor = Color(0xFF0096c7);
const Color kInactiveCardColor = Color(0xFF00b4d8);
const Color kBottomContainerColor = Color(0xFF0077b6);
const Color kLabelColor = Color(0xFFfefae0);

const kLabelStyle = TextStyle(
  fontSize: 18.0,
  color: kLabelColor,
);

const kValueStyle =
    TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900, color: kLabelColor);
const kButtonLabelStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);
const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);
const kResultTextStyle = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
  color: Color(0xff24d876),
);

const kHeadline1TextStyle = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
  color: kLabelColor,
);
const kBMITextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
);
const kBMIBodyTextStyle = TextStyle(
  fontSize: 22.0,
);

getResultTextStyle(Color color) {
  return TextStyle(
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
    color: color,
  );
}

getBMITextStyle(Color color) {
  return TextStyle(
    fontSize: 100.0,
    fontWeight: FontWeight.bold,
    color: color.withOpacity(0.80),
  );
}
