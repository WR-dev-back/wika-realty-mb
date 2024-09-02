import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  NotificationsView({Key? key}) : super(key: key);

  final List<String> items = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

  void _showBottomSheet(BuildContext context, String title) {
    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // This allows the bottom sheet to take 70% of the screen height
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.7,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 8.0),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select $title', // Title based on the pressed field
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        // Implement search logic here
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(items[index]),
                      onTap: () {
                        Navigator.pop(context);
                        // Handle item selection
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text('Notifications'),
            Divider(
              color: Colors.blue,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Functional Location Field
              Row(
                children: [
                  const Text(
                    "Functional Loc",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 200,
                    child: GestureDetector(
                      onTap: () {
                        _showBottomSheet(context, "Functional Location");
                      },
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.bookmark_outline),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Equipment Field
              Row(
                children: [
                  const Text(
                    "Equipment",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 200,
                    child: GestureDetector(
                      onTap: () {
                        _showBottomSheet(context, "Equipment");
                      },
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.bookmark_outline),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Group Cause Field
              Row(
                children: [
                  const Text(
                    "Group Cause",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 200,
                    child: GestureDetector(
                      onTap: () {
                        _showBottomSheet(context, "Group Cause");
                      },
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.bookmark_outline),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Group Problem Field
              Row(
                children: [
                  const Text(
                    "Group Problem",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 200,
                    child: GestureDetector(
                      onTap: () {
                        _showBottomSheet(context, "Group Problem");
                      },
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.bookmark_outline),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
