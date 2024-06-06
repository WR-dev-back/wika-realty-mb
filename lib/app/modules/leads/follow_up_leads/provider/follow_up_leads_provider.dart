import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../../../utils/constant/data/api.dart';

class FollowUpLeadsProvider extends GetConnect {
  // Method to fetch follow-up data
  Future<Response> getFollowUpData() async {
    final apiUrl = ApiEndPoints.baseUrl + ApiEndPoints.getDataLeads.dataLeads;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    if (token == null) {
      return Response(statusCode: 401, statusText: 'Unauthorized');
    }

    try {
      final response = await get(
        apiUrl,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      return response;
    } catch (error) {
      return Response(statusCode: 500, statusText: 'Error: $error');
    }
  }

  // Method to update follow-up data
  Future<Response> updateFollowUp(
      String leadId, Map<String, dynamic> body) async {
    final apiUrl =
        ApiEndPoints.baseUrl + ApiEndPoints.followUpLeads.follow + leadId;

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');

      if (token == null) {
        return Response(statusCode: 401, statusText: 'Unauthorized');
      }

      final response = await post(
        apiUrl,
        jsonEncode(body),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      return response;
    } catch (error) {
      return Response(statusCode: 500, statusText: 'Error: $error');
    }
  }
}
