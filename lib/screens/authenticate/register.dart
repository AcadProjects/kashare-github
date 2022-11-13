import 'package:kashare/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:kashare/shared/constants.dart';
import 'package:kashare/shared/loading.dart';

class Register extends StatefulWidget {
  final toggleView;
  Register({this.toggleView});
  //const Register({Key? key, this.toggleView}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  // text field state
  String email = '';
  String firstname = '';
  String lastname = '';
  String password = '';
  int? phonenumber;
  String address = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
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
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'First Name'),
                      validator: (val) =>
                          val!.isEmpty ? 'Enter First Name' : null,
                      onChanged: (val) {
                        setState(() => firstname = val);
                      },
                    ), //TextFormField - First Name
//
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Last Name'),
                      validator: (val) =>
                          val!.isEmpty ? 'Enter Last Name' : null,
                      onChanged: (val) {
                        setState(() => lastname = val);
                      },
                    ), //TextFormField - Last Name
//

//
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Email'),
                      validator: (val) =>
                          val!.isEmpty ? 'Enter your email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ), //TextFormField - Email
//

                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Address'),
                      validator: (val) =>
                          val!.isEmpty ? 'Enter your Address' : null,
                      onChanged: (val) {
                        setState(() => address = val);
                      },
                    ), //TextFormField - Address
//

                    SizedBox(height: 10.0),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Phone Number'),
                      validator: (val) =>
                          val!.isEmpty ? 'Enter your Phone Number' : null,
                      onChanged: (val) {
                        setState(() => phonenumber);
                      },
                    ), //TextFormField - Phone Number
//
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Password'),
                      obscureText: true,
                      validator: (val) => val!.length < 7
                          ? 'Enter a password (Must be greater than 7 characters)'
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ), //TextFormField - Password

                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Confirm Password'),
                      obscureText: true,
                      validator: (val) =>
                          val!.length < 7 ? 'Confirm Password' : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ), //TextFormField - Confirm Password

                    SizedBox(height: 10.0),
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
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() => error = 'Enter valid email');
                              loading = false;
                            }
                          }

                          //
                          //
                        }),
                    SizedBox(height: 12.0),
                    Text(error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0)),
                  ],
                ),
              ),
            ),
          );
  }
}
