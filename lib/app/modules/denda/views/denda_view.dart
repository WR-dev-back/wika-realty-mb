import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wr_project/app/utils/constant/style/app_color.dart';

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
        backgroundColor: AppColor.primary,
        title: Text(
          "Denda",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: controller.refreshData,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.builder(
            itemCount: dendaList.length,
            itemBuilder: (BuildContext context, int index) {
              Denda denda = dendaList[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ListTile(
                    title: Text(
                      denda.name,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      denda.description,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                      ),
                    ),
                    trailing: Text(
                      'Rp.${denda.amount}',
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    onTap: () {
                      print('Tapped on ${denda.name}');
                    },
                  ),
                ),
              );
            },
          ),
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
