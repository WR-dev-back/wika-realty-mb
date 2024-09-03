import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../utils/constant/data/api.dart';

class NotificationProvider extends GetConnect {
  final GetStorage storage = GetStorage();

  Future<Response> fetchLocations({int page = 1, int limit = 25}) async {
    return getApiData(ApiEndPoints.notification.getNotification,
        page: page, limit: limit);
  }

  Future<Response> fetchGroupCause({int page = 1, int limit = 25}) async {
    return getApiData(ApiEndPoints.notification.getGroupCause,
        page: page, limit: limit);
  }

  Future<Response> fetchEquipment({int page = 1, int limit = 25}) async {
    return getApiData(ApiEndPoints.notification.getEquipment,
        page: page, limit: limit);
  }

  Future<Response> fetchGroupProblem({int page = 1, int limit = 25}) async {
    return getApiData(ApiEndPoints.notification.getGroupProblem,
        page: page, limit: limit);
  }

  Future<Response> getApiData(String endpoint,
      {int page = 1, int limit = 25}) async {
    final apiUrl = '${ApiEndPoints.baseUrl}$endpoint&page=$page&limit=$limit';
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
