import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:littlemallapp/pages/boot_page.dart';
import 'package:littlemallapp/pages/splash_page.dart';
import 'package:littlemallapp/routers/application.dart';
import 'package:littlemallapp/routers/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final router = Router();
    Routes.configureRoutes(router);
    Application.router=router;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      routes: {
        '/BootPage': (ctx)=> BootPage()
      },
    );
  }
}