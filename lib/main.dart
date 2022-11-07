import 'package:flutter/material.dart';
import 'package:kashare/screens/mainpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KaShare',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MainPage(),
    );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: SfMaps(
      layers: [
        MapTileLayer(
          urlTemplate:'https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoiYW5naGVseiIsImEiOiJjbDd2anV6NHUwYzh4M3ZveHdudGQ0dHU1In0.m5vUkL5mWj1JxmojY55ZCg', 
        ),
      ],
    ),
  );
}