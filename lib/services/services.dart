import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:walle/services/services_constants.dart';
import '../utils/utils.dart';

class Services {
  // Create user with emaila and password
  static Future createUser(email, password) async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
            (value) => Utils.showToast(
              message: "Account Created",
              bgColor: Colors.grey,
              textColor: Colors.white,
            ),
          );
    } on FirebaseAuthException catch (e) {
      Utils.showToast(
        message: e.toString(),
        bgColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  // sign in  with emaila and password
  static Future signInUser(email, password) async {
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                Utils.showToast(
                  message: "Logged in",
                  bgColor: Colors.grey,
                  textColor: Colors.white,
                )
              });
    } catch (e) {
      Utils.showToast(
        message: e.toString(),
        bgColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  // Sign out
  static Future signOutUser() async {
    try {
      await firebaseAuth.signOut().then(
            (value) => Utils.showToast(
              message: "Sign Out",
              bgColor: Colors.grey,
              textColor: Colors.white,
            ),
          );
    } catch (e) {
      Utils.showToast(
        message: e.toString(),
        bgColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  // Post Messages
  static Future postMessages(message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch;
      final user = firebaseAuth.currentUser?.email;

      await firebaseDatabase.child(id.toString()).set({
        "id": id,
        "UserEmail": user,
        "Message": message,
        "Timestamp": DateTime.now().toString(),
      });
    } catch (e) {
      Utils.showToast(
        message: e.toString(),
        bgColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }
}
