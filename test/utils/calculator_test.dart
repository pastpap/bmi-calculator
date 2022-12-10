import 'package:bmi_calculator/enums/enums.dart';
import 'package:bmi_calculator/utils/calculator.dart';
import 'package:test/test.dart';

void main() {
  test(
      'Given a boy of 2 years when interpreting a BMI of less than 14.7 the result should say Underweight',
      () {
    final calculator =
        Calculator(height: 46, weight: 3, gender: Gender.MALE, age: 2);
    calculator.calculateBMI();
    expect(calculator.getResult(), ResultType.UNDERWEIGHT.value);
  });
}
