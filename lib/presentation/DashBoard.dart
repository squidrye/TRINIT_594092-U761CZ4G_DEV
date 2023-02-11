import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:we_care/presentation/widget/CommonWidgets.dart';

class DashBoard extends StatelessWidget {
  static const route = "/DashBoard";
  DashBoard({Key? key}) : super(key: key);

  String dropdownvalue = 'All Categories';

  // List of items in our dropdown menu
  var items = [
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
          body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Theme.of(context).primaryColorLight,
            child: Row(
              children: const [],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 150),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(40)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                    padding: EdgeInsets.only(left: 30, top: 20),
                    child: Text(
                      "Popular Campaigns",
                    )),
                const SizedBox(height: 15,),
                Container(
                  margin: EdgeInsets.only(left: 30,right: 30),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 60,
                  decoration: const BoxDecoration(
                    
                  ),

                  child: DropdownButton(
                    
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                //       setState(() {
                //   dropdownvalue = newValue!;
                // });
                    },
                  ),),

                  const SizedBox(height: 15,),

                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                     physics: const BouncingScrollPhysics(
                     parent: AlwaysScrollableScrollPhysics()),
                      children:[ 
                        Details(value: 'value',raised: 10,),
                        const SizedBox(height: 30,),
                        Details(value: 'value',raised: 10,),

                        const SizedBox(height: 70,),

                        XButton(
                          onPressed: (){},
                           alter: false,
                            width: 150,
                             height: 60, 
                             text: "LOAD MORE !!")


                      
                      
                      ]),
                  ),
                  






              ],
            ),
          )
        ],
      )),
    );
  }
}
