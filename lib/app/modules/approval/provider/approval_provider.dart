import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constant/data/api.dart';

class ApprovalProvider extends GetConnect {
  Future<Response> getApproval() async {
    final apiUrl =
        ApiEndPoints.baseUrl + ApiEndPoints.getDataApproval.dataApproval;

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');

      if (token == null) {
        return Response(statusCode: 401, statusText: 'Unauthorized');
      }

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
}
