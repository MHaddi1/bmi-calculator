import 'package:flutter/material.dart';
import '../../constants.dart';

class ButtonButton extends StatelessWidget {
  const ButtonButton({super.key, required this.label, required this.onPressed});

  final Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: kBotomHeightContainer,
        color: kBottomContainerColor,
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Center(
            child: Text(
          label,
          style: kLargeButtonTextStyle,
        )),
      ),
    );
  }
}
