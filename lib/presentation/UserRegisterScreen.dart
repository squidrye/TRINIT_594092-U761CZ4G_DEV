import 'package:flutter/material.dart';
import 'package:we_care/presentation/LoginScreen.dart';
import 'package:we_care/presentation/widget/CommonWidgets.dart';
import 'package:we_care/service/firebase_service.dart';

class UserRegisterScreen extends StatefulWidget {
  static const route = "/UserRegisterScreen";

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirm = TextEditingController();

  UserRegisterScreen({Key? key}) : super(key: key);

  @override
  State<UserRegisterScreen> createState() => _UserRegisterScreenState();
}

class _UserRegisterScreenState extends State<UserRegisterScreen> {
  List<String> causes = [
    "Nature",
    "Education",
    "Social",
    "War-Relief",
    "Animals",
    "Flood-Relief",
    "Empowerment",
    "Action Chip",
    "Action Chip"
  ];

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
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: XTitle(value: "Create New Account"),
                  ),
                  Stepper(
                    physics: NeverScrollableScrollPhysics(),
                    currentStep: _currentStep,
                    onStepContinue: () {
                      if (getSteps().length - 1 == _currentStep) {
                        //HTTP REQUEST CREATE USER
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
                      text: "Register as User",
                      alter: false,
                      width: double.infinity,
                      height: 50,
                      onPressed: () async {
                        await signUp(widget._email.text, widget._password.text);
                        Navigator.of(context).pushReplacementNamed(UserRegisterScreen.route);
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
            XField(value: "Name", controller: widget._name),
            XField(value: "Email", controller: widget._email),
            XField(value: "Password", controller: widget._password),
            XField(value: "Confirm Password", controller: widget._confirm),
          ],
        ),
        title: XSubTitle(value: "Enter Basic Details"),
      ),
      Step(
        isActive: _currentStep >= 1,
        state: _currentStep > 1 ? StepState.complete : StepState.indexed,
        content: GridView(
          primary: false,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 2),
          children: [
            ...causes
                .map(
                  (cause) => FilterChip(
                    label: Text(cause),
                    selected: selectedCauses.contains(cause),
                    onSelected: (bool selected) {
                      if (selected) {
                        setState(() {
                          selectedCauses.add(cause);
                        });
                      } else {
                        setState(() {
                          selectedCauses.remove(cause);
                        });
                      }
                    },
                  ),
                )
                .toList()
          ],
        ),
        title: XSubTitle(value: "Specify Your Interest"),
      ),
    ];
  }
}
