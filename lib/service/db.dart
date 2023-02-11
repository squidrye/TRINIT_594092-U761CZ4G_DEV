import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

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
