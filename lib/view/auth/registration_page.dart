import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_service.dart';

AuthService _auth = AuthService();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
User user;
bool _success;
String _userEmail;

class RegisterEmailSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegisterEmailSectionState();
}

class RegisterEmailSectionState extends State<RegisterEmailSection> {
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      user = (await _auth.signUp(
        _emailController.text,
        _passwordController.text,
      ));
    }
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _success = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            RaisedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  _register();
                }
              },
              child: const Text('Submit'),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                _success == null
                    ? ''
                    : (_success
                        ? 'Successfully registered ' + _userEmail
                        : 'Registration failed'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
