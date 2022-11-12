import 'package:kashare/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final toggleView;
  //Register({this.toggleView});
  const Register({Key? key, this.toggleView}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        elevation: 0.0,
        title: Text('Sign up to KaShare'),
        actions: <Widget>[
          ElevatedButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val!.isEmpty ? 'Enter your email' : null,
                onChanged: (val) {
                  setState(() => email = val.trim());
                },
              ), //TextFormField - Email
              SizedBox(height: 40.0),

              TextFormField(
                obscureText: true,
                validator: (val) => val!.length < 7
                    ? 'Enter a password (Must be greater than 7 characters)'
                    : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ), //TextFormField - Password

              TextFormField(
                obscureText: true,
                validator: (val) => val!.length < 7 ? 'Confirm Password' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ), //TextFormField - Confirm Password

              SizedBox(height: 20.0),
              ElevatedButton(
                  // Colors.green[400],
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // print(email);
                      // print(password);
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() => error = 'Enter valid email');
                      }
                    } else {}

                    //
                    //
                  }),
              SizedBox(height: 12.0),
              Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0)),
            ],
          ),
        ),
      ),
    );
  }
}
