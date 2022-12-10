import 'package:bmi_calculator/enums/enums.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/screens/result.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/utils.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: createMaterialColor(Color(0xFF0A0E21)),
        ).copyWith(
          secondary: Colors.purple,
        ),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      initialRoute: Routes.INPUT.value,
      routes: {
        Routes.INPUT.value: (context) => InputPage(),
        Routes.RESULT.value: (context) => Result(),
      },
    );
  }
}
