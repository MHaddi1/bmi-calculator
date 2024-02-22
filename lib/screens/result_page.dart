import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

import 'widgets/button_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.bmiResult,
      required this.interpretation,
      required this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                "Your Result",
                style: kNumberTextStyle,
              ),
            ),
          ),
          ReusableContainer(
            flex: 5,
            color: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  resultText.toUpperCase(),
                  style: kResultTextStyle,
                ),
                Text(
                  bmiResult,
                  style: kBMITextStyle,
                ),
                Text(
                  interpretation,
                  textAlign: TextAlign.center,
                  style: kBodyTextStyle,
                )
              ],
            ),
          ),
          ButtonButton(
              label: "RECALCULATION",
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
