import 'dart:math';

class CalCulatorBrain {
  CalCulatorBrain({this.height, this.weight});

  final int? weight;
  final int? height;
  late double _bmi;

  String? calculateBMI() {
    _bmi = weight! / pow(height! / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String? getResult() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String? getInterpretations() {
    if (_bmi >= 25) {
      return "You have Heigher then Normal body weight. try to exercise more.";
    } else if (_bmi > 18.5) {
      return "You have a normal body weight. Good Job.";
    } else {
      return "You have a lower then normal body weight. you have eat a bit more";
    }
  }
}
