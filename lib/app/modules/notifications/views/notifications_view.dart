import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  NotificationsView({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

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
                    "Functional Location",
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

  void _showBottomSheet(BuildContext context, String fieldType) {
    // Reset page number and clear data for all field types
    controller.resetAll();

    // Fetch data and open the bottom sheet
    controller.fetchData(fieldType).then((_) {
      controller.selectedValue.value =
          fieldType; // Set selected value after data is fetched

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (BuildContext context) {
          _scrollController.addListener(() {
            if (_scrollController.position.pixels ==
                _scrollController.position.maxScrollExtent) {
              controller.loadMoreData(fieldType);
            }
          });

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
                        'Select $fieldType',
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
                          // Implement search logic here if needed
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Obx(() {
                    print(
                        'Building ListView for ${controller.selectedValue.value}');
                    List<String> displayList;
                    switch (fieldType) {
                      case "Functional Location":
                        displayList = controller.functionalLocations;
                        break;
                      case "Equipment":
                        displayList = controller.equipments;
                        break;
                      case "Group Cause":
                        displayList = controller.groupCauses;
                        break;
                      case "Group Problem":
                        displayList = controller.groupProblems;
                        break;
                      default:
                        displayList = [];
                    }
                    return ListView.builder(
                      controller: _scrollController,
                      itemCount: displayList.length +
                          1, // Add 1 for the loading indicator
                      itemBuilder: (context, index) {
                        if (index == displayList.length) {
                          if (controller.hasMoreDataMap[fieldType]!) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          } else {
                            return SizedBox(); // No more data, return empty widget
                          }
                        } else {
                          return ListTile(
                            title: Text(displayList[index]),
                            onTap: () {
                              Navigator.pop(context);
                              // Handle item selection
                            },
                          );
                        }
                      },
                    );
                  }),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
