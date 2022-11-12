import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:kashare/screens/wrapper.dart';
import 'package:kashare/models/myuser.dart';
import 'package:kashare/services/auth.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return StreamProvider<MyUser?>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
      home: Wrapper(),
      ), //MaterialApp
    ); //StreamProvider.value
  }
}












































/*
import 'package:flutter/material.dart';
import 'package:kashare/screens/mainpage.dart';
import 'auth.dart';
// @dart=2.9


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  const MyApp({Key? key}) : super(key: key);
  
  Widget build(BuildContext context) {
    return MaterialApp(
      //themeMode: ThemeMode.light,
      title: 'KaShare',
      home: Scaffold(
        appBar: AppBar(
          title: Text('KaShare'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                onPressed: () => authService.googleSignIn(),
                color: Colors. white,
                textColor: Colors.black,
                child: Text('Login with Google'),
              ),
              MaterialButton(
                onPressed: () => authService.signOut(),
                color: Colors. red,
                textColor: Colors.black,
                child: Text('Logout'),
              ) //Material Button
            ], // <Widget>[]
          ), // Column
        ),
       // brightness: Brightness.light,
       // primarySwatch: Colors.green,
      ),
     // home: MainPage(),
    );
  }
}

class UserProfile extends StatefulWidget {
  @override
  UserProfileState createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  late Map<String, dynamic> _profile;
  bool _loading = false;

  @override
  initState() {
    super.initState();
    authService.profile.listen((state) => setState(() => _profile = state));
    authService.loading.listen((state) => setState(() => _loading = state));
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        padding: EdgeInsets.all(20),
        child: Text(_profile.toString())     
      ),
      Text(_loading.toString())

    ]);
  }

}

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: authService.user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            MaterialButton(
                onPressed: () => authService.googleSignIn(),
                color: Colors.white,
                textColor: Colors.black,
                child: Text('Login with Google')
            );
          } else {
            MaterialButton(
              onPressed: () => authService.signOut(),
              color: Colors.red,
              textColor: Colors.black,
              child: Text('Logout'),
            );
          }
        }


    );
  }
}
*/