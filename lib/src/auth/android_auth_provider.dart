import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_provider_base.dart';

class _AndroidAuthProvider implements AuthProviderBase {
  @override
  Future<FirebaseApp> initialize() async {
    return await Firebase.initializeApp(
      name: 'TextMe',
      options: FirebaseOptions(
        apiKey: "AIzaSyACo0WSWy9E_8c2_ZxmQGo5Skwz5R7OrTo",
        authDomain: "the-chart-crew.firebaseapp.com",
        projectId: "the-chart-crew",
        storageBucket: "the-chart-crew.appspot.com",
        messagingSenderId: "677744103677",
        appId: "1:677744103677:android:3a5d248f0a136b67b2ee94",
        measurementId: "G-CGW8NCCRGZ",
      ),
    );
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

class AuthProvider extends _AndroidAuthProvider {}
