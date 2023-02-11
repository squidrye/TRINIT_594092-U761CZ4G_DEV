import 'package:flutter/material.dart';
import 'package:we_care/presentation/LoginScreen.dart';
import 'package:we_care/presentation/widget/CommonWidgets.dart';

import 'CampaignForm.dart';

class DashBoard extends StatefulWidget {
  static const route = "/DashBoard";
  DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String dropDownValue = 'All Categories';

  // List of items in our dropdown menu

  final items = [
    'All Categories',
    'Nature',
    'Education',
    'Social',
    'War-Relief',
    'Animals',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              onPressed: () {
                Navigator.of(context).pushNamed(CampaignForm.route);
              }),

          body: SingleChildScrollView(
            
            child: Container(
              height:1000,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(left: 30, top: 20),
                      child: Text("Popular Campaigns",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 65, 95, 119),
                          ))),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 60,
                    decoration: const BoxDecoration(),
                    child: DropdownButton(
                      value: dropDownValue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownValue = newValue!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: ListView(
                        // physics: NeverScrollableScrollPhysics(),
                        children: [
                          ShortDetails(
                            value: 'value',
                            raised: 10,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ShortDetails(
                            value: 'value',
                            raised: 10,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          XButton(onPressed: () {}, alter: true, width: 50, height: 50, text: "LOAD MORE !!"),
                          const SizedBox(
                            height: 20,
                          )
                        ]),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget buildStatsCards() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: 150,
        height: 160,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              children: [
                Container(width: 200, child: XTitle(value: "03")),
                Container(width: 200, child: XSubTitle(value: "Active Campaign"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
