import 'dart:math';
class CalculatorBrain {
  CalculatorBrain({this.height,this.weight});

  final int? height;
  final int? weight;
  double? _bmi;

  String? calculatorBMI(){
    _bmi=(weight! / pow(height! / 100,2));
    return _bmi?.toStringAsFixed(1);
  }

  String getresult(){
    if(_bmi! >= 25){
      return 'Overweight';
    }else if (_bmi!>= 18.5){
      return 'Normal';
    }else {
      return 'Underweight';
    }
  }
  String getinformation(){
    if(_bmi! >= 25){
      return 'You have a higher than normal body weight.Try to exercise more.';
    }else if (_bmi!>= 18.5){
      return 'You have a normal body weight Good Job!';
    }else {
      return 'You have a lower body weight please eat healthy food.';
    }
  }
}