import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../provider/notification_provider.dart';

class NotificationsController extends GetxController {
  final NotificationProvider notificationProvider = Get.find();

  RxString selectedValue = ''.obs;
  RxBool isBreakdown = false.obs;

  RxString costProfitCenterId = ''.obs;

  var functionalLocations = <String>[].obs;
  var equipments = <String>[].obs;
  var groupCauses = <String>[].obs;
  var groupProblems = <String>[].obs;

  var isLoading = false.obs;

  var pageMap = <String, int>{}.obs;
  var hasMoreDataMap = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeMaps();

    String? storedId = GetStorage().read('costProfitCenterId');
    costProfitCenterId.value = storedId ?? '';
  }

  void _initializeMaps() {
    pageMap['Functional Location'] = 1;
    pageMap['Equipment'] = 1;
    pageMap['Group Cause'] = 1;
    pageMap['Group Problem'] = 1;

    hasMoreDataMap['Functional Location'] = true;
    hasMoreDataMap['Equipment'] = true;
    hasMoreDataMap['Group Cause'] = true;
    hasMoreDataMap['Group Problem'] = true;
  }

  void resetAll() {
    _initializeMaps(); // Reset page numbers
    functionalLocations.clear();
    equipments.clear();
    groupCauses.clear();
    groupProblems.clear();
  }

  Future<void> fetchData(String fieldType) async {
    if (isLoading.value || !hasMoreDataMap[fieldType]!) return;
    isLoading.value = true;
    try {
      final response =
          await _fetchApiDataByFieldType(fieldType, page: pageMap[fieldType]!);
      print('Fetching data for $fieldType - Page ${pageMap[fieldType]}');

      if (response.statusCode == 200) {
        final newLocations = (response.body['data'] as List)
            .map((location) => location['name'].toString())
            .toList();

        print('Data fetched for $fieldType: $newLocations');

        // If newLocations is empty or contains only one item, stop further loading
        if (newLocations.isEmpty || newLocations.length == 1) {
          hasMoreDataMap[fieldType] = false; // No more data to load
        }

        // Update the correct list based on fieldType
        if (pageMap[fieldType] == 1) {
          _updateLocationsList(fieldType, newLocations, clear: true);
        } else {
          _updateLocationsList(fieldType, newLocations);
        }
      } else {
        print('Request failed: ${response.statusCode}');
        hasMoreDataMap[fieldType] = false; // Stop loading if there's an error
      }
    } catch (error) {
      print('Error fetching data: $error');
      hasMoreDataMap[fieldType] = false; // Stop loading if an error occurs
    } finally {
      isLoading.value = false;
    }
  }

  void _updateLocationsList(String fieldType, List<String> newLocations,
      {bool clear = false}) {
    switch (fieldType) {
      case "Functional Location":
        if (clear) {
          functionalLocations.value = newLocations;
        } else {
          functionalLocations.addAll(newLocations);
        }
        break;
      case "Equipment":
        if (clear) {
          equipments.value = newLocations;
        } else {
          equipments.addAll(newLocations);
        }
        break;
      case "Group Cause":
        if (clear) {
          groupCauses.value = newLocations;
        } else {
          groupCauses.addAll(newLocations);
        }
        break;
      case "Group Problem":
        if (clear) {
          groupProblems.value = newLocations;
        } else {
          groupProblems.addAll(newLocations);
        }
        break;
    }
  }

  Future<Response> _fetchApiDataByFieldType(String fieldType, {int page = 1}) {
    switch (fieldType) {
      case "Functional Location":
        return notificationProvider.fetchLocations(
          page: page,
          costProfitCenterId: costProfitCenterId.value,
        );
      case "Equipment":
        return notificationProvider.fetchEquipment(page: page);
      case "Group Cause":
        return notificationProvider.fetchGroupCause(page: page);
      case "Group Problem":
        return notificationProvider.fetchGroupProblem(page: page);
      default:
        throw Exception("Unknown field type");
    }
  }

  void loadMoreData(String fieldType) {
    if (selectedValue.value == fieldType &&
        hasMoreDataMap[fieldType]! &&
        !isLoading.value) {
      pageMap[fieldType] = pageMap[fieldType]! + 1;
      fetchData(fieldType);
    }
  }

  void handleFieldTypeChange(String newFieldType) {
    if (selectedValue.value != newFieldType) {
      resetAll(); // Reset all data and page numbers
      selectedValue.value = newFieldType;
      fetchData(newFieldType);
    }
  }
}
