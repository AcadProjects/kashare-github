import 'package:flutter/material.dart';
import 'package:kashare/services/auth.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        elevation: 0.0,
        title: Text('Sign In to KaShare'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
          shape: RoundedRectangleBorder(
          	borderRadius: BorderRadius.circular(100.0),
          	),
          ),
          child: Text('Sign In Anonymusly'),
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
            if(result == null){
              print('Error Signing In');
            } else {
              print('Signed In');
              print(result);
            }
          },
        	
        ),
      ),
    );
  }
}