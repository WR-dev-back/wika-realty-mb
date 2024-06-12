import 'dart:convert';
import 'package:get/get_connect.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wr_project/app/common/models/leads.dart';
import 'package:wr_project/app/utils/constant/data/api.dart';

class EditDetailLeadsProvider extends GetConnect {
  final GetStorage storage = GetStorage();

  Future<Response> updateLeadsData(String leadId, Datum leads) async {
    final apiUrl =
        ApiEndPoints.baseUrl + ApiEndPoints.puteditLeads.editLeads + leadId;

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
