import 'package:get/get.dart';
import '../../../common/models/approval.dart';
import '../provider/approval_provider.dart';

class ApprovalController extends GetxController {
  final ApprovalProvider approvalProvider = Get.find();
  var isFetching = false.obs;
  var filteredApprovals = List<Datum>.empty().obs;
  var flatApprovals = <Datum>[].obs;
  var hasError = false.obs;
  var currentPage = 1.obs;
  var totalPages = 1.obs;
  var page = 1;

  @override
  void onInit() {
    super.onInit();
    fetchApproval();
  }

  void submitNegotiation(
      String approvalId, String riRecommendation, String riRefund) {
    // Implement the submit logic here
    // Example:
    print('Approval ID: $approvalId');
    print('RI Recommendation: $riRecommendation');
    print('RI Refund: $riRefund');
  }

  Future<void> fetchApproval() async {
    try {
      isFetching(true);
      hasError(false);
      final response = await approvalProvider.getApproval();
      if (page == 1) {
        filteredApprovals.value = response;
      } else {
        filteredApprovals.addAll(response);
      }
      currentPage.value = page;

      totalPages.value = (response.length / 25).ceil();
    } catch (error) {
      hasError(true);
      // print('Error fetching data: $error');
    } finally {
      isFetching(false);
    }
  }

  Future<void> refreshData() async {
    await Future.delayed(
      Duration(seconds: 3),
    );
    await fetchApproval();
  }

  Future<void> searchApproval(String query) async {
    try {
      filteredApprovals.value = (await approvalProvider.searchApproval(query))!;
    } catch (error) {
      print('Error searching data: $error');
    } finally {}
  }
}
