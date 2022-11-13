import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:kashare/models/kashare.dart';

class KashareList extends StatefulWidget {
  @override
  _KashareListState createdState() => _KashareListState();
}

class _KashareListState extends State<KashareList> {
  @override
  Widget build(BuildContext context) {
    final kashare = Provider.of<List<Kashare>>(context);
    //print(kashare.documents);
    /*
    for (var doc in kashare.docs) {
      print(doc.data());
    }
    */
    kashare.forEach((kashare) {
      print(kashare.name);
      print(kashare.location,);
      print(kashare.destination,,);
      print(kashare.lat);
      print(kashare.long);
    });
    return Container();
  }
}
