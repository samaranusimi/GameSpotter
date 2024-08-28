import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:gamespotter/pages/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        backgroundColor: Colors.black,
        splash: Align(
          alignment: Alignment.center,
          child: Container(
              child: Text(
            "Gamify",
            style: TextStyle(
                color: Colors.indigoAccent,
                fontSize: 60,
                fontWeight: FontWeight.bold),
          )),
        ),
        duration: 2000,
        nextScreen: HomePage());
  }
}
