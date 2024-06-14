import 'package:get/get.dart';
import '../../../common/models/approval.dart';
import '../provider/approval_provider.dart';

class ApprovalController extends GetxController {
  final ApprovalProvider approvalProvider = Get.find();
  var isFetching = false.obs;
  var approvals = <Approval>[].obs;
  var flatApprovals = <Approval>[].obs;
  var filteredApprovals = <Approval>[].obs;
  var hasError = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchApproval();
  }

  Future<void> fetchApproval() async {
    try {
      isFetching(true);
      hasError(false);
      final response = await approvalProvider.getApproval();
      if (response.statusCode == 200) {
        final List<dynamic> responseData =
            response.body['data']; // No need to decode again
        approvals.value =
            responseData.map((e) => Approval.fromJson(e)).toList();
        flatApprovals.value = approvals.toList();
        filteredApprovals.value = flatApprovals;
      } else {
        print('Failed to load approvals: ${response.statusCode}');
      }
    } catch (error) {
      hasError(true);
      print('Error fetching data: $error');
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

  void searchApproval(String query) {
    if (query.isEmpty) {
      filteredApprovals.value = flatApprovals;
    } else {
      filteredApprovals.value = flatApprovals
          .where((approval) =>
              approval.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
