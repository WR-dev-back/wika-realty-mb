import 'package:flutter/material.dart';
import 'package:wr_project/app/modules/leads/detail_leads/controllers/detail_leads_controller.dart';

import '../../../../common/model/leads.dart';

class EditDetailLeads extends StatefulWidget {
  final Datum leads;
  final DetailLeadsController controller;

  const EditDetailLeads(
      {Key? key, required this.leads, required this.controller})
      : super(key: key);

  @override
  _EditDetailLeadsState createState() => _EditDetailLeadsState();
}

class _EditDetailLeadsState extends State<EditDetailLeads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Leads"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: widget.controller.fullNameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: widget.controller.emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: widget.controller.phoneNumController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              controller: widget.controller.sumDController,
              decoration: InputDecoration(labelText: 'Sumber Digital'),
            ),
            TextField(
              controller: widget.controller.sumOfController,
              decoration: InputDecoration(labelText: 'Sumber Offline'),
            ),
            TextField(
              controller: widget.controller.lokController,
              decoration: InputDecoration(labelText: 'Lokasi'),
            ),
            TextField(
              controller: widget.controller.npwpController,
              decoration: InputDecoration(labelText: 'Npwp'),
            ),
            TextField(
              controller: widget.controller.cityController,
              decoration: InputDecoration(labelText: 'City'),
            ),
            TextField(
              controller: widget.controller.typeController,
              decoration: InputDecoration(labelText: 'Type'),
            ),
            TextField(
              controller: widget.controller.areaController,
              decoration: InputDecoration(labelText: 'Area'),
            ),
            TextField(
              controller: widget.controller.omzetController,
              decoration: InputDecoration(labelText: 'Omzet'),
            ),
            // Add input fields for other lead properties
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
