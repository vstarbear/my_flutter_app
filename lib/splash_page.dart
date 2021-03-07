import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_flutter_app/auth/registration_page.dart';
import 'package:my_flutter_app/main_page.dart';
import 'auth/welcome_page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('SplashScreen'),
            Text(''),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class SplashControl extends StatelessWidget {
  final User user = _auth.currentUser;
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 2)),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashPage();
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
