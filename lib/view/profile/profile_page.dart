import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = "/profile";
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("it's a profile page"),
    );
  }
}
