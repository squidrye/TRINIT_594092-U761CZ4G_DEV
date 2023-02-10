import 'dart:async';

import 'package:flutter/material.dart';

import 'LandingScreen.dart';

class SplashScreen extends StatelessWidget {
  static const String route = "/Splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4), () => Navigator.of(context).pushReplacementNamed(LandingScreen.route));
    return Scaffold(
      backgroundColor: Color(0xFF486C7C),
      body: Image.asset(
        "assets/splash_screen/we_care.gif",
        gaplessPlayback: true,
      ),
    );
  }
}
