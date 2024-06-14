import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../common/models/leads.dart';
import '../../../utils/constant/data/api.dart';

class LeadsProvider extends GetConnect {
  RxList<Datum> filteredLeads = <Datum>[].obs;
  late List<Datum> _leads = [];
  late RxList<Datum> _filteredLeads = RxList<Datum>();
  final GetStorage storage = GetStorage();

  Future<List<Datum>> fetchDataLeads({int page = 1, int limit = 25}) async {
    var apiUrl = ApiEndPoints.baseUrl +
        ApiEndPoints.getDataLeads.dataLeads +
        'page=${page}&limit=${limit}';

    try {
      final String? token = storage.read('token');
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
      final String? token = storage.read('token');
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

  Future<bool> checkDuplicate({
    required String npwp,
    required String phone,
    required String email,
  }) async {
    final apiUrl =
        '${ApiEndPoints.baseUrl}${ApiEndPoints.checkLeads.checkDuplicate}?npwp=$npwp&phone=$phone&email=$email';

    final data = {
      'npwp': npwp,
      'phone': phone,
      'email': email,
    };

    try {
      final String? token = storage.read('token');
      if (token != null) {
        var response = await put(
          apiUrl,
          data,
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json', // Set content type
          },
        );

        if (response.statusCode == 200) {
          print('Response body type: ${response.body.runtimeType}');
          print('Response body: ${response.body}');

          // Ensure response body is correctly parsed as a Map
          final Map<String, dynamic> responseBody =
              response.body as Map<String, dynamic>;

          final bool isDuplicate = responseBody['status'] ?? true;

          print(isDuplicate);

          if (isDuplicate) {
            // Continue with post if status is true
            return false;
          } else {
            // Do not continue with post if status is false
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
    required String omzet,
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

        final String? token = storage.read('token');

        if (token != null) {
          var response = await post(
            url,
            jsonEncode(data),
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
          );

          print(response.body);

          if (response.statusCode == 201) {
            // Handle successful response
            print('Data successfully sent');
            Get.snackbar('Succes', 'Succes Post Data');
          } else {
            // Handle error response
            print('Error: ${response.statusCode}');
            Get.snackbar('Error', 'Failed to Post data');
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
