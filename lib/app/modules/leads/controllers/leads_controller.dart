import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/leads_view.dart';

class LeadsController extends GetxController {
  var leads = <Leads>[].obs;

  final List<Leads> originalLeadsList = [
    Leads(
      name: "Pak Didik",
      description: "L00000005648",
      amount: "08566545456",
    ),
    Leads(
      name: "Kevin",
      description: "L00000005678",
      amount: "08164864848",
    ),
    Leads(
      name: "Dawam",
      description: "L00000005789",
      amount: "085608783675",
    ),
  ];

  @override
  void onInit() {
    leads.assignAll(originalLeadsList);
    super.onInit();
  }

  void searchLeads(String query) {
    if (query.isEmpty) {
      leads.assignAll(originalLeadsList);
    } else {
      final filteredLeads = originalLeadsList
          .where((lead) =>
              lead.name.toLowerCase().contains(query.toLowerCase()) ||
              lead.description.toLowerCase().contains(query.toLowerCase()) ||
              lead.amount.toLowerCase().contains(query.toLowerCase()))
          .toList();

      leads.assignAll(filteredLeads);
    }
  }

  TextEditingController sumD = TextEditingController();
  TextEditingController sumOf = TextEditingController();
  TextEditingController lok = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNum = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController npwpC = TextEditingController();
  TextEditingController cityC = TextEditingController();
  TextEditingController salesF = TextEditingController();
  TextEditingController ppuC = TextEditingController();

  var isRefreshing = false.obs;

  Future<void> refreshData() async {
    isRefreshing(true);

    await Future.delayed(Duration(seconds: 2));

    isRefreshing(false);
  }
}
