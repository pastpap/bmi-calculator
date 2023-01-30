import 'package:bmi_calculator/enums/enums.dart';
import 'package:bmi_calculator/utils/calculator.dart';
import 'package:bmi_calculator/utils/initialDataLoader.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  InitialDataLoader loader = InitialDataLoader();
  test(
      'Given a boy of 2 years when interpreting a BMI of less than 14.7 the result should say Underweight',
      () {
    final calculator = Calculator(
        height: 46, weight: 3, gender: Gender.MALE, age: 2, loader: loader);
    calculator.interpretBMI();
    expect(calculator.result.result, ResultType.UNDERWEIGHT.value);
  });

  test(
      'Given a boy of 2 years when interpreting a BMI between 14.7 and 18.1 the result should say Normal',
      () {
    final calculator = Calculator(
        height: 43, weight: 3, gender: Gender.MALE, age: 2, loader: loader);
    calculator.interpretBMI();
    expect(calculator.result.result, ResultType.NORMAL.value);
  });

  test(
      'Given a boy of 2 years when interpreting a BMI between 18.1 and 19.3 the result should say At Risk',
      () {
    final calculator = Calculator(
        height: 40, weight: 3, gender: Gender.MALE, age: 2, loader: loader);
    calculator.interpretBMI();
    expect(calculator.result.result, ResultType.AT_RISK.value);
  });

  test(
      'Given a boy of 2 years when interpreting a BMI greater than 19.3 the result should say Overweight',
      () {
    final calculator = Calculator(
        height: 35, weight: 3, gender: Gender.MALE, age: 2, loader: loader);
    calculator.interpretBMI();
    expect(calculator.result.result, ResultType.OVERWEIGHT.value);
  });
}
