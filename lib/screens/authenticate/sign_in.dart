import 'package:flutter/material.dart';

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
		appBar:AppBar(
			backgroundColor: Colors.green[400],
			elevation: 0.0,
			title: Text('Sign In to Kashare'),
			), //AppBar
			body: Container(
				padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
				child: RaisedButton(
					child: Text('Sign in Anonymously');
					onPressed: () async {
						dynamic result = await _auth.signInAnon();
						if(result == null){
							print('Error Signing In');
						} else {
							print('Signed In');
							print(reult);
						}
					}
				), //RaisedButton
			), //Container
		); //Scaffold
	}
}