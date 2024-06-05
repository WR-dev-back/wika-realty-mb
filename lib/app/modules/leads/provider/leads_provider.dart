import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/model/leads.dart';
import '../../../utils/constant/data/api.dart';

class LeadsProvider extends GetConnect {
  RxList<Datum> filteredLeads = <Datum>[].obs;
  late List<Datum> _leads = [];
  late RxList<Datum> _filteredLeads = RxList<Datum>();

  Future<List<Datum>> fetchDataLeads({int page = 1, int limit = 25}) async {
    var apiUrl = ApiEndPoints.baseUrl +
        ApiEndPoints.getDataLeads.dataLeads +
        'page=${page}&limit=${limit}';

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      if (token != null) {
        final response = await get(
          apiUrl,
          headers: {
            'Authorization': 'Bearer $token',
          },
        );

        if (response.statusCode == 200) {
          final responseBody = response.bodyString;
          print('Response Body: $responseBody'); // Debugging line

          final Map<String, dynamic> responseData = jsonDecode(responseBody!);
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
        var response = await get(
          apiUrl.toString(),
          headers: {
            'Authorization': 'Bearer $token',
          },
        );

        if (response.statusCode == 200) {
          print('Response Body: ${response.bodyString}'); // Debugging line

          Leads leadsData = leadsFromJson(response.bodyString!);

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

  Future<bool> checkDuplicate({
    required String npwp,
    required String phone,
    required String email,
  }) async {
    final apiUrl =
        '${ApiEndPoints.baseUrl}${ApiEndPoints.checkLeads.checkDuplicate}?&npwp=$npwp&phone=$phone$email=$email';
    final data = {
      // Pass parameters in the body
      'npwp': npwp,
      'phone': phone,
      'email': email,
    };

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      if (token != null) {
        var response = await put(
          apiUrl,
          data,
          headers: {
            'Authorization': 'Bearer $token',
          },
        );

        if (response.statusCode == 200) {
          print(response.body);
          final Map<String, dynamic> responseBody =
              response.body as Map<String, dynamic>;
          final bool isDuplicate = responseBody['status'] ?? true;
          final String message = responseBody['message'] ?? '';
          print(isDuplicate);
          if (isDuplicate) {
            // Continue with post if status is true
            return false;
          } else {
            // Do not continue with post if status is false
            // Show alert
            Get.snackbar('Duplicate Found', message,
                snackPosition: SnackPosition.BOTTOM);
            return true;
          }
        } else {
          // Handle other status codes (e.g., 400, 404, etc.) if needed
          throw Exception('Failed to check duplicate: ${response.statusCode}');
        }
      } else {
        // Handle case where token is not available
        throw Exception('Token not found');
      }
    } catch (e) {
      // Handle network errors or exceptions
      throw Exception('Error checking duplicate: $e');
    }
  }

  Future<void> postDataToBackend({
    required String email,
    required String fullName,
    required String phone,
    required String digitalSource,
    required String offlineSource,
    required String locationOffline,
    required String npwp,
    required String city,
    required String type,
    required int area,
    required int omzet,
  }) async {
    try {
      // Check duplicate before posting
      bool isDuplicate = await checkDuplicate(
        email: email,
        phone: phone,
        npwp: npwp,
      );

      if (!isDuplicate) {
        var url =
            '${ApiEndPoints.baseUrl}${ApiEndPoints.postDataLeads.postLeads}';
        var data = {
          'email': email,
          'full_name': fullName,
          'phone_number': phone,
          'digital_source': digitalSource,
          'offline_source': offlineSource,
          'location_offline': locationOffline,
          'npwp': npwp,
          'city': city,
          'type': type,
          'area': area,
          'omzet': omzet,
        };

        final token = await _getToken();

        if (token != null) {
          var response = await post(
            url,
            jsonEncode(data), // Encode data as JSON
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json', // Set Content-Type header
            },
          );

          print(response.body);

          if (response.statusCode == 201) {
            // Handle successful response
            print('Data successfully sent');
          } else {
            // Handle error response
            print('Error: ${response.body}');
          }
        }
      } else {
        // Handle case where duplicate exists
        print('Duplicate entry found, post aborted.');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
