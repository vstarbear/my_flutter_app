import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_flutter_app/view/main/main_page.dart';
import '../auth/welcome_page.dart';
import 'splash_form.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SplashControl extends StatelessWidget {
  final User user = _auth.currentUser;
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 2)),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashForm();
        } else {
          if (user != null) {
            return MainPage();
          } else {
            return WelcomePage();
          }
        }
      },
    );
  }
}
