import 'package:flutter/material.dart';

class LoggedInUserModel extends ChangeNotifier {
  AppUser? _loggedInUser;

  AppUser? get loggedInUser => _loggedInUser;

  setLoggedInUser(AppUser? user, {required String email, required String uid}) {
    _loggedInUser = user;
    notifyListeners();
  }
}

class AppUser {
  final String? email;
  final String? uid;

  AppUser({this.email, this.uid});
}
