import 'package:flutter/material.dart';
import 'package:kashare/screens/home/home.dart';
import 'package:kashare/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:kashare/models/myuser.dart';

class Wrapper extends StatelessWidget {
	@override
	Widget build(BuildContext context){

		final user = Provider.of<MyUser?>(context);
		print(user);

		//return either Home or Authenticate Widget
		return Authenticate();
	}
}