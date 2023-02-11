import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_care/presentation/widget/CommonWidgets.dart';

import 'NGORegisterScreen.dart';

class CampaignForm extends StatefulWidget {
  static const route = "/CampaignForm";
  CampaignForm({Key? key}) : super(key: key);

  TextEditingController _title = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _targetAmount = TextEditingController();
  TextEditingController _country = TextEditingController();
  TextEditingController _currencyType = TextEditingController();

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  @override
  State<CampaignForm> createState() => _CampaignFormState();
}

class _CampaignFormState extends State<CampaignForm> {
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
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.all(4),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: XTitle(value: "Start a campaign"),
                  )),
                  const Center(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        "Add necessary Details , Images & Proof of concept"),
                  )),
                  Stepper(
                    physics: const NeverScrollableScrollPhysics(),
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
                                icon: const Icon(Icons.arrow_downward),
                                onPressed: details.onStepContinue,
                              ),
                            ),
                          const SizedBox(
                            width: 20,
                          ),
                          CircleAvatar(
                            child: IconButton(
                              icon: const Icon(
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
                      text: "Create",
                      alter: false,
                      width: double.infinity,
                      height: 50,
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(NGORegisterScreen.route);
                      },
                    ),
                  ),
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
            XField(value: "Title", controller: widget._title,),
          ],
        ),
        title: XSubTitle(value: "Campaign Title"),
      ),
      Step(
        isActive: _currentStep >= 1,
        state: _currentStep > 1 ? StepState.complete : StepState.indexed,
        content: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: GridView(
            primary: false,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 2),
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
        ),
        title: XSubTitle(value: "Select Category"),
      ),
      Step(
        isActive: _currentStep >= 2,
        state: _currentStep > 2 ? StepState.complete : StepState.indexed,
        title: XSubTitle(value: "Short Description"),
        content: XTextArea(
          value: "Short description about campaign", controller: widget._description,
        ),
      ),
      Step(
        isActive: _currentStep >= 3,
        state: _currentStep > 3 ? StepState.complete : StepState.indexed,
        title: XSubTitle(value: "Details"),
        content: Column(
          children: [
            XField(value: "Target Amount", controller: widget._targetAmount),
            Row(
              children: [
                ElevatedButton(
                  child: Text("Start Date"),
                  onPressed: () {},
                ),
                ElevatedButton(
                  child: Text("End Date"),
                  onPressed: () {},
                )
              ],
            ),
            XField(value: "Country", controller: widget._country),
            XField(value: "Currency Type", controller: widget._currencyType),
          ],
        ),
      ),
    ];
  }
}
