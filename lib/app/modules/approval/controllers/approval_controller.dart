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
      isFetching.value = true;
      hasError.value = false;
      final Response response = await approvalProvider.getApproval();
      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.body['data'];
        final List<Approval> approvalList =
            responseData.map((dynamic e) => Approval.fromJson(e)).toList();
        approvals.value = approvalList;
        flatApprovals.value = approvalList.toList();
        filteredApprovals.value = flatApprovals;
      } else {
        print('Failed to load approvals: ${response.statusCode}');
      }
    } catch (error) {
      hasError.value = true;
      print('Error fetching data: $error');
    } finally {
      isFetching.value = false;
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
