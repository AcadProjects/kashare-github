import 'package:flutter/material.dart';
import 'package:kashare/services/auth.dart';
import 'package:kashare/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kashare/screens/home/kashare_list.dart';
import 'package:kashare/models/kashare.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: Text('Ride'),
            );
          });
    }

    //	return Container(
    return StreamProvider<List<Kashare?>>.value(
        initialData: [],
        value: DatabaseService(uid: '').kashare,
        child: Scaffold(
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
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.settings),
                label: Text('Settings'),
                onPressed: () => _showSettingsPanel(),
              )
            ],
          ),
          body: KashareList(),
        ));
    //child: Text('KaShare'),
    //); //Container
  }
}
