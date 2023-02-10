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
      theme: ThemeData(
        primaryColor: Color(0xFF486C7C),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            fontFamily: 'Poppins',
            color: Color(0XFF04021D),
          ),
          titleLarge: TextStyle(fontSize: 30.0, fontFamily: 'Poppins'),
          bodyMedium: TextStyle(fontSize: 16.0, fontFamily: 'Poppins'),
          bodySmall: TextStyle(fontSize: 14.0, fontFamily: 'Poppins'),
        ),
      ),
    ),
  );
}
