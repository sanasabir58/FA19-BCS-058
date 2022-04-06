import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizapp/quiz2.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
QuizBrain quizBrain = QuizBrain();
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: splashscreen(),
));

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
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
          count=10;
          quizBrain.nextQuestion();
          wrong=wrong+1;
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ),);
        }
      });
    });
  }
  List<Icon> scoreKeeper = [];
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        correct=correct+1;
        Alert(
          context: context,
          type: AlertType.success,
          title: "Finshed",
          desc: "Quiz is end.\n correct:$correct          Wrong:$wrong",
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
        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          correct=correct+1;
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
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
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        quizBrain.getQuestionText(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextButton(
                      child: Text('True',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0
                      ),
                      ),
                      style: TextButton.styleFrom(primary: Colors.blueGrey,
                          side: BorderSide(color: Colors.blueGrey, width: 7),
                          backgroundColor: Colors.white ),
                      onPressed: () {
                        checkAnswer(true);
                        count=10;
                      },
                    )
                ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child:TextButton(
                      child: Text('false', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0
                      ),),
                      style: TextButton.styleFrom(primary: Colors.blueGrey,
                          side: BorderSide(color: Colors.blueGrey, width: 7),
                      backgroundColor: Colors.white),
                      onPressed: () {
                        checkAnswer(false);
                        count=10;
                        //The user picked false.
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
class homescreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(children: [
          UserAccountsDrawerHeader(accountName: Text('Sana Sabir'),
             accountEmail: Text('sanasabir@gmail.com'),
            currentAccountPicture: CircleAvatar(backgroundImage: AssetImage('assets/bb.png')),
          ),

        ListTile(title: Text('Setting'),leading: Icon(Icons.settings),onTap: (){

        }
        ),
        ListTile(
            title: Text('Home'),leading: Icon(Icons.home),onTap: (){
          Navigator.pop(context);
        }
        ),
          ListTile(
              title: Text('About'),leading: Icon(Icons.account_box_outlined),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>about()));
              }
          ),
          ListTile(
              title: Text('Contact us'),leading: Icon(Icons.contact_page_outlined),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>contact()));
              }
          ),
          ListTile(
              title: Text('Update'),leading: Icon(Icons.system_update),
              onTap: (){
              }
          ),
          ListTile(
              title: Text('quiz for true/false'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizPage()));
              }
          ),
          ListTile(
              title: Text('quiz for multiple choice'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizPage2()));
              }
          ),

        ]
        ),
      ),
      appBar: AppBar(
        title: Text('Quizapp'),
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.black26,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(padding: EdgeInsets.all(20.0),
              child: Text('Welcome for Quiz\nClick on Drawer and select the Type of Quiz.',style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,
              fontSize: 40.0)),),
          ),
        ],
      ),
    );
  }
}
class splashscreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenView(
        navigateRoute: homescreen(),
        backgroundColor: Colors.indigo,
        duration: 5000,
        imageSize: 130,
        imageSrc: "assets/logo.png",
        text: "Sana Sabir FA19-BCS-058",
        textType: TextType.ColorizeAnimationText,
        textStyle: TextStyle(
          fontSize: 40.0,
        ),
        colors: [
          Colors.red,
          Colors.green,
          Colors.orange,
          Colors.purple,
        ],
      ),
    );
  }
}
class about extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(title: Text('About',),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/bb.png'),
            radius: 70.0,
            backgroundColor: Colors.white,),
          Text ('Sana Sabir',
            style: TextStyle(color:Colors.white,
              fontFamily: 'Lobster',
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          Text('Flutter Developer',
            style: TextStyle(color: Colors.white,letterSpacing: 4.0,),),
          SizedBox(
            height: 20.0,
            width: 300.0,
            child: Divider(
              color: Colors.white,
              thickness: 2.0,
            ),
          ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.indigo,
                    size: 30.0,
                  ),
                  title: Text('sanasabir6666@gmail.com',style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
        ]
        ),
      )
    );
  }
}
class contact extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
        appBar: AppBar(title: Text('Contact us',),
          backgroundColor: Colors.blueGrey,
        ),
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text ('Sana Sabir',
                  style: TextStyle(color:Colors.white,
                    fontFamily: 'Lobster',
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 300.0,
                  child: Divider(
                    color: Colors.white,
                    thickness: 2.0,
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.indigo,
                      size: 30.0,
                    ),
                    title: Text('+92304656734',style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
              ]
          ),
        )
    );
  }
}









