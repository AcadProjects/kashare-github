import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:kashare/models/kashare.dart';
import 'package:kashare/screens/home/kashare_list.dart';

class KashareList extends StatefulWidget {
  @override
  _KashareListState createState() => _KashareListState();
}

class _KashareListState extends State<KashareList> {
  @override
  Widget build(BuildContext context) {
    final kashares = Provider.of<List<Kashare>>(context);
    //print(kashare.documents);
    /*
    for (var doc in kashare.docs) {
      print(doc.data());
    }
    */
    /*
    kashare.forEach((kashare) {
      print(kashare.name);
      print(kashare.location);
      print(kashare.destination);
      print(kashare.lat);
      print(kashare.long);
    });
    */
    return ListView.builder(
      itemCount: kashares.length,
      itemBuilder: (context, index) {
        return KashareTile(kashare: kashares[index]);
      },
    );
    // return Container();
  }
}
