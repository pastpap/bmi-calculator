import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/enums/enums.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/screens/result.dart';
import 'package:bmi_calculator/utils/utils.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: createMaterialColor(Color(0xFF0077b6)),
          ).copyWith(
            secondary: createMaterialColor(Color(0xFFfec89a)),
          ),
          scaffoldBackgroundColor: Color(0xFF48cae4),
          textTheme: TextTheme(headline1: kHeadline1TextStyle)),
      initialRoute: Routes.INPUT.value,
      routes: {
        Routes.INPUT.value: (context) => InputPage(),
        Routes.RESULT.value: (context) => Result(),
      },
    );
  }
}
