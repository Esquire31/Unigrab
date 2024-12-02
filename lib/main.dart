import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart'; // Import the Firebase options
import 'pages/landing_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase(); // Initialize Firebase
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
      home: LandingPage(), // Use the LandingPage
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/landing': (context) => LandingPage(),
      },
    );
  }
}