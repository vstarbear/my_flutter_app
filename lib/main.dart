import 'package:flutter/material.dart';
import 'package:my_flutter_app/auth/welcome_page.dart';
import 'splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyAPP',
      initialRoute: '/',
      onUnknownRoute: (RouteSettings settings) {},
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case SplashControl.routeName:
            return MaterialPageRoute(
              builder: (BuildContext context) {
                return SplashControl();
              },
            );
          case MainPage.routeName:
            return MaterialPageRoute(
              builder: (BuildContext context) {
                return MainPage();
              },
            );
            break;
          case WelcomePage.routeName:
            return MaterialPageRoute(
              builder: (BuildContext context) {
                return WelcomePage();
              },
            );
            break;
          default:
        }
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {}
}
