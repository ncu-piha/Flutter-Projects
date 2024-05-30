import 'package:flutter/material.dart';

class Userinfo extends ChangeNotifier{
  String name = '';
  String email = '';

  String changeName(value){
    name = value;
    return name;
  }

  String changeEmail(value){
    email = value;
    return email;
  }

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}