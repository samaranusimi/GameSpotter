import 'package:flutter/material.dart';
import 'package:gamify_app/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gamify',
        theme: ThemeData(brightness: Brightness.dark),
        home: SplashScreen());
  }
}
