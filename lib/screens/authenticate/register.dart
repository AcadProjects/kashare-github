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
//
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'First Name',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0)),
                ),
                validator: (val) => val!.isEmpty ? 'Enter First Name' : null,
                onChanged: (val) {
                  setState(() => email = val.trim());
                },
              ), //TextFormField - First Name
//
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Last Name',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0)),
                ),
                validator: (val) => val!.isEmpty ? 'Enter Last Name' : null,
                onChanged: (val) {
                  setState(() => email = val.trim());
                },
              ), //TextFormField - Last Name
//

//
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0)),
                ),
                validator: (val) => val!.isEmpty ? 'Enter your email' : null,
                onChanged: (val) {
                  setState(() => email = val.trim());
                },
              ), //TextFormField - Email
//
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Address',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0)),
                ),
                validator: (val) => val!.isEmpty ? 'Enter your Address' : null,
                onChanged: (val) {
                  setState(() => email = val.trim());
                },
              ), //TextFormField - Address
//
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0)),
                ),
                validator: (val) => val!.isEmpty ? 'Enter your email' : null,
                onChanged: (val) {
                  setState(() => email = val.trim());
                },
              ), //TextFormField - Email
//
              SizedBox(height: 20.0),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0)),
                ),
                validator: (val) =>
                    val!.isEmpty ? 'Enter your Phone Number' : null,
                onChanged: (val) {
                  setState(() => email = val.trim());
                },
              ), //TextFormField - Phone Number
//
              SizedBox(height: 40.0),

              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0)),
                ),
                obscureText: true,
                validator: (val) => val!.length < 7
                    ? 'Enter a password (Must be greater than 7 characters)'
                    : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ), //TextFormField - Password

              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0)),
                ),
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
