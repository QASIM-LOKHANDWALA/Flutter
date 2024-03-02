import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

class AuthService {
  // Google Sign In
  signInWithGoogle() async {
    // Begin Sign In Process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // Obtain Auth Details From Request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // Create New Credential For User
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // Finally Sign In
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  
}