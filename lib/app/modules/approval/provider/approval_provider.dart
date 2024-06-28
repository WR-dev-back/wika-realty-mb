import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wr_project/app/common/models/approval.dart';

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

          _approval = leadsData.data;
          _filteredApproval.addAll(_approval);
          return _approval;
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

  Future<List<Datum>> searchApproval(String query) async {
    var apiUrl = ApiEndPoints.baseUrl +
        ApiEndPoints.getDataApproval.dataApproval +
        // '&searchBy=$searchType' +
        '&search=$query';

    print(apiUrl);

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

          _filteredApproval.value = approvalData.data;

          return approvalData.data;
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
}
