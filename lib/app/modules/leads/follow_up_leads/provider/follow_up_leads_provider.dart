import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../../../utils/constant/data/api.dart';

class FollowUpLeadsProvider extends GetConnect {
  Future<Response> getLeadDetails(String leadId) async {
    final apiUrl =
        ApiEndPoints.baseUrl + ApiEndPoints.getDataLeads.dataLeads + leadId;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return await get(
      apiUrl,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
  }

  Future<Response> fecthData() async {
    final apiUrl = ApiEndPoints.baseUrl + ApiEndPoints.getDataLeads.dataLeads;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return await get(
      apiUrl,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
  }

  Future<Response> updateFollowUp(
      String leadId, Map<String, dynamic> body) async {
    final apiUrl =
        ApiEndPoints.baseUrl + ApiEndPoints.followUpLeads.follow + leadId;

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');

      if (token != null) {
        final response = await post(
          apiUrl,
          jsonEncode(body),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        );
        print(body);
        print(response.body);
        return response;
      } else {
        return Response(statusCode: 401, statusText: 'Unauthorized');
      }
    } catch (error) {
      return Response(statusCode: 500, statusText: 'Error: $error');
    }
  }
}
