import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/model/leads.dart';
import '../../../utils/constant/data/api.dart';

class LeadsProvider extends GetConnect {
  RxList<Datum> filteredLeads = <Datum>[].obs;
  late List<Datum> _leads = [];
  late RxList<Datum> _filteredLeads = RxList<Datum>();

  Future<List<Datum>> fetchDataLeads() async {
    var apiUrl = ApiEndPoints.baseUrl + ApiEndPoints.getDataLeads.dataLeads;

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      if (token != null) {
        final response = await http.get(
          Uri.parse(apiUrl),
          headers: {
            'Authorization': 'Bearer $token',
          },
        );

        if (response.statusCode == 200) {
          final responseBody = response.body;
          print('Response Body: $responseBody'); // Debugging line

          final Map<String, dynamic> responseData = jsonDecode(responseBody);
          final leadsData = Leads.fromJson(responseData);

          // Assuming _leads and _filteredLeads are defined elsewhere
          _leads = leadsData.data;
          _filteredLeads.addAll(_leads);
          return _leads;
        } else {
          print('Request failed: ${response.statusCode}');
          return [];
        }
      } else {
        print('Token not found');
        return [];
      }
    } catch (error) {
      print('Error fetching data: $error');
      return [];
    }
  }

  Future<List<Datum>> searchLeads(String query) async {
    var apiUrl = Uri.parse(ApiEndPoints.baseUrl +
        ApiEndPoints.getDataLeads.dataLeads +
        '&search=$query');

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      if (token != null) {
        var response = await http.get(
          apiUrl,
          headers: {
            'Authorization': 'Bearer $token',
          },
        );

        if (response.statusCode == 200) {
          print('Response Body: ${response.body}'); // Debugging line

          Leads leadsData = leadsFromJson(response.body);

          // Assuming filteredLeads is a reactive variable or a state management variable
          filteredLeads.value = leadsData.data;

          return leadsData.data;
        } else {
          print('Failed to search data: ${response.statusCode}');
          return [];
        }
      } else {
        print('Token not found');
        return [];
      }
    } catch (e) {
      print('Error searching data: $e');
      return [];
    }
  }

  Future<String?> _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> postDataToBackend({
    required String email,
    required String fullName,
    required String phoneNumber,
    required String digitalSource,
    required String offlineSource,
    required String locationOffline,
    required String npwp,
    required String city,
    required String type,
    required int area,
    required int omzet,
  }) async {
    var url = '${ApiEndPoints.baseUrl}${ApiEndPoints.postDataLeads.postLeads}';
    var data = {
      'email': email,
      'full_name': fullName,
      'phone_number': phoneNumber,
      'digital_source': digitalSource,
      'offline_source': offlineSource,
      'location_offline': locationOffline,
      'npwp': npwp,
      'city': city,
      'type': type,
      'area': area,
      'omzet': omzet,
    };

    try {
      final token = await _getToken();

      if (token != null) {
        var response =
            await post(url, data, headers: {'Authorization': 'Bearer $token'});

        if (response.statusCode == 201) {
          // Handle successful response
          print('Data successfully sent');
        } else {
          // Handle error response
          print('Error: ${response.body}');
        }
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
