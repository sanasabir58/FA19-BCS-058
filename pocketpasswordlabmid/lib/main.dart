import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocketpasswordlabmid/passview.dart';
import 'package:pocketpasswordlabmid/simplepassword.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pocketpasswordlabmid/toughpassword.dart';
import 'package:splash_screen_view/SplashScreenView.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:splash(),
  ));
}
class pocketpassword extends StatefulWidget {
  const pocketpassword({Key? key}) : super(key: key);

  @override
  _pocketpasswordState createState() => _pocketpasswordState();
}

class _pocketpasswordState extends State<pocketpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
        appBar: AppBar(
          actions: [
            CircleAvatar(
              backgroundImage: AssetImage('images/s2.jpg'),
              radius: 20.0,
              backgroundColor: Colors.blueGrey.shade100,),
          ],
          title: Text("Pocket Password Dairy"),
          backgroundColor: Colors.purple,
          elevation: 20.0,
          shadowColor: Colors.purpleAccent,
          centerTitle: true,
        ),
        body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/s2.jpg'),
                    backgroundColor: Colors.white,
                    radius: 70.0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>simplepassword()));
                  },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      elevation: 10.0, // Elevation
                      shadowColor: Colors.purpleAccent,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text('Simple Password'),),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>toughpassword()));
                  },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      elevation: 10.0, // Elevation
                      shadowColor: Colors.purpleAccent,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text('Tough Password'),),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>passview()));
                  },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      elevation: 10.0, // Elevation
                      shadowColor: Colors.purpleAccent,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text('view All Password'),),
                ],
        ),
            )),
      );

  }
}
class splash extends StatelessWidget {
  const splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      body: SplashScreenView(
        navigateRoute: pocketpassword(),
        duration: 3000,
        imageSize: 130,
        imageSrc: "images/s2.jpg",
        text: "WellCome to PocketPassword Dairy",
        textType: TextType.ScaleAnimatedText,
        textStyle: TextStyle(
          fontSize: 30.0,
        ),
      ),
    );
  }
}



