import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timesheet_app/models/Timesheet.dart';
import 'package:timesheet_app/providers/TimesheetCollection.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatelessWidget {
  var uuid = new Uuid();
  var collection = TimesheetCollection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timesheet"),
      ),
      body: _buildTimesheetList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Timesheet timesheet = Timesheet(
            id: uuid.v4(),
          );
          Provider.of<TimesheetCollection>(context, listen: false).addTimesheet(timesheet);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: 'Timesheets'),
        ],
      ),
    );
  }

  Widget _buildTimesheetList() {
  return Consumer<TimesheetCollection>(builder: (context, timesheets, child) {
      var allTimesheets = timesheets.allTimesheets;
      if (allTimesheets.length == 0) {
        return Center(
          child: Text('No Notes'),
        );
      }
      return ListView.builder(
        itemCount: allTimesheets.length,
        itemBuilder: (context, index) {
          var timesheet = allTimesheets[index];
          return ListTile(title: Text(timesheet.job));
        },
      );
    });
  }
}
