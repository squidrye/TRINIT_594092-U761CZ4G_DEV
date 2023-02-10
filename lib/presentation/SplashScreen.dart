import 'package:flutter/material.dart';

import 'LandingScreen.dart';

class SplashScreen extends StatelessWidget {
  static const String route = "/Splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF486C7C),
      body: FutureBuilder(
          future: Future.delayed(Duration(seconds: 5)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Image.asset(
                "assets/splash_screen/we_care.gif",
                gaplessPlayback: true,
              );
            }else if(snapshot.connectionState == ConnectionState.done){
              Navigator.of(context).pushNamed(LandingScreen.route);
            }
            return Container();
          }),
    );
  }
}
