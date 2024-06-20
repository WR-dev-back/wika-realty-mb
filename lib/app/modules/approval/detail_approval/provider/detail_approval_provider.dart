import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../utils/constant/data/api.dart';

class DetailApprovalProvider extends GetConnect {
  final GetStorage storage = GetStorage();

  Future<Response> approve(approvalId) async {
    final apiUrl =
        '${ApiEndPoints.baseUrl}${ApiEndPoints.getDataApprova.dataApprova}$approvalId/approve';

    final String? token = storage.read('token');

    if (token == null) {
      return Response(statusCode: 401, statusText: 'Unauthorized');
    }

    try {
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

  Future<Response> reject(approvalId) async {
    final apiUrl =
        '${ApiEndPoints.baseUrl}${ApiEndPoints.getDataApprova.dataApprova}$approvalId/reject';

    print(apiUrl);

    final String? token = storage.read('token');

    if (token == null) {
      return Response(statusCode: 401, statusText: 'Unauthorized');
    }

    try {
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
