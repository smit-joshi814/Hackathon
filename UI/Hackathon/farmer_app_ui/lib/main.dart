import 'package:farmer_app_ui/screens/login.dart';
import 'package:farmer_app_ui/screens/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context) => const MyLogin(),
      'register': (context) => const MyRegister()
    },
  ));
}
