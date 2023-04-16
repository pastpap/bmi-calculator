import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/enums/enums.dart';
import 'package:bmi_calculator/utils/calculator.dart';
import 'package:bmi_calculator/utils/initialDataLoader.dart';
import 'package:bmi_calculator/utils/model/calculator_argument.dart';
import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:bmi_calculator/widgets/icon_content.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:bmi_calculator/widgets/tap_or_hold_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.MALE;
  int height = 180;
  int weight = 80;
  int age = 25;
  InitialDataLoader loader = InitialDataLoader();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI WIZARD'),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.MALE;
                      });
                    },
                    colour: selectedGender == Gender.MALE
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.FEMALE;
                      });
                    },
                    colour: selectedGender == Gender.FEMALE
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT/kg',
                          style: kLabelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: kValueStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TapOrHoldButton(
                              onUpdate: () {
                                setState(() {
                                  int candidateWeight = weight - 1;
                                  weight = candidateWeight > 10
                                      ? candidateWeight
                                      : 10;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            TapOrHoldButton(
                              onUpdate: () {
                                setState(() {
                                  int candidateWeight = weight + 1;
                                  weight = candidateWeight < 300
                                      ? candidateWeight
                                      : 300;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        )
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE/yrs',
                          style: kLabelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              age.toString(),
                              style: kValueStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TapOrHoldButton(
                              icon: FontAwesomeIcons.minus,
                              onUpdate: () {
                                setState(() {
                                  int candidateAge = age - 1;
                                  age = candidateAge > 1 ? candidateAge : 2;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            TapOrHoldButton(
                              icon: FontAwesomeIcons.plus,
                              onUpdate: () {
                                setState(() {
                                  int candidateAge = age + 1;
                                  age = candidateAge < 120 ? candidateAge : 120;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: kActiveCardColor,
                    onPress: () {},
                  ),
                ),
              ],
            )),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kLabelStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kValueStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF0077b6),
                          thumbColor: Color(0xFFf4a261),
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 25)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 50.0,
                        max: 220.0,
                        onChanged: ((double value) {
                          setState(() {
                            height = value.round();
                          });
                        }),
                      ),
                    )
                  ],
                ),
                onPress: () {},
              ),
            ),
            BottomButton(
              onTap: () {
                Calculator calc = Calculator(
                  height: height,
                  weight: weight,
                  gender: selectedGender,
                  age: age,
                  loader: loader,
                );
                calc.interpretBMI();
                Navigator.pushNamed(context, Routes.RESULT.value,
                    arguments: CalculatorArguments(
                        bmi: calc.bmi.toStringAsFixed(1),
                        result: calc.result.result,
                        interpretation: calc.result.interpretation,
                        color: calc.result.color));
              },
              buttonTile: 'CALCULATE',
            )
          ],
        ));
  }
}
