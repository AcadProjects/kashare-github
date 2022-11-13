import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference kashareCollection =
      FirebaseFirestore.instance.collection('kashare');
  Future updateUserData(String name, String location, String destination,
      int lat, int long) async {
    return await kashareCollection.doc(uid).set({
      'name': name,
      'location': location,
      'destination': destination,
      'lat': lat,
      'long': long,
    });
  }
}
