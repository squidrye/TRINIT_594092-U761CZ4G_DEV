import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_care/presentation/widget/CommonWidgets.dart';

import '../model/Campaign.dart';
import '../service/db.dart';
import 'CampaignForm.dart';

class DashBoard extends StatefulWidget {
  static const route = "/DashBoard";
  DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String dropDownValue = 'All Categories';
  TextEditingController _controller = TextEditingController();
  late bool val;
  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      val = value.getBool("ngo")!;
    });
  }

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
          body: Container(
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        width: 320,
                        child: InkWell(
                          onTap: () async {
                            await showSearch(context: context, delegate: CustomSearchDelegate());
                          },
                          child: Card(
                            child: TextField(
                              controller: _controller,
                              enabled: false,
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                hintText: "Search Campaigns",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    PopupMenuButton<String>(onSelected: (value) {
                      setState(() {
                        dropDownValue = value;
                      });
                    }, itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: const Text("All Categories"),
                          value: 'All Categories',
                          onTap: () {
                            setState(() {
                              dropDownValue = "All Categories";
                            });
                          },
                        ),
                        PopupMenuItem(
                            child: const Text("Nature"),
                            value: 'Nature',
                            onTap: () {
                              setState(() {
                                dropDownValue = "Nature";
                              });
                            }),
                        PopupMenuItem(
                            child: const Text("Education"),
                            value: 'Education',
                            onTap: () {
                              setState(() {
                                dropDownValue = "Education";
                              });
                            }),
                        PopupMenuItem(
                          child: const Text("Social"),
                          value: 'Social',
                          onTap: () {
                            setState(
                              () {
                                dropDownValue = "Social";
                              },
                            );
                          },
                        ),
                        PopupMenuItem(
                          child: const Text("War-Relief"),
                          value: 'War-Relief',
                          onTap: () {
                            setState(
                              () {
                                dropDownValue = "War-Relief";
                              },
                            );
                          },
                        ),
                        PopupMenuItem(
                          child: const Text("Animals"),
                          value: 'Animals',
                          onTap: () {
                            setState(
                              () {
                                dropDownValue = "Animals";
                              },
                            );
                          },
                        ),
                      ];
                    })
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, top: 20),
                  child: XTitle(value: "Popular Campaigns"),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: FutureBuilder<List<Campaign>?>(
                    future: dropDownValue == "All Categories"
                        ? getAllCampaigns()
                        : searchCampaignsByCategory(category: dropDownValue),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            debugPrint(snapshot.data.toString());
                            return ShortDetails(
                                campaign: snapshot.data![index], id: snapshot.data![index].id, raised: 3000);
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
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

class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying
  List<String> searchTerms = [];

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Campaign>?>(
      future: searchCampaignsByCategory(category: query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              debugPrint(snapshot.data.toString());
              return ShortDetails(
                campaign: snapshot.data![index],
                raised: 3000,
                id: snapshot.data![index].id,
              );
            },
          );
        }
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Campaign>?>(
      future: searchCampaignsByCategory(category: query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              debugPrint(snapshot.data.toString());
              return ShortDetails(
                campaign: snapshot.data![index],
                raised: 3000,
                id: snapshot.data![index].id,
              );
            },
          );
        }
      },
    );
  }
}
