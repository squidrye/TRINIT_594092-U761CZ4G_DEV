import 'package:flutter/material.dart';
import 'package:we_care/model/Campaign.dart';
import 'package:we_care/presentation/DashBoard.dart';
import 'package:we_care/presentation/widget/CommonWidgets.dart';
import 'package:we_care/service/db.dart';

class Details extends StatelessWidget {
  static const route = "/Details";
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double w = MediaQuery(data: data, child: child)
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    debugPrint("ARGS $args");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          // onPressed: () => Navigator.of(context).pop(),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoard()));
          },
        ),
        title: const Text("Details Screen"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder<Campaign?>(
          future: getCampaignById(campaignId: args['id']!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child:buildDetailsScreen(context,snapshot.data!),
            );
          },
        ),
      ),
    );
  }

  Padding buildDetailsScreen(BuildContext context,Campaign campaign) {
    debugPrint("DETAILED CAMPAIGN $campaign");
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        XDetails(title: campaign.title, description:campaign.description),
        const SizedBox(
          height: 10,
        ),
        buildRaiseGoalCard(campaign.category,campaign.targetAmount,campaign.currency),
        const SizedBox(
          height: 10,
        ),
        XButton(onPressed: () {}, alter: false, width: 250, height: 50, text: "Donate Fund"),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 80,
          width: (MediaQuery.of(context).size.width),
          color: Colors.white,
          child: const Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              "Campaign Backed By Following investors : ",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Investor(title: "title"),
        const SizedBox(
          height: 10,
        ),
        Investor(title: "title"),
        const SizedBox(
          height: 10,
        ),
        Investor(title: "title"),
        const SizedBox(
          height: 30,
        ),
         About(cause:campaign.about),
        const SizedBox(
          height: 10,
        ),
         Vision(vision:campaign.vision),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }

  Card buildRaiseGoalCard(String category,String amount,String currency) {
    return Card(
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
              XButton(onPressed: () {}, alter: true, width: 100, height: 20, text: category),
              Text("$amount $currency"),
            ],
          ),
        ],
      ),
    );
  }
}
