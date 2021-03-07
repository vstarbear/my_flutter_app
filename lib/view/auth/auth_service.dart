import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User> signUp(String email, String password) async {
    UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User user = result.user;
    return user;
  }

  Future<User> signIn(String email, String password) async {
    UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    User user = result.user;
    return user;
  }

  Future<User> getCurrentUser() async {
    User user = await _firebaseAuth.currentUser;
    return user;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
