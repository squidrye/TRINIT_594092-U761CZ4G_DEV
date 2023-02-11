
import 'package:flutter/material.dart';
import 'package:we_care/presentation/widget/CommonWidgets.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double w = MediaQuery(data: data, child: child)
    return Scaffold(
    appBar: AppBar(
    leading: IconButton(
    icon: const Icon(Icons.arrow_back, color: Colors.black),
    // onPressed: () => Navigator.of(context).pop(),
    onPressed: () {},
  ), 
  title: const Text("Details Screen"),
  centerTitle: true,
  
),
 body: SafeArea(
  child: ListView(
    children: [Padding(
      padding: const EdgeInsets.only(top: 20,left: 50,right: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children:   [
       XDetails(title: "hello",),
       const SizedBox(height: 50,),
  
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
        Text("Raised" , style: TextStyle(fontSize: 22, color: Colors.green),),
        Text("10 % "),
        SizedBox(width: 15,),
        Text("No of subscribers 200")
       ],),
  
       const SizedBox(height: 20,),
  
       XButton(
        onPressed: (){}, 
        alter: true, 
        width: 100, 
        height: 20, 
        text: "Raise Goal"),
        
        const SizedBox(height: 0,),
  
        const Text("3000 Rs"),

        const SizedBox(height: 20,),

        XButton(
          onPressed: (){}, 
          alter: false, 
          width: 250,
          height: 50, 
          text: "Donate Fund"),

          const SizedBox(height: 5,),

          Container(
            height: 80,
            width: (MediaQuery.of(context).size.width),
            color: Colors.white,
            child: const Padding(
              padding: EdgeInsets.only(left: 10,top: 10),
              child: Text( "Campaign Backed By Following investors : ",style: TextStyle(fontSize: 18),),
            ),
          ),

          const SizedBox(height: 10,),

          Investor(title: "title"),

          const SizedBox(height: 10,),

          Investor(title: "title"),

          const SizedBox(height: 10,),

          Investor(title: "title"),

          const SizedBox(height: 30,),

          const About(),

          const SizedBox(height: 10,),

          const Vision(),

          const SizedBox(height: 10,),





  
  
       ]
     ),
    ),]
  )),
    );
  }
}