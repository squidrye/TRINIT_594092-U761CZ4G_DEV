import 'package:dio/dio.dart';
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
