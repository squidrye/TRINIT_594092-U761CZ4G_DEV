import 'package:flutter/material.dart';

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
            child:Row(
              children: [

              ],
            ),
          ),
          Container(
            margin:EdgeInsets.only(top:150),
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
}
