import 'package:flutter/material.dart';
import 'package:we_care/presentation/DashBoard.dart';
import 'package:we_care/presentation/LandingScreen.dart';
import 'package:we_care/presentation/widget/CommonWidgets.dart';

class LoginScreen extends StatelessWidget {
  static const route = "/LoginScreen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 50, bottom: 5, right: 20, left: 12),
                    child: XTitle(value: "Let's Sign You In")),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 20, right: 20, left: 20),
                  child: XSubTitle(value: "Welcome Back!"),
                ),
                Container(
                    margin: EdgeInsets.only(top: 20, bottom: 5, right: 20, left: 20), child: XField(value: "Email")),
                Container(
                    margin: EdgeInsets.only(top: 5, bottom: 10, right: 20, left: 20), child: XField(value: "Password")),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child: Text("Forgot Password ?"),
                      onPressed: () {},
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20, right: 20, left: 20),
                    child:
                        XButton(onPressed: () {
                          Navigator.of(context).pushNamed(DashBoard.route);
                        }, alter: false, width: double.infinity, height: 50, text: "Sign In")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(DashBoard.route);
                        },
                        child: Text("Sign Up")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
