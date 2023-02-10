import 'package:flutter/material.dart';

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
                  "Explore an authentic way of tracking expenses ",
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
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          XButton(
                            text: "Sign Up",
                            alter: false,
                            width: 160,
                            height: 50,
                            onPressed: () {
                              // Navigator.of(context).pushReplacementNamed(AuthScreen.route);
                            },
                          ),
                          XButton(
                            text: "Log In",
                            alter: true,
                            width: 160,
                            height: 50,
                            onPressed: () {
                              // Navigator.of(context).pushReplacementNamed(AuthScreen.route);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class XButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final bool alter;
  final void Function() onPressed;
  const XButton({
    required this.onPressed,
    required this.alter,
    required this.width,
    required this.height,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        foregroundColor: alter ? Theme.of(context).primaryColor : Color(0xFFF2DA0E),
        backgroundColor: alter ? Colors.white : Theme.of(context).primaryColor,
      ),
      child: Text(text),
      onPressed: onPressed,
    );
  }
}
