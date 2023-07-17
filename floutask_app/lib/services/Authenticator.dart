import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authenticator {
  static Future<User?> iniciarSesion({required BuildContext context}) async {
    FirebaseAuth authenticator = FirebaseAuth.instance;
    User? user;

    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken
      );
      try {
        UserCredential userCredential = await authenticator.signInWithCredential(credential);

        user = userCredential.user;

        // Crear el documento del usuario en Firestore
        await createUserDocument(user!);

        return user;
      } on FirebaseAuthException catch (e) {
        print("Error en la autenticación");
      }
    }
  }

  static Future<void> createUserDocument(User user) async {
    DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);

    DocumentSnapshot userSnapshot = await userRef.get();
    if (!userSnapshot.exists) {
      await userRef.set({
        'name': user.displayName,
        'email': user.email,
        'photoURL': user.photoURL,
        'uid': user.uid,
        // Otras propiedades del perfil del usuario
      });
    }
  }

  static Future<void> cerrarSesion() async {
    FirebaseAuth authenticator = FirebaseAuth.instance;
    GoogleSignIn googleSignIn = GoogleSignIn();
    await authenticator.signOut();
    await googleSignIn.signOut();
  }
}


