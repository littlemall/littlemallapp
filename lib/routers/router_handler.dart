import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:littlemallapp/pages/login_page.dart';

Handler loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginPage();
});