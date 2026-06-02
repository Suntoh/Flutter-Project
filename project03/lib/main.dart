import 'package:flutter/material.dart';
import 'package:project03/pages/home_page.dart';
import 'package:project03/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => SplashScreen(),
        "/home": (context) => HomePage(),
      },
    );
  }
}
