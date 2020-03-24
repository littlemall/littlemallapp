import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:littlemallapp/pages/boot_page.dart';
import 'package:littlemallapp/pages/splash_page.dart';
import 'package:littlemallapp/routers/application.dart';
import 'package:littlemallapp/routers/routes.dart';
import 'package:littlemallapp/store/login_page_store.dart';
import 'package:littlemallapp/store/sign_up_page_store.dart';
import 'package:littlemallapp/store/splash_page_store.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashPageStore()),
        ChangeNotifierProvider(create: (_) => SignUpPageStore()),
        ChangeNotifierProvider(create: (_) => LoginPageStore()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
        routes: {'/BootPage': (ctx) => BootPage()},
      ),
    );
  }
}
