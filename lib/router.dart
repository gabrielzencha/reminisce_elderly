import 'package:flutter/material.dart';
import 'package:Reminisce/pages/auth/screens/login_page.dart';
import 'package:Reminisce/widgets/error.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginPage.routeName:
      return MaterialPageRoute(builder: ((context) => const LoginPage()));
    default:
      return MaterialPageRoute(
          builder: ((context) => const Scaffold(
              body: ErrorScreen(error: 'This page doesn\'t  exit'))));
  }
}
