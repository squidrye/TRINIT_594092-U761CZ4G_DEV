import 'dart:async';

import 'package:flutter/material.dart';

import 'LandingScreen.dart';

class SplashScreen extends StatefulWidget {
  static const String route = "/Splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 4),
      () => Navigator.of(context).pushReplacementNamed(LandingScreen.route),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Image.asset(
        "assets/splash_screen/we_care.gif",
        gaplessPlayback: true,
      ),
    );
  }
}
