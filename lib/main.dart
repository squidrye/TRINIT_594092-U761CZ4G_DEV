import 'package:flutter/material.dart';
import 'package:we_care/presentation/DashBoard.dart';
import 'package:we_care/presentation/LandingScreen.dart';
import 'package:we_care/presentation/LoginScreen.dart';
import 'package:we_care/presentation/NGORegisterScreen.dart';
import 'package:we_care/presentation/UserRegisterScreen.dart';
import 'package:we_care/presentation/SplashScreen.dart';

void main() {
  runApp(
    MaterialApp(
      home:  DashBoard(),
      routes: {
        SplashScreen.route: (context) => const SplashScreen(),
        LandingScreen.route: (context) => const LandingScreen(),
        LoginScreen.route: (context) => const LoginScreen(),
        UserRegisterScreen.route: (context) => UserRegisterScreen(),
        NGORegisterScreen.route: (context) => NGORegisterScreen(),
        DashBoard.route: (context) =>  DashBoard(),
      },
      theme: ThemeData(

        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
            fillColor: const Color(0xFFD9D9D9),
            filled: true),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
            color: Color(0XFF04021D),
          ),
          displayMedium: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
            color: Color(0XFF04021D),
          ),
          titleLarge: TextStyle(
            fontSize: 30.0,
            fontFamily: 'Poppins',
          ),
          bodyMedium: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Poppins',
          ),
          bodySmall: TextStyle(
            fontSize: 14.0,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    ),
  );
}
