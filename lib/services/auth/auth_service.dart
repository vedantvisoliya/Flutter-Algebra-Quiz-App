import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  // instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // error dialog
  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          "Error Occured",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        content: Text(message, style: TextStyle(fontWeight: FontWeight.w300)),
      ),
    );
  }

  // sign up with email and password
  Future<UserCredential?> signUpWithEmailAndPassword(
    String emailAddress,
    String password,
    BuildContext context,
  ) async {
    try {
      UserCredential newCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

      // save user in firestore
      _firestore.collection("users").doc(newCredential.user?.uid).set({
        "uid": newCredential.user!.uid,
        "email": emailAddress,
        "level": 1,
      });

      return newCredential;
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      showErrorDialog(context, e.message ?? "Authentication failed");
      return null;
    }
  }

  // sign in with email and password
  Future<UserCredential?> signInWithEmailAndPassword(
    String emailAddress,
    String password,
    BuildContext context,
  ) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      showErrorDialog(context, e.message ?? "Authentication failed");
      return null;
    }
  }

  // sign out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // get user level
  Future<int?> getUserLevel(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();

    if (doc.exists && doc.data()!.containsKey('level')) {
      return doc['level'] as int;
    }
    return null;
  }

  // update user level
  Future<void> updateUserLevel(String uid, int newLevel) async {
    if (newLevel <= 90) {
      await _firestore.collection('users').doc(uid).update({'level': newLevel});
    }
    else {
      await _firestore.collection('users').doc(uid).update({'level': 90});
    }
  }

  // rest user level
  Future<void> resetUserLevel(String uid) async {
    await _firestore.collection('users').doc(uid).update({'level': 1});
  }

  // get current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}
