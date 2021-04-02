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
      body: _buildTimesheetList(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Timesheets'
          ),
        ],
      ),
    );
  }

  Widget _buildTimesheetList () {
    var allTimesheets = collection.allTimesheets;

    if(allTimesheets.length == 0) {
      return Center(
        child: Text("No Timesheets")
      );
    }
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        var timesheet = allTimesheets[index];
        return ListTile(
          title: Text(timesheet.job)
        );
      },
    );
  }
}
