import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:we_care/model/Campaign.dart';

Dio dio = Dio();
Future<void> sendUserInformation(
    {required String name, required String userId, required List<String> categories}) async {
  try {
    dio.post("http://localhost:3000/users/register", data: {'id': userId, 'categories': categories, 'name': name});
  } on DioError {
    debugPrint("dioerror");
  } catch (e) {
    debugPrint(e.toString());
  }
}

Future<void> sendNGOInformation(
    {required String name,
    required String userId,
    required String cause,
    required String vision,
    required String impact}) async {
  try {
    dio.post("http://localhost:3000/ngos/register", data: {
      'name': name,
      'cause': cause,
      'vision': vision,
      'impact': impact,
      'ownerUserId': userId,
    });
  } on DioError {
    debugPrint("dioerror");
  } catch (e) {
    debugPrint(e.toString());
  }
}

Future<String> getLoggedUser() async {
  return FirebaseAuth.instance.currentUser!.uid;
}

Future<void> startCampaign(
    {required String title,
    required String creatorId,
    required String category,
    required String description,
    required String targetAmount,
    required String country,
    required DateTime startDate,
    required DateTime endDate,
    required String currency}) async {
  try {
    dio.post("http://localhost:3000/campaigns/register", data: {
      'title': title,
      'category': category,
      'description': description,
      'targetAmount': targetAmount,
      'country': country,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'currency': currency,
      'creatorId': creatorId
    });
  } on DioError {
    debugPrint("dioerror");
  } catch (e) {
    debugPrint(e.toString());
  }
}

Future<List<Campaign>?> getAllCampaigns() async {
  try {
    var id = await getLoggedUser();
    var response = await dio.get("http://localhost:3000/campaigns?loggedUserId=${id}");
    List<Campaign>? allCampaigns = getListCampaignsResponse(response);
    debugPrint(allCampaigns!.toString());
    return allCampaigns;
  } on DioError {
    debugPrint("dioerror");
  } catch (e) {
    debugPrint(e.toString());
  }
}

Future<List<Campaign>?> searchCampaignsByCategory({required String category}) async {
  try {
    var response = await dio.get("http://localhost:3000/campaigns/search?category=${category}");
    // debugPrint(response.data);
    List<Campaign>? allCampaigns = getListCampaignsResponse(response);
    return allCampaigns;
  } on DioError {
    debugPrint("dioerror");
  } catch (e) {
    debugPrint(e.toString());
  }
}

List<Campaign>? getListCampaignsResponse(var response) {
  List<dynamic> l1 = response.data;
  debugPrint(response.data.toString());
  List<Campaign> allCampaigns = l1.map((campaignJson) {
    debugPrint("CAMPAIGN IS ${campaignJson["creatorId"]}");
    return Campaign(
        about: campaignJson['cause'],
        vision: campaignJson['vision'],
        title: campaignJson["title"], //
        category: campaignJson["category"], //
        targetAmount: campaignJson["targetAmount"], //
        startDate: DateTime.now(), //
        description: campaignJson["description"], //
        endDate: DateTime.now(), //
        country: campaignJson["country"], //
        currency: campaignJson["currency"], //
        id: campaignJson["id"], //
        creatorId: 'rem');
  }).toList();
  return allCampaigns;
}

Future<Campaign?> getCampaignById({required String campaignId}) async {
  try {
    var response = await dio.get("http://localhost:3000/campaigns/getCampaignById?campaignId=${campaignId}");
    var campaignJson = response.data;

    debugPrint("Campaign DATA ${campaignJson.toString()}");
    Campaign campaign = Campaign(

        about: campaignJson['cause'],
        vision: campaignJson['vision'],
        title: campaignJson["title"],
        category: campaignJson["category"],
        targetAmount: campaignJson["targetAmount"],
        startDate: DateTime.now(),
        description: campaignJson["description"],
        endDate: DateTime.now(),
        country: campaignJson["country"],
        currency: campaignJson["currency"],
        id: campaignId,
        creatorId: '34');

    return campaign;
  } on DioError {
    debugPrint("dioerror");
  } catch (e) {
    debugPrint(e.toString());
  }
}
