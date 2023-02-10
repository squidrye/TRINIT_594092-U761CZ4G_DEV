import 'package:flutter/material.dart';
import 'package:we_care/presentation/LandingScreen.dart';
import 'package:we_care/presentation/SplashScreen.dart';

void main() {
  runApp(
    MaterialApp(
      home: SplashScreen(),
      routes: {
        SplashScreen.route: (context) => SplashScreen(),
        LandingScreen.route: (context) => LandingScreen(),
      },
    ),
  );
}
