import 'dart:convert';
import 'dart:math';

import 'package:bmi_calculator/enums/enums.dart';
import 'package:bmi_calculator/utils/model/calculator_result.dart';
import 'package:flutter/services.dart';

class Calculator {
  Calculator(
      {required this.height,
      required this.weight,
      required this.gender,
      required this.age});

  final int height;
  final int weight;
  final Gender gender;
  final int age;

  double bmi = 0;

  CalculatorResult result = CalculatorResult(result: "", interpretation: "");

  List boysBmiLimits = [];
  List girlsBmiLimits = [];

  void calculateBMI() {
    bmi = weight / pow(height / 100, 2);
    loadBmiDataFromJson();
  }

  void _interpret() {
    if (this.age > 20) {
      result = _getAdultResult();
    } else if (this.gender == Gender.MALE) {
      result = _getBoysResult();
    } else {
      result = _getGirlsResult();
    }
  }

  CalculatorResult _getAdultResult() {
    if (bmi >= 25) {
      return CalculatorResult(
          result: ResultType.OVERWEIGHT.value,
          interpretation:
              'You have a higher than normal body weight. Try to exercise more.');
    } else if (bmi > 18.5) {
      return CalculatorResult(
          result: ResultType.NORMAL.value,
          interpretation: 'You have a normal body weight. Good job!');
    } else {
      return CalculatorResult(
          result: ResultType.UNDERWEIGHT.value,
          interpretation:
              'You have a lower than normal body weight. You can eat a bit more.');
    }
  }

  CalculatorResult _getBoysResult() {
    List<double> bmiKeyValues = _readBmiKeyValues(Gender.MALE, age);
    return CalculatorResult(result: '', interpretation: '');
  }

  CalculatorResult _getGirlsResult() {
    List<double> bmiKeyValues = _readBmiKeyValues(Gender.FEMALE, age);
    return CalculatorResult(result: '', interpretation: '');
  }

  List<double> _readBmiKeyValues(Gender gender, int age) {
    if (gender == Gender.FEMALE) {
      return girlsBmiLimits.firstWhere((el) => el.age == age).limits;
    } else {
      return boysBmiLimits.firstWhere((el) => el.age == age).limits;
    }
  }

  void loadBmiDataFromJson() async {
    final String response =
        await rootBundle.loadString('assets/json/bmi_children.json');
    final data = json.decode(response.toString());
    boysBmiLimits = data["boys"];
    girlsBmiLimits = data["girls"];
    _interpret();
  }
}
