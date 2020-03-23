import 'package:flutter/material.dart';

class SignUpPageStore with ChangeNotifier {
  String _name = "";
  String _emial = "";
  String _password = "";
  String get name => _name;
  String get emial => _emial;
  String get password => _password;

  void setName(name) {
    _name = name;
    notifyListeners();
  }

  void setEmail(emial) {
    _emial = emial;
    notifyListeners();
  }

  void setPassword(password) {
    _password = password;
    notifyListeners();
  }
}
