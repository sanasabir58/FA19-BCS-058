import 'package:chatapp/Authication/Loginpage.dart';
import 'package:chatapp/Authication/method.dart';
import 'package:chatapp/Authication/welcomepage.dart';
import 'package:flutter/material.dart';
class createaccount extends StatefulWidget {
  const createaccount({Key? key}) : super(key: key);

  @override
  _createaccountState createState() => _createaccountState();
}

class _createaccountState extends State<createaccount> {
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  bool isloading=false;
  final _form=GlobalKey<FormState>();
  bool emailValid(String e){
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(e);
    return emailValid;
  }
  bool passvisibilty=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: isloading? Center(child: CircularProgressIndicator(),):Form(
            key: _form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text('Wellcome',style: TextStyle(
                    fontSize: 34,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                Center(
                  child: Text('Sign up to Continue!',style: TextStyle(
                    color: Colors.blue.shade200,
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),),
                ),
                SizedBox(
                  height:20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: TextFormField(
                    controller: email,
                    validator: (value){
                      if(value!.isEmpty|| !emailValid(value)){
                        return 'Enter Valid Email Address';
                      };
                      return null;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: 'E-mail',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                    ),
                  ),
                ),
                SizedBox(
                  height:10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: TextFormField(
                    controller: name,
                    validator: (value){
                      if (value!.isEmpty||value.length<4){
                        return 'Enter correct UserName';
                      }
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle),
                        hintText: 'UserName',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                  ),
                ),
                SizedBox(
                  height:10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: TextFormField(
                    controller: password,
                    validator: (value){
                      if (value!.isEmpty||value.length<7){
                        return 'Enter 7 digit Password';
                      }
                    },
                    obscureText: passvisibilty,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              passvisibilty=!passvisibilty;
                            });
                          },
                          icon: Icon(passvisibilty?Icons.visibility:Icons.visibility_off),
                        ),
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
                  child: ElevatedButton(onPressed: (){
                    if(!_form.currentState!.validate()){
                      return;
                    }
                    if(_form.currentState!.validate()){
                      setState(() {
                        isloading=true;
                      });
                      create(name.text, email.text.trim(), password.text).then((user){
                        if(user!=null){
                          setState(() {
                            isloading=false;
                          });
                          print('login sucessfully');
                          Navigator.push(context, MaterialPageRoute(builder:(context)=>Loginpage()));
                        }
                        else{
                          print('login falied');
                          setState(() {
                            isloading=false;
                          });
                        }
                      });
                    }
                    else {
                      print('please enter field');
                    };
                  }, child:
                  Text('SignUp',style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>Loginpage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an Account? "),
                        Text('Sign In',style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),),],
                    ),

                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 80),
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/background.png'),
                            fit: BoxFit.fitHeight
                        )
                    ),
                  ),
                ),

              ],
            ),
          ),

        )
    );
  }
}

