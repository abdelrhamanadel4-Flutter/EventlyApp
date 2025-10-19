import 'package:flutter/material.dart';
import 'package:evently/model/user.dart';

class UserProvider extends ChangeNotifier {
  Userr? currentUser;

  void setUser(Userr user) {
    currentUser = user;
    notifyListeners();
  }
}
