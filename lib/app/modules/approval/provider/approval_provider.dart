import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wr_project/app/common/models/approval.dart';
import 'package:wr_project/app/routes/app_pages.dart'; // Import your app pages/routes

import '../../../utils/constant/data/api.dart';

class ApprovalProvider extends GetConnect {
  final GetStorage storage = GetStorage();
  late List<Datum> _approval = [];
  late RxList<Datum> _filteredApproval = RxList<Datum>();

  Future<List<Datum>> getApproval({int page = 1, int limit = 25}) async {
    var apiUrl =
        ApiEndPoints.baseUrl + ApiEndPoints.getDataApproval.dataApproval;

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
          // Debugging line

          final Map<String, dynamic> responseData = jsonDecode(responseBody!);
          final leadsData = Approval.fromJson(responseData);

          _approval = leadsData.data!;
          _filteredApproval.addAll(_approval);
          return _approval;
        } else if (response.statusCode == 401) {
          // Redirect to login page
          Get.toNamed(Routes.LOGIN);
          return [];
        } else {
          print('Request failed: ${response.statusCode}');
          return [];
        }
      } else {
        print('Token not found');
        Get.toNamed(Routes.LOGIN);
        return [];
      }
    } catch (error) {
      print('Error fetching data: $error');
      return [];
    }
  }

  Future<List<Datum>?> searchApproval(String query) async {
    var apiUrl = ApiEndPoints.baseUrl +
        ApiEndPoints.getDataApproval.dataApproval +
        // '&searchBy=$searchType' +
        '&search=$query';

    // print(apiUrl);

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

          Approval approvalData = approvalFromJson(response.bodyString!);

          _filteredApproval.value = approvalData.data!;

          return approvalData.data;
        } else if (response.statusCode == 401) {
          // Redirect to login page
          Get.toNamed(Routes.LOGIN);
          return [];
        } else {
          print('Failed to search data: ${response.statusCode}');
          return [];
        }
      } else {
        print('Token not found');
        Get.toNamed(Routes.LOGIN);
        return [];
      }
    } catch (e) {
      print('Error searching data: $e');
      return [];
    }
  }

  Future<Response> submitNegotiation(String propertyId, int value) async {
    var apiUrl = ApiEndPoints.baseUrl + ApiEndPoints.nego.nego;

    final String? token = storage.read('token');

    final body = jsonEncode({
      'propertyId': propertyId,
      'value': value,
    });

    if (token == null) {
      Get.toNamed(Routes.LOGIN);
      return Response(statusCode: 401, statusText: 'Unauthorized');
    }

    try {
      final response = await put(
        apiUrl,
        body,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 401) {
        // Redirect to login page
        Get.toNamed(Routes.LOGIN);
      }
      return response;
    } catch (error) {
      return Response(statusCode: 500, statusText: 'Error: $error');
    }
  }
}
