import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/splash_image.jpg", height: 300),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "Welcome to My App",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.cyan,
                  shadows: [
                    Shadow(
                      color: Colors.black45,
                      offset: Offset(0.5, 0.5),
                      blurRadius: 1,
                    ),
                  ],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              mouseCursor: SystemMouseCursors.click,
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Ink(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
