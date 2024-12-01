import 'package:flutter/material.dart';
import 'pages/landing_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UniGrab',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), // Use the LandingPage
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/landing': (context) => LandingPage(),
      },
    );
  }
}