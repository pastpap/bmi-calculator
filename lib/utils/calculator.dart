import 'dart:math';

import 'package:bmi_calculator/enums/enums.dart';
import 'package:bmi_calculator/utils/model/calculator_result.dart';
import 'package:bmi_calculator/utils/model/child_bmi.dart';

import 'initialDataLoader.dart';

class Calculator {
  Calculator(
      {required this.height,
      required this.weight,
      required this.gender,
      required this.age,
      required this.loader}) {
    this.boysBmiLimits = loader.boysBmiLimits;
    this.girlsBmiLimits = loader.girlsBmiLimits;
    bmi = weight / pow(height / 100, 2);
  }

  final int height;
  final int weight;
  final Gender gender;
  final int age;
  final InitialDataLoader loader;

  double bmi = 0;

  CalculatorResult result = CalculatorResult(result: "", interpretation: "");

  List<ChildBmi> boysBmiLimits = [];
  List<ChildBmi> girlsBmiLimits = [];

  Future<void> interpretBMI() async {
    _interpret();
  }

  void _interpret() {
    if (this.age > 20) {
      result = _getAdultResult();
    } else if (this.gender == Gender.MALE) {
      result = _getChildResult(Gender.MALE, this.age);
    } else {
      result = _getChildResult(Gender.FEMALE, this.age);
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

  CalculatorResult _getChildResult(Gender gender, int age) {
    List<double> bmiKeyValues = _readBmiKeyValues(gender, age);
    return _selectResult(bmiKeyValues);
  }

  CalculatorResult _selectResult(List<double> bmiKeyValues) {
    if (bmi <= bmiKeyValues.elementAt(0)) {
      return CalculatorResult(
          result: ResultType.UNDERWEIGHT.value,
          interpretation:
              'You have a lower than normal body weight. You can eat a bit more.');
    } else if (bmiKeyValues.elementAt(0) < bmi &&
        bmi <= bmiKeyValues.elementAt(1)) {
      return CalculatorResult(
          result: ResultType.NORMAL.value,
          interpretation: 'You have a normal body weight. Good job!');
    } else if (bmiKeyValues.elementAt(1) < bmi &&
        bmi <= bmiKeyValues.elementAt(2)) {
      return CalculatorResult(
          result: ResultType.AT_RISK.value,
          interpretation:
              'You are at risk of having a higher than normal body weight. Try to exercise more.');
    } else {
      return CalculatorResult(
          result: ResultType.OVERWEIGHT.value,
          interpretation:
              'You have a higher than normal body weight. Try to exercise more.');
    }
  }

  List<double> _readBmiKeyValues(Gender gender, int age) {
    if (gender == Gender.FEMALE) {
      return girlsBmiLimits.firstWhere((el) => el.age == age).limits;
    } else {
      return boysBmiLimits.firstWhere((el) => el.age == age).limits;
    }
  }
}
