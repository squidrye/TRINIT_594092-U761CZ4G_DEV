import 'package:flutter/material.dart';

class XTitle extends StatelessWidget {
  String value;
  XTitle({required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          value,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}

class XSubTitle extends Text {
  final String value;
  XSubTitle({required this.value, Key? key}) : super(key: key, value);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(right: 8.0, top: 8, bottom: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          value,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}

class XField extends StatelessWidget {
  String value;
  TextEditingController controller;
  XField({required this.value, Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: value,
          ),
        ),
      ),
    );
  }
}

class XTextArea extends StatelessWidget {
  String value;
  TextEditingController controller;
  XTextArea({required this.value, Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextFormField(
          maxLines: 7,
          controller: controller,
          decoration: InputDecoration(hintText: value),
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
    return Container(
      margin: EdgeInsets.all(8),
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          foregroundColor:
              alter ? Theme.of(context).primaryColor : Colors.white,
          backgroundColor:
              alter ? Colors.white : Theme.of(context).primaryColor,
        ),
        child: Text(text),
        onPressed: onPressed,
      ),
    );
  }
}

// ignore: must_be_immutable
class ShortDetails extends StatelessWidget {
  String value;
  int raised;
  ShortDetails({required this.value, required this.raised, Key? key})
      : super(key: key);

  //  Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0, right: 50),
      child: Container(
        height: 230,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(10)),
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            height: 230,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('value'))),
          ),
          Container(
            height: 230 / 1.7,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 24, 68, 143),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  XSubTitle(value: 'Title'),
                  const Text('Details'),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 0, right: 5, bottom: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Raised" ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        const SizedBox(width: 10,),
                        Text("80 %", style: TextStyle(fontSize: 19, color: Colors.green,fontWeight: FontWeight.bold),),

                         const SizedBox(width: 30,),

                        XButton(
                            onPressed: () {},
                            alter: true,
                            width: 120,
                            height: 30,
                            text: 'View Details')
                      ],
                    ),
                  )
                ],
              ),
            ),
            // color: Colors.blueAccent,
          ),
        ]),
      ),
    );
  }
}

class XDetails extends StatelessWidget {
  String title= "Title";

  XDetails({required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: (MediaQuery.of(context).size.width),
      // color: Colors.green,
      decoration: const BoxDecoration(
        color: Colors.white

      ),
      child: Card(
        elevation: 7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              height: 200,
              width: (MediaQuery.of(context).size.width),
              child:  Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    XSubTitle(value: title),
                     const Text('Details'),
      
                   
                        ],
                      ),
                    )
        )],
          ),
      ));
        
  }
}

class Investor extends StatelessWidget {
  String title= "Title";

  Investor({required this.title, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Card(
      
      elevation: 10,
      color: Colors.white,
      child: Container(
        height: 120,
        width: (MediaQuery.of(context).size.width),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 10),
              child: Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(width: 10,),
                  Text("Steve Rogers"),
                  SizedBox(width: 50,),
                  Text("10000 Rs" ,style: TextStyle(fontSize: 17),)

                ],
              ),
            ),
            const SizedBox(height: 9,),

            Padding(
              padding:  const EdgeInsets.only(left:8.0),
              child: Row(children:  [
                const CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white24,
                ),
                const SizedBox(width: 10,),
                TextButton(child: const Text("Send a Message"),
                onPressed: (){},
                )
              ],),
            )
          ],
        ),
      ),
    );
  }
}

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 315,
      color: Colors.white,
      child:  Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.only(left: 20,top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("About",style: TextStyle(fontSize: 25),),

              SizedBox(height: 20,),

              Text("Details")
            ],
          ),
          
        ),
      ),
    );
  }
}

class Vision extends StatelessWidget {
  const Vision({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 400,
      color: Colors.white,
      child:  Card(
         
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.only(left: 20,top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Vision",style: TextStyle(fontSize: 25),),

              SizedBox(height: 20,),

              Text("Details")
            ],
          ),
          
        ),
      ),
    );
  }
}

