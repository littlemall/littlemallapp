
import 'package:flutter/material.dart';

class SplashPageStore with ChangeNotifier{
  bool _isBoot = false;
  bool get isBoot => _isBoot;

  void setIsBoot(isboot){
    _isBoot = isboot;
    notifyListeners();
  }
  
}