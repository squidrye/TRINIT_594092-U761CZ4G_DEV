import 'package:flutter/material.dart';

import '../../model/Campaign.dart';
import '../details.dart';

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
  XField({required this.value, Key? key, required this.controller}) : super(key: key);

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
  XTextArea({required this.value, Key? key, required this.controller}) : super(key: key);

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
          foregroundColor: alter ? Theme.of(context).primaryColor : Colors.white,
          backgroundColor: alter ? Colors.white : Theme.of(context).primaryColor,
        ),
        child: Text(text),
        onPressed: onPressed,
      ),
    );
  }
}

// ignore: must_be_immutable
class ShortDetails extends StatelessWidget {
  Campaign campaign;
  int raised;
  String id;
  ShortDetails({required this.raised, Key? key, required this.campaign, required this.id}) : super(key: key);

  //  Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: 200,
        child: Card(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Image.network(
                    fit: BoxFit.fitWidth,
                    height: 140,
                    "https://images.unsplash.com/photo-1652188515604-1c3fc34c5ac4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=726&q=80"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: XSubTitle(value: campaign.title),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text(campaign.description),
              ),
              Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            "Raised",
                            style: TextStyle(fontSize: 22, color: Colors.green),
                          ),
                          Text("10 % "),
                          SizedBox(
                            width: 15,
                          ),
                          Text("No of subscribers 200")
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        XButton(onPressed: () {}, alter: true, width: 100, height: 20, text: campaign.category),
                        Text("${campaign.targetAmount} Rs"),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: XButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(Details.route, arguments: {'id': id});
                      },
                      alter: false,
                      width: 120,
                      height: 50,
                      text: 'View Details'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class XDetails extends StatelessWidget {
  String title = "Title";
  String description = "Title";

  XDetails({required this.description, required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            child: Image.network(
                fit: BoxFit.fitWidth,
                height: 180,
                "https://images.unsplash.com/photo-1652188515604-1c3fc34c5ac4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=726&q=80"),
          ),
          Container(
              decoration: const BoxDecoration(color: Colors.white),
              width: (MediaQuery.of(context).size.width),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    XSubTitle(value: title),
                    Text(description),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class Investor extends StatelessWidget {
  String title = "Title";

  Investor({required this.title, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.white,
      child: Container(
        height: 120,
        width: (MediaQuery.of(context).size.width),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Steve Rogers"),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    "10000 Rs",
                    style: TextStyle(fontSize: 17),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white24,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    child: const Text("Send a Message"),
                    onPressed: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class About extends StatelessWidget {
  final String cause;
  const About({Key? key, required this.cause}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 170,
      width: (MediaQuery.of(context).size.width),
      color: Colors.white,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              Text(cause)
            ],
          ),
        ),
      ),
    );
  }
}

class Vision extends StatelessWidget {
  final String vision;
  const Vision({required this.vision, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 170,
      width: (MediaQuery.of(context).size.width),
      color: Colors.white,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Vision",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              Text(vision)
            ],
          ),
        ),
      ),
    );
  }
}
