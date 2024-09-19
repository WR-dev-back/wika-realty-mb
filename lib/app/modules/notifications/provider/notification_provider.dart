import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../utils/constant/data/api.dart';

class NotificationProvider extends GetConnect {
  final GetStorage storage = GetStorage();

  Future<Response> fetchLocations({
    int page = 1,
    int limit = 25,
    required String costProfitCenterId,
  }) async {
    costProfitCenterId = costProfitCenterId.replaceAll('"', '');

    final String endpoint = ApiEndPoints.notification.getLocation;
    final Map<String, String> queryParameters = {
      'costProfitCenterId': costProfitCenterId,
      'orderBy': 'ASC',
      'page': '$page',
      'limit': '$limit',
    };
    final response =
        await getApiData(endpoint, queryParameters: queryParameters);

    return response;
  }

  Future<Response> fetchGroupCause({
    int page = 1,
    int limit = 25,
  }) async {
    final String endpoint = ApiEndPoints.notification.getGroupCause;
    final Map<String, String> queryParameters = {
      'orderBy': 'ASC',
      'page': '$page',
      'limit': '$limit',
    };
    final response =
        await getApiData(endpoint, queryParameters: queryParameters);
    return response;
  }

  Future<Response> fetchEquipment({
    int page = 1,
    int limit = 25,
  }) async {
    final String endpoint = ApiEndPoints.notification.getEquipment;
    final Map<String, String> queryParameters = {
      'orderBy': 'ASC',
      'page': '$page',
      'limit': '$limit',
    };
    final response =
        await getApiData(endpoint, queryParameters: queryParameters);
    return response;
  }

  Future<Response> fetchGroupProblem({
    int page = 1,
    int limit = 25,
  }) async {
    final String endpoint = ApiEndPoints.notification.getGroupProblem;
    final Map<String, String> queryParameters = {
      'orderBy': 'ASC',
      'page': '$page',
      'limit': '$limit',
    };
    final response =
        await getApiData(endpoint, queryParameters: queryParameters);
    return response;
  }

  Future<Response> getApiData(String endpoint,
      {int page = 1,
      int limit = 25,
      Map<String, String>? queryParameters}) async {
    final apiUrl = '${ApiEndPoints.baseUrl}$endpoint';
    final String? token = storage.read('token');

    if (token == null) {
      return Response(statusCode: 401, statusText: 'Unauthorized');
    }

    try {
      final uri = Uri.parse(apiUrl).replace(queryParameters: queryParameters);
      print('Full URL: $uri'); // Log the full request URL
      final response = await get(
        uri.toString(),
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
