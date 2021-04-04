import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timesheet_app/models/Timesheet.dart';
import 'package:timesheet_app/providers/TimesheetCollection.dart';
import 'package:timesheet_app/screens/TimesheetScreen.dart';
import 'package:uuid/uuid.dart';

import 'JobScreen.dart';

class HomeScreen extends StatelessWidget {
  var uuid = new Uuid();
  var collection = TimesheetCollection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Of Jobs"),
      ),
      body: JobScreen(),
      //body: _buildTimesheetList(),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     Timesheet timesheet = Timesheet(
      //       id: uuid.v4(),
      //     );
      //     Provider.of<TimesheetCollection>(context, listen: false).addTimesheet(timesheet);

      //     Navigator.of(context).push(
      //         MaterialPageRoute(builder: (context) => TimesheetScreen(timesheet: timesheet)));
      //   },
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.library_books), label: 'Timesheets'),
      //   ],
      // ),
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
