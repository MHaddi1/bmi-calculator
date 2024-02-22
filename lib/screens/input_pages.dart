import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'widgets/button_button.dart';
import 'widgets/icon_content.dart';
import 'widgets/reusable_card.dart';
import 'widgets/round_action_button.dart';

enum Gender { male, female }

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI CALCULATOR",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                ReusableContainer(
                  color: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInActiveCardColor,
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  cardChild: const IconContent(
                    faIcon: FontAwesomeIcons.mars,
                    text: "MALE",
                  ),
                ),
                ReusableContainer(
                  color: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInActiveCardColor,
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  cardChild: const IconContent(
                    faIcon: FontAwesomeIcons.venus,
                    text: "FEMALE",
                  ),
                )
              ],
            ),
          ),
          ReusableContainer(
            color: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Height",
                  style: kTextLabelStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    const Text(
                      "CM",
                      style: kTextLabelStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      )),
                  child: Slider(
                    value: height.toDouble(),
                    min: 100,
                    max: 250,
                    onChanged: (newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReusableContainer(
                  color: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: kTextLabelStyle,
                      ),
                      Text(weight.toString(), style: kNumberTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundActionButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundActionButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                ReusableContainer(
                  color: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Age",
                        style: kTextLabelStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundActionButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundActionButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          ButtonButton(
            onPressed: () {
              CalCulatorBrain cal =
                  CalCulatorBrain(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResult: cal.calculateBMI()!,
                            resultText: cal.getResult()!,
                            interpretation: cal.getInterpretations()!,
                          )));
            },
            label: "CALCULATOR",
          )
        ],
      ),
    );
  }
}
