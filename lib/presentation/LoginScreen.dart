import 'package:flutter/material.dart';
import 'package:we_care/presentation/DashBoard.dart';
import 'package:we_care/presentation/LandingScreen.dart';
import 'package:we_care/presentation/widget/CommonWidgets.dart';

import '../service/firebase_service.dart';

class LoginScreen extends StatelessWidget {
  static const route = "/LoginScreen";
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 50, bottom: 5, right: 20, left: 12),
                    child: XTitle(value: "Let's Sign You In")),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 20, right: 20, left: 20),
                  child: XSubTitle(value: "Welcome Back!"),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 5, right: 20, left: 20),
                  child: XField(value: "Email", controller: _email),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 10, right: 20, left: 20),
                  child: XField(value: "Password", controller: _password),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child: const Text("Forgot Password ?"),
                      onPressed: () {},
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20, right: 20, left: 20),
                  child: XButton(
                      onPressed: () async {
                        await signIn(_email.text, _password.text);
                        Navigator.of(context).pushNamed(DashBoard.route);
                      },
                      alter: false,
                      width: double.infinity,
                      height: 50,
                      text: "Sign In"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(LandingScreen.route);
                        },
                        child: const Text("Sign Up")),
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
