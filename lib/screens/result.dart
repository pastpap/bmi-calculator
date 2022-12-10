import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/utils/calculator_argument.dart';
import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as CalculatorArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kActiveCardColor,
                onPress: () {},
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      args.result,
                      style: kResultTextStyle,
                    ),
                    Text(
                      args.bmi,
                      style: kBMITextStyle,
                    ),
                    Text(
                      args.interpretation,
                      textAlign: TextAlign.center,
                      style: kBMIBodyTextStyle,
                    )
                  ],
                ),
              )),
          BottomButton(
            onTap: () {
              Navigator.pop(context);
            },
            buttonTile: 'RE-CALCULATE',
          )
        ],
      ),
    );
  }
}
