import 'package:flutter/material.dart';
import 'package:kashare/models/kashare.dart';

class KashareTile extends StatelessWidget {
  final Kashare? kashare;
  KashareTile({this.kashare});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20, 0.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.green[200],
            ),
            title: Text('Where to?, ${kashare!.name}'),
            subtitle: Text(kashare!.location),
          ),
        ));
  }
}
