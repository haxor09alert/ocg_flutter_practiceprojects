import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator1/constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key, required this.onTap, required this.buttonTitle});

  final Function() onTap;
  final String buttonTitle;
  final double value = 10;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: onTap,
    child: Container(
      color: kBottomContainerColour,
      margin:  EdgeInsets.only(top: value),
      padding:  EdgeInsets.only(bottom: value * 2),
      width: double.infinity,
      height: kBottomContainerHeight,
      child: Center(
        child: Text(
          buttonTitle,
          style: kLargeButtonTextStyle,
        ),
      ),
    ),
  );
}

}
