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
  XField({required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextFormField(
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
  XTextArea({required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextFormField(
          maxLines: 7,
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
class Details extends StatelessWidget {
  String value;
  int raised;
  Details({required this.value, required this.raised, Key? key}) : super(key: key);

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
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [XSubTitle(value: 'Title'),
                const Text('Details'),

                const SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.only(left: 0,right: 5,bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text("Raised $raised %"),

                    XButton(onPressed: (){}, 
                    alter: true,
                    width: 120, 
                    height: 30, 
                    text: 'View Details')

                    
                  ],),
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
