import 'package:get/get.dart';
import '../../../common/models/approval.dart';
import '../provider/approval_provider.dart';

class ApprovalController extends GetxController {
  final ApprovalProvider approvalProvider = Get.find();
  var isFetching = false.obs;
  var selectedStatus = ''.obs;
  var selectedfilterBy = ''.obs;
  var isSearching = false.obs;
  var filteredApprovals = List<Datum>.empty().obs;
  var hasError = false.obs;
  var currentPage = 1.obs;
  var totalPages = 1.obs;
  var searchText = ''.obs;

  void status(String status) {
    selectedStatus.value = status;
  }

  void filterBy(String filterBy) {
    selectedfilterBy.value = filterBy;
  }

  void clearSearch() {
    // Clear the search text
    searchText.value = '';

    // Reset the search state to false
    isSearching.value = false;

    // Perform any additional actions needed after clearing the search
    // For example, you might want to refresh the list or data
    refreshData(); // Implement this method if needed
  }

  @override
  void onInit() {
    super.onInit();
    fetchApproval();
  }

  Future<void> submitNegotiation(
    String propertyId,
    int value,
  ) async {
    final response =
        await approvalProvider.submitNegotiation(propertyId, value);
    if (response.statusCode == 200) {
      // Handle success
      Get.snackbar('Success', 'Negotiation submitted successfully');
      print('Negotiation submitted successfully');
    } else {
      // Handle error
      Get.snackbar('Error', 'Failed to submit negotiation');
      print('Failed to submit negotiation: ${response.statusText}');
    }
  }

  Future<void> fetchApproval() async {
    try {
      isFetching(true);
      hasError(false);

      // Build the query parameters as a map
      Map<String, String> queryParams = {};

      if (selectedStatus.isNotEmpty) {
        queryParams['status'] = selectedStatus.value;
      }

      if (selectedfilterBy.isNotEmpty) {
        queryParams['filterBy'] = selectedfilterBy.value;
      }

      queryParams['orderBy'] = 'DSC';
      queryParams['page'] = '1';
      queryParams['limit'] = '25';

      // Call the provider with the constructed URL
      final response = await approvalProvider.getApproval(queryParams);

      filteredApprovals.value = response;
      currentPage.value = 1;
      totalPages.value = (response.length / 25).ceil();
    } catch (error) {
      hasError(true);
      print('Error fetching data: $error');
    } finally {
      isFetching(false);
    }
  }

  Future<void> refreshData() async {
    await fetchApproval(); // Simply call fetchApproval to refresh with current filters
  }

  Future<void> searchApproval(String query) async {
    try {
      filteredApprovals.value = (await approvalProvider.searchApproval(query))!;
    } catch (error) {
      print('Error searching data: $error');
    }
  }
}
