import 'package:flutter/material.dart';
import 'package:we_care/presentation/LoginScreen.dart';
import 'package:we_care/presentation/NGORegisterScreen.dart';
import 'package:we_care/presentation/widget/CommonWidgets.dart';

import 'UserRegisterScreen.dart';

class LandingScreen extends StatefulWidget {
  static const route = "/LandingPage";
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/landing_screen/landing_page.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Explore an authentic way of supporting those in need",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Keep track of all your expenditures, budgets, bill splits all in one place.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "View, sort and categorize all expenses, watch out for over all stats, notify people you have paid for.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      XButton(
                        text: "Register as NGO",
                        alter: true,
                        width: double.infinity,
                        height: 50,
                        onPressed: () {
                          Navigator.of(context).pushNamed(NGORegisterScreen.route);
                        },
                      ),
                      XButton(
                        text: "Register as User",
                        alter: true,
                        width: double.infinity,
                        height: 50,
                        onPressed: () {
                          Navigator.of(context).pushNamed(UserRegisterScreen.route);
                        },
                      ),
                      XButton(
                        text: "Sign In",
                        alter: false,
                        width: double.infinity,
                        height: 50,
                        onPressed: () {
                          Navigator.of(context).pushNamed(LoginScreen.route);
                        },
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
