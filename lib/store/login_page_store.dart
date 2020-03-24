import 'package:flutter/material.dart';

class LoginPageStore  with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex =>  _currentIndex;

  void setCurrentIndex(index){
    _currentIndex = index;
     notifyListeners();
  }
}