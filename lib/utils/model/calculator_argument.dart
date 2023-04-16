import 'package:flutter/material.dart';

class CalculatorArguments {
  final String bmi;
  final String result;
  final String interpretation;
  final Color color;

  CalculatorArguments(
      {required this.bmi,
      required this.result,
      required this.interpretation,
      required this.color});
}
