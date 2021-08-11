import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:watch_tonight/screens/pushed_screen.dart';


class FirstScreen extends StatelessWidget {
  static const route = '/first';
  bool _isLogin = false;
  Map _userData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: false).pushNamed(PushedScreen.route);
              },
              child: Text('Push route with bottom bar'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pushNamed(PushedScreen.route);
              },
              child: Text('Push route without bottom bar'),
            ),
          ],
        ),
      ),
    );
  }
}