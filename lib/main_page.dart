import 'package:flutter/material.dart';
import 'package:my_flutter_app/auth/welcome_page.dart';
import 'nav_list.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth/registration_page.dart';

AuthService _auth = AuthService();

class MainPage extends StatefulWidget {
  static const routeName = "/main";

  final String title;

  MainPage({Key key, this.title}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int _routeIndex = 0;
  TabController _tabController;

  List<GlobalKey<NavigatorState>> navigationKeys;

  List<GlobalKey<NavigatorState>> generateNavigationKey() {
    List<GlobalKey<NavigatorState>> navKeys = navs.map((navItem) {
      return GlobalKey<NavigatorState>();
    }).toList();
    return navKeys;
  }

  @override
  void initState() {
    super.initState();
    navigationKeys = generateNavigationKey();
    _tabController = TabController(
      length: navs.length,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Builder(builder: (BuildContext context) {
            return FlatButton(
              child: const Text('Sign out'),
              textColor: Theme.of(context).buttonColor,
              onPressed: () async {
                final User user = await _auth.getCurrentUser();

                if (user == null) {
                  Scaffold.of(context).showSnackBar(const SnackBar(
                    content: Text('No one has signed in.'),
                  ));
                }
                await _auth.signOut();
                final String uid = user.uid;
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(uid + ' has successfully signed out.'),
                  ),
                );
                return Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => WelcomePage()),
                  ModalRoute.withName('/'),
                );
              },
            );
          })
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          HomePage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            print(index);
            setState(
              () {
                _tabController.index = index;
                _routeIndex = index;
              },
            );

            if (_routeIndex == index) {
              if (navigationKeys[index].currentState.canPop())
                navigationKeys[index].currentState.pop();
            }
            _routeIndex = index;
          },
          currentIndex: _routeIndex,
          items: navs
              .map(
                (item) => BottomNavigationBarItem(
                  label: (item.title),
                  icon: Icon(item.icon),
                ),
              )
              .toList()
          //onSelectTab: _selectTab,
          ),
    );
  }
}
