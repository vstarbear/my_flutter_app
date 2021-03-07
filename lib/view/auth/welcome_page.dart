import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'login_page.dart';
import 'registration_page.dart';

AuthService _auth = AuthService();

class WelcomePage extends StatefulWidget {
  static const routeName = '/welcome';
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome!'),
      ),
      body: Builder(builder: (BuildContext context) {
        return ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterForm()));
              },
              child: Text('Registration'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginForm()));
              },
              child: Text('Login'),
            )
          ],
        );
      }),
    );
  }
}
