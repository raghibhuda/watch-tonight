import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User user;

  bool get isLogged => user != null;

  void login() {
    user = User(name: 'John Doe');
    notifyListeners();
  }

  void logout() {
    user = null;
    notifyListeners();
  }
}

class User {
  User({@required this.name}) : assert(name != null);

  final String name;
}