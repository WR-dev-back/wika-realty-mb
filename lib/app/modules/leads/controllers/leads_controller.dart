import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/leads_view.dart';

class LeadsController extends GetxController {
  var leads = <Leads>[].obs;

  // Original list of leads
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
    // Initially, assign the original leads list to the leads observable
    leads.assignAll(originalLeadsList);
    super.onInit();
  }

  // Method to filter leads based on search query
  void searchLeads(String query) {
    if (query.isEmpty) {
      // If query is empty, display all leads
      leads.assignAll(originalLeadsList);
    } else {
      // Filter leads based on query
      final filteredLeads = originalLeadsList
          .where((lead) =>
              lead.name.toLowerCase().contains(query.toLowerCase()) ||
              lead.description.toLowerCase().contains(query.toLowerCase()) ||
              lead.amount.toLowerCase().contains(query.toLowerCase()))
          .toList();
      // Update the leads observable with filtered leads
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
