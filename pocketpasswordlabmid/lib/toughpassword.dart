import 'package:flutter/material.dart';
class toughpassword extends StatefulWidget {
  const toughpassword({Key? key}) : super(key: key);

  @override
  _toughpasswordState createState() => _toughpasswordState();
}

class _toughpasswordState extends State<toughpassword> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text("Tough Password"),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Flexible(
              flex: 0,
              child: Center(
                child: Form(
                  child:Flex(direction: Axis.vertical,
                    children: [
                      ListTile(leading: Icon(Icons.edit_location_outlined),
                        title: TextFormField(
                          validator: (val)=>val==""?val:null,
                        ),
                      ),
                      Text('Enter Lenght of password'),
                      ListTile(leading: Icon(Icons.edit_location_outlined),
                        title: TextFormField(
                          validator: (val)=>val==""?val:null,
                        ),
                      ),
                      Text('Enter how many character in password'),
                      ListTile(leading: Icon(Icons.edit_location_outlined),
                        title: TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (val)=>val==""?val:null,
                        ),
                      ),
                      Text('Enter how many digits in password'),
                      ListTile(leading: Icon(Icons.edit_location_outlined),
                        title: TextFormField(
                          validator: (val)=>val==""?val:null,
                        ),
                      ),
                      Text('Enter how many symbols in password'),
                      ListTile(leading: Icon(Icons.password),
                        title: TextFormField(
                          validator: (val)=>val==""?val:null,
                        ),
                      ),
                      Text('Hint: 1234sana'),
                      SizedBox(height: 10.0,),
                      ElevatedButton(onPressed: (){}, child: Text("generate Password"),),
                      ElevatedButton(onPressed: (){}, child: Text("save"),),
                    ]),

                ),),
            ),
          ],
        ),
      );

  }
}
