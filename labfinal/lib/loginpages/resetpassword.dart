import 'package:firebase_auth/firebase_auth.dart';
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
      appBar: AppBar(title: Text('Reset Password'),),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key:_form,
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 50.0,),
              Text('Receive an E-mail to Reset Your Password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 22.0,
                ),),
              SizedBox(
                height: 20.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: _email,
                  validator: (value){
                    if(!emailValidation(value!)||value.isEmpty){
                      return "Please enter valid email adddress";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
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
                    "Reset Password",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(

                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
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
