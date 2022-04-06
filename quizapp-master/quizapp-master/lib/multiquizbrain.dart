import 'package:quizapp/multiplechoice.dart';
class mulquizbrain{
  int _questionNumber = 0;
  List<multiplechose> _questionbank =[
    multiplechose('First AI programming language is…', 'FORTRAN', 'IPL', 'LISP', 'BASIC',' IPL'),
    multiplechose('The mechanics of human intelligence investigates in…', 'sociology', 'psychology', 'cognitive science', 'history','cognitive science'),
    multiplechose(' Which of the following is caused of Ambiguity…', 'multiple word meanings', 'unclear antecedent', 'syntactic ambiguity', 'all of these','all of these'),
    multiplechose('Which of the following process is repeated, evaluated, and refined?', 'interpretive', 'iterative', 'diagnostic', 'descriptive','iterative'),
    multiplechose('A series of AI systems developed by?', ' DURHAM', 'BACON', 'MIT', 'RAMD',' BACON'),
    multiplechose('Which of the following is the primary interactive method of communication?', 'speaking', 'reading', 'writing', 'all of these','reading'),
    multiplechose(' Which of the following is product of KEE?', 'IntelliCorpn', 'Teknowledge', 'txas Instruments', 'intelliCorpnc','IntelliCorpn'),
    multiplechose('Which generation of computers is associated with artificial intelligence?', '2nd', 'sixth', '4th', ' fifth','fifth'),
    multiplechose('The goals of AI systems are…', 'Answering questions', 'Manipulating robotic devices', 'Recognizing objects', ' All of the above','All of the above'),
  ];
  void nextQuestion() {
    if (_questionNumber < _questionbank.length - 1) {
      _questionNumber++;
    }
  }
  String getQuestionText() {
    return _questionbank[_questionNumber].questionText;
  }
  String getcorrectanswer(){
    return _questionbank[_questionNumber].questionanswer;
  }
  String getoption1(){
    return _questionbank[_questionNumber].option1;
  }
  String getoption2(){
    return _questionbank[_questionNumber].option2;
  }
  String getoption3(){
    return _questionbank[_questionNumber].option3;
  }
  String getoption4(){
    return _questionbank[_questionNumber].option4;
  }
  bool isFinished() {
    if (_questionNumber >= _questionbank.length - 1) {
      return true;
    } else {
      return false;
    }
  }
  void reset() {
    _questionNumber = 0;
  }
}