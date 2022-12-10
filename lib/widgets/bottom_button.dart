import 'package:bmi_calculator/constants/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({
    required this.onTap,
    required this.buttonTile,
  });

  final VoidCallback onTap;
  final String buttonTile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            buttonTile,
            style: kButtonLabelStyle,
          ),
        ),
      ),
    );
  }
}
