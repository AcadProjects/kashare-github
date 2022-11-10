import 'package:flutter/material.dart';
import 'package:kashare/screens/home/home.dart';
import 'package:kashare/screens/authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
	@override
	Widget build(BuildContext context){
		//return either Home or Authenticate Widget
		return Authenticate();
	}
}