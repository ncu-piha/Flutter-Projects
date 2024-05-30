import 'package:flutter/material.dart';

class Savedwords extends ChangeNotifier{

  List<String> words = [];

  void add(word){
    words.add(word);
    notifyListeners();
  }

}