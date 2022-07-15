import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class resetpassword extends StatefulWidget {
  const resetpassword({Key? key}) : super(key: key);


  @override
  _resetpasswordState createState() => _resetpasswordState();
}

class _resetpasswordState extends State<resetpassword> {
  TextEditingController _email= TextEditingController();
  final _form = GlobalKey<FormState>();
  bool emailValidation(String e){
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(e);
    return emailValid;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Reset Password'),),
      body: Container(
        height: 700.0,
        width: 700.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/f1.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key:_form,
            child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    controller: _email,
                    validator: (value){
                      if(!emailValidation(value!)||value.isEmpty){
                        return "Enter valid email";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "Enter Email",
                        hintStyle: TextStyle(color: Colors.indigo),
                        ),
                  ),
                ),
                SizedBox(
                  height: 20.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton.icon(

                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if(!_form.currentState!.validate()){
                        return;
                      }
                      if(_form.currentState!.validate()){
                        verifyemail();
                      }
                    },
                    icon: Icon(Icons.mail_outline),
                    label: Text(
                      "Reset",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(

                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
  Future verifyemail()async{
    try{
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context)=>Center(child: CircularProgressIndicator(),));
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _email.text.trim(),);
      final snackBar = SnackBar(
        content: Text('Password reset email send'),);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
    }on FirebaseAuthException catch(e){
      Navigator.pop(context);
      final snackBar = SnackBar(
        content: Text(e.message.toString()),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

  }

}
