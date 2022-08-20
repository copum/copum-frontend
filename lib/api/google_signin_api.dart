import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  var test;
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
  // GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;


  static Future logout() => _googleSignIn.disconnect();
}
