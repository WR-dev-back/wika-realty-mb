import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../utils/constant/data/api.dart';

class ApprovalProvider extends GetConnect {
  Future<Response> getApproval() async {
    final apiUrl =
        ApiEndPoints.baseUrl + ApiEndPoints.getDataApproval.dataApproval;

    try {
      final GetStorage storage = GetStorage();
      final String? token = storage.read('token');

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
