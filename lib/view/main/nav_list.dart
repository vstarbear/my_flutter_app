import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Nav {
  final String title;
  final IconData icon;

  Nav({this.title, this.icon});

  Nav.fromMap(Map<String, dynamic> json)
      : this(
          title: json['title'],
          icon: json['icon'],
        );
}

List<Nav> navs = [
  Nav(icon: Icons.home, title: 'Home Page'),
  Nav(icon: Icons.account_circle, title: 'Profile'),
];
