import 'package:flutter/material.dart';
import 'package:we_care/presentation/widget/CommonWidgets.dart';

class DashBoard extends StatelessWidget {
  static const route = "/DashBoard";
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Theme.of(context).primaryColorLight,
            child: Row(
              children: [buildStatsCards()],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 200),
            height: double.infinity,
            width: double.infinity,
            child: Card(
              child: Text("Content"),
            ),
          )
        ],
      )),
    );
  }

  Widget buildStatsCards() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: 200,
        child: Card(
          child: Column(
            children: [
              Container(width: 200, child: XTitle(value: "03")),
              Container(width: 200, child: XSubTitle(value: "Active Campaign"))
            ],
          ),
        ),
      ),
    );
  }
}
