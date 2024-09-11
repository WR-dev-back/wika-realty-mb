import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../utils/constant/data/api.dart';

class BadgeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ApiEndPoints.baseUrl; // Ensure base URL is set
    super.onInit();
  }

  Future<Response> fetchPendingApprovals() async {
    final String endpoint =
        '/api/v1/master-approval/user-approval'; // Endpoint without base URL
    final Map<String, String> queryParameters = {
      'status': 'PENDING',
      'orderBy': 'ASC',
      'page': '1',
      'limit': '25',
    };

    final String? token = GetStorage().read('token');
    if (token == null) {
      print('Token not found');
      return Response(statusCode: 401, statusText: 'Unauthorized');
    }

    return get(
      endpoint,
      query: queryParameters,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
  }
}
