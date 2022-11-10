import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
	final FirebaseAuth _auth = FirebaseAuth.instance;

	//Anonymous Sign In
	Future signInAnon() async {
		try {
		 AuthResult result = await _auth.signInAnonymously(); //Dapat nakaenable ito sa firebase authentication as anonymous
		FirebaseUser user = result.user;
		return user;
		} catch(e) {
			print(e.toString());
			return null;
		}
	}

	//Email and Password Sign In

	//Register with Emaul and Pasword

	//Sign Out
}