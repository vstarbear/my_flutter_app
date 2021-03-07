import 'package:flutter/material.dart';

class SplashForm extends StatelessWidget {
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
