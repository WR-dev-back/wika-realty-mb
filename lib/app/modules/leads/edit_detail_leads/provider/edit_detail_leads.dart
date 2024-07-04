import 'dart:convert';
import 'package:get/get_connect.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wr_project/app/common/models/leads.dart';
import 'package:wr_project/app/utils/constant/data/api.dart';

class EditDetailLeadsProvider extends GetConnect {
  final GetStorage storage = GetStorage();

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

  Future<Response> updateLeadsData(String leadId, Datum leads) async {
    final apiUrl =
        ApiEndPoints.baseUrl + ApiEndPoints.puteditLeads.editLeads + leadId;

    print(apiUrl);

    try {
      final String? token = storage.read('token');

      if (token != null) {
        final response = await put(
          apiUrl,
          jsonEncode({
            'email': leads.email,
            'full_name': leads.fullName,
            'phone_number': leads.phoneNumber,
            'digital_source': leads.digitalSource,
            'offline_source': leads.offlineSource,
            'location_offline': leads.locationOffline,
            'city': leads.city,
            'type': leads.type,
            'area': leads.area,
            'omzet': leads.omzet,
          }),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        );
        print(response.body);
        return response;
      } else {
        // Handle case where token is null
        throw Exception('Token is null');
      }
    } catch (error) {
      // Handle error if request fails
      throw Exception('Failed to update leads data: $error');
    }
  }
}
