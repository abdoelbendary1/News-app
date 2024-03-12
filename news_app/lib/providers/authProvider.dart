import 'package:flutter/material.dart';
import 'package:news_app/model/user.dart';

class AuthProviders extends ChangeNotifier {
  MyUser? currrentUser;
  void updateUser(MyUser newUser) {
    currrentUser = newUser;
    notifyListeners();
  }

  
}
