import 'package:flutter/material.dart';
import 'package:timesheet_app/models/User.dart';

class Auth extends ChangeNotifier {
  bool _isAuthenticated = false;
  User _user;

  bool get authenticated => _isAuthenticated;
  User get user => _user;

  Future login({Map credentials}) async {}

  void logout() async {}
}
