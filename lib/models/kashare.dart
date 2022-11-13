import 'package:flutter/material.dart';

class Kashare {
  //const Kashare({Key? key}) : super(key: key);
  final String name;
  final String location;
  final String destination;
  final int lat;
  final int long;

  Kashare(
      {required this.name,
      required this.location,
      required this.destination,
      required this.lat,
      required this.long});
}
