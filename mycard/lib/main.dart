import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(mycard(),);
}
class mycard extends StatelessWidget {
  const mycard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigoAccent.shade100,
        appBar: AppBar(
          title: Text("My Profile App",),
          centerTitle:true,
          backgroundColor: Colors.indigo,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/bb.png'),
                radius: 70.0,
                backgroundColor: Colors.white,
              ),
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
                width: 400.0,
                child: Divider(
                  color: Colors.white,
                  thickness: 4.0,
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
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.cake,
                    color: Colors.indigo,
                    size: 30.0,
                  ),
                  title: Text('25-12-2001',style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
