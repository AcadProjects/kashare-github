import 'package:flutter/material.dart';
import 'package:kashare/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    //	return Container(
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        title: Text('KaShare'),
        backgroundColor: Colors.green[400],
        elevation: 0.0,
        actions: <Widget>[
          ElevatedButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
    );

    //child: Text('KaShare'),
    //); //Container
  }
}
