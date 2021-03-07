import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_flutter_app/view/main/main_page.dart';
import 'auth_service.dart';

AuthService _auth = AuthService();

class LoginForm extends StatefulWidget {
  static const routeName = '/login';
  @override
  State<StatefulWidget> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  User user;
  bool _success;
  String _userEmail;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      user = (await _auth.signIn(
        _emailController.text,
        _passwordController.text,
      ));
    }
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => MainPage()),
          ModalRoute.withName('/'),
        );
      });
    } else {
      setState(() {
        _success = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('$user.email');
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please enter your Email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please enter your Password';
                }
                return null;
              },
            ),
            RaisedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  _signIn();
                }
              },
              child: const Text('Submit'),
            ),
            // Container(
            //   alignment: Alignment.center,
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: Text(
            //     _success == null
            //         ? ''
            //         : (_success
            //             ? 'Successfully signed in ' + _userEmail
            //             : 'Sign in failed'),
            //     style: TextStyle(color: Colors.red),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
