import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/denda_controller.dart';

class DendaView extends GetView<DendaController> {
  DendaView({Key? key}) : super(key: key);

  final List<Denda> dendaList = [
    Denda(
      name: "Denda 1",
      description: "Description of Denda 1",
      amount: 5000,
    ),
    Denda(
      name: "Denda 2",
      description: "Description of Denda 2",
      amount: 70000,
    ),
    Denda(
      name: "Denda 3",
      description: "Description of Denda 3",
      amount: 100000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Denda'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: controller.refreshData,
        child: ListView.builder(
          itemCount: dendaList.length,
          itemBuilder: (BuildContext context, int index) {
            Denda denda = dendaList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.grey,
                  shadows: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(denda.name),
                  subtitle: Text(denda.description),
                  trailing: Text('Rp.${denda.amount}'),
                  onTap: () {
                    print('Tapped on ${denda.name}');
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Denda {
  final String name;
  final String description;
  final double amount;

  Denda({required this.name, required this.description, required this.amount});
}
