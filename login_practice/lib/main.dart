import 'package:flutter/material.dart';
import 'package:login_practice/views/pages/LoginPage.dart';
import 'package:login_practice/views/pages/UsersListPage.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: "login",
      routes: {
        "login":(context) => LoginPage(),
        "users":(context) => UserListPage(),
      },
    );
  }
}
