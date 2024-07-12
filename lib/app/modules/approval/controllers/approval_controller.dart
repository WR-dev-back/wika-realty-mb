import 'package:get/get.dart';
import '../../../common/models/approval.dart';
import '../provider/approval_provider.dart';

class ApprovalController extends GetxController {
  final ApprovalProvider approvalProvider = Get.find();
  var isFetching = false.obs;
  var isSearching = false.obs;
  var filteredApprovals = List<Datum>.empty().obs;
  var hasError = false.obs;
  var currentPage = 1.obs;
  var totalPages = 1.obs;

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
      Get.snackbar('Succes', 'Negotiation submitted successfully');
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
      final response = await approvalProvider.getApproval();
      filteredApprovals.value = response;
      currentPage.value = 1;
      totalPages.value = (response.length / 25).ceil();
    } catch (error) {
      hasError(true);
      // print('Error fetching data: $error');
    } finally {
      isFetching(false);
    }
  }

  Future<void> refreshData() async {
    try {
      isFetching(true);
      hasError(false);
      await Future.delayed(Duration(seconds: 3));
      final response = await approvalProvider.getApproval();
      filteredApprovals.value = response;
      currentPage.value = 1;
      totalPages.value = (response.length / 25).ceil();
    } catch (error) {
      hasError(true);
      // print('Error fetching data: $error');
    } finally {
      isFetching(false);
    }
  }

  Future<void> searchApproval(String query) async {
    try {
      filteredApprovals.value = (await approvalProvider.searchApproval(query))!;
    } catch (error) {
      print('Error searching data: $error');
    }
  }
}
