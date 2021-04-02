import 'package:flutter/material.dart';
import 'package:timesheet_app/providers/TimesheetCollection.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatelessWidget {
  var uuid = Uuid();
  var collection = TimesheetCollection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timesheet"),
      ),
      body: _buildTimesheetList()
    );
  }

  Widget _buildTimesheetList () {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        var timesheet = collection.allTimesheets[index];
        return ListTile(
          title: Text(timesheet.job)
        );
      },
    );
  }
}
