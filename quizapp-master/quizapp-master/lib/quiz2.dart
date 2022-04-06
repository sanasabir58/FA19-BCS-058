import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizapp/main.dart';
import 'package:quizapp/multiquizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
mulquizbrain quizBrain = mulquizbrain();
class QuizPage2 extends StatefulWidget {
  @override
  _QuizPage2State createState() => _QuizPage2State();
}
class _QuizPage2State extends State<QuizPage2> {
  var correct=0;
  var wrong=0;
  int count=10;
  Timer timer;
  void start(){
    count=10;
    timer=Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(count>0)
        {
          count--;
        }
        else{
          wrong=wrong+1;
          count=10;
          quizBrain.nextQuestion();
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ),);
        }
      });
    });
  }
  List<Icon> scoreKeeper = [];
void checkanswer(String userpickanswer){
  String correctanswer = quizBrain.getcorrectanswer();
  setState(() {
    if(quizBrain.isFinished()==true){
      correct=correct+1;
      Alert(
        context: context,
        type: AlertType.success,
        title: "Finshed",
        desc: "multiplechoice Quiz is end.\ncorrect:$correct        wrong:$wrong",
        buttons: [
          DialogButton(
            child: Text(
              "Ok",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      quizBrain.reset();
      scoreKeeper=[];
    }
    else{
      if(userpickanswer==correctanswer){
        correct=correct+1;
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      }
      else {
        wrong=wrong+1;
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      quizBrain.nextQuestion();
    }
  });
}

  @override
  void initState(){
    super.initState();
    start();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz App'),
          actions: <Widget>[
            TextButton(
              child: Text('leave',style: TextStyle(color: Colors.white)),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => homescreen(),),
                );
              },
            ),
          ],
          backgroundColor: Colors.blueGrey),
      backgroundColor: Colors.black26,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(child: Center(
                child: Text("$count",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.white),),
              ),),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      quizBrain.getQuestionText(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: TextButton(
                      child: Text(quizBrain.getoption1(),
                        style: TextStyle(
                            fontSize: 20.0,
                        ),),
                      style: TextButton.styleFrom(primary: Colors.blueGrey,
                          side: BorderSide(color: Colors.blueGrey, width: 7),
                      backgroundColor: Colors.white),
                      onPressed: () {
                        checkanswer(quizBrain.getoption1());
                        count=10;
                      },
                    )
                ),
              ),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: TextButton(
                      child: Text(quizBrain.getoption2(), style: TextStyle(
                          fontSize: 20.0
                      ),),
                      style: TextButton.styleFrom(primary: Colors.blueGrey,
                          side: BorderSide(color: Colors.blueGrey, width: 7),
                      backgroundColor: Colors.white),
                      onPressed: () {
                        checkanswer(quizBrain.getoption2());
                        count=10;
                      },
                    )
                ),
              ),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: TextButton(
                      child: Text(quizBrain.getoption3(), style: TextStyle(
                          fontSize: 20.0
                      ),),
                      style: TextButton.styleFrom(primary: Colors.blueGrey,
                          side: BorderSide(color: Colors.blueGrey, width: 7),
                      backgroundColor: Colors.white),
                      onPressed: () {
                        checkanswer(quizBrain.getoption3());
                        count=10;
                      },
                    )
                ),
              ),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: TextButton(
                      child: Text(quizBrain.getoption4(), style: TextStyle(
                          fontSize: 20.0
                      ),),
                      style: TextButton.styleFrom(primary: Colors.blueGrey,
                          side: BorderSide(color: Colors.blueGrey, width: 7),
                          backgroundColor: Colors.white),
                      onPressed: () {
                        checkanswer(quizBrain.getoption4());
                        count=10;
                      },
                    )
                ),
              ),
              Row(
                children: scoreKeeper,
              ),
            ],
          ),
        ),
      ),
    );
  }
}