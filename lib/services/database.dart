import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kashare/models/kashare.dart';
import 'package:kashare/models/kashare.dart';

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

  List<Kashare> _kashareListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Kashare(
        name: doc.get('name') ?? '',
        location: doc.get('location') ?? '',
        destination: doc.get('destination') ?? '',
        lat: doc.get('lat') ?? 0,
        long: doc.get('long') ?? 0,
      );
    }).toList();
  }

  Stream<List<Kashare>> get kashare {
    return kashareCollection.snapshots().map(_kashareListFromSnapshot);
  }
}
