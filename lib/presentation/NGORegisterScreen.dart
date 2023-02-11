import 'package:flutter/material.dart';
import 'package:we_care/presentation/widget/CommonWidgets.dart';

import 'LoginScreen.dart';

class NGORegisterScreen extends StatefulWidget {
  static const route = "/NGORegisterScreen";
  NGORegisterScreen({Key? key}) : super(key: key);

  @override
  State<NGORegisterScreen> createState() => _NGORegisterScreenState();
}

class _NGORegisterScreenState extends State<NGORegisterScreen> {
  List<String> selectedCauses = [];
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          margin: EdgeInsets.all(4),
          padding: EdgeInsets.all(4),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  XTitle(value: "Create New Account"),
                  Stepper(
                    physics: NeverScrollableScrollPhysics(),
                    currentStep: _currentStep,
                    onStepContinue: () {
                      if (getSteps().length - 1 == _currentStep) {
                        //HTTP REQUEST CREATE NGO
                      } else {
                        setState(() {
                          _currentStep++;
                        });
                      }
                    },
                    onStepCancel: _currentStep == 0
                        ? null
                        : () {
                            setState(() {
                              _currentStep--;
                            });
                          },
                    controlsBuilder: (context, details) {
                      return Row(
                        children: [
                          if (details.currentStep != getSteps().length - 1)
                            CircleAvatar(
                              child: IconButton(
                                icon: Icon(Icons.arrow_downward),
                                onPressed: details.onStepContinue,
                              ),
                            ),
                          const SizedBox(
                            width: 20,
                          ),
                          CircleAvatar(
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_upward,
                              ),
                              onPressed: details.onStepCancel,
                            ),
                          ),
                        ],
                      );
                    },
                    type: StepperType.vertical,
                    steps: getSteps(),
                  ),
                  Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: XButton(
                      text: "Register as NGO",
                      alter: false,
                      width: double.infinity,
                      height: 50,
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(NGORegisterScreen.route);
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed(LoginScreen.route);
                          },
                          child: Text("Sign In"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Step> getSteps() {
    return [
      Step(
        isActive: _currentStep >= 0,
        state: _currentStep > 0 ? StepState.complete : StepState.indexed,
        content: Column(
          children: [
            XField(value: "Name"),
            XField(value: "Email"),
            XField(value: "Password"),
            XField(value: "Confirm Password"),
          ],
        ),
        title: XSubTitle(value: "Enter Basic Details"),
      ),
      Step(
        isActive: _currentStep >= 1,
        state: _currentStep > 1 ? StepState.complete : StepState.indexed,
        title: XSubTitle(value: "Describe your cause"),
        content: XTextArea(
          value: "Describe a bit about your NGO",
        ),
      ),
      Step(
        isActive: _currentStep >= 2,
        state: _currentStep > 2 ? StepState.complete : StepState.indexed,
        title: XSubTitle(value: "Vision"),
        content: XTextArea(
          value: "Describe to viewers and potential funders your vision and how you are going to fulfill it",
        ),
      ),
      Step(
        isActive: _currentStep >= 3,
        state: _currentStep > 3 ? StepState.complete : StepState.indexed,
        title: XSubTitle(value: "Impact of NGO"),
        content: XTextArea(
          value: "Describe impact of your NGO",
        ),
      ),
    ];
  }
}
