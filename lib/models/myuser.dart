class MyUser {
  final String? uid;
  MyUser({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String destination;
  final int latlong;

  static var distance;

  UserData(
      {required this.uid,
      required this.latlong,
      required this.destination,
      required this.name});
}
