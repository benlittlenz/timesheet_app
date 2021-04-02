import 'package:flutter/material.dart';
import 'package:timesheet_app/models/Job.dart';

import 'package:timesheet_app/models/Timesheet.dart';

class TimesheetScreen extends StatefulWidget {
  final Timesheet _timesheet;
  TimesheetScreen({Key key, timesheet}) : _timesheet = timesheet;

  @override
  State<StatefulWidget> createState() {
    return TimesheetScreenState(
      timesheet: _timesheet,
    );
  }
}

class TimesheetScreenState extends State<TimesheetScreen> {
  List<Job> _dropdownItems = [
    Job(1, "First Value"),
    Job(2, "Second Item"),
    Job(3, "Third Item"),
    Job(4, "Fourth Item")
  ];

  final Timesheet _timesheet;
  int _value = 1;
  TimesheetScreenState({Key key, timesheet}) : _timesheet = timesheet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Timesheet"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: DropdownButton(
          value: _value,
          items: [
            DropdownMenuItem(
              child: Text("First Job"),
              value: 1,
            ),
            DropdownMenuItem(
              child: Text("Second Job"),
              value: 2,
            ),
            DropdownMenuItem(
              child: Text("Third Job"),
              value: 3,
            ),
            DropdownMenuItem(
              child: Text("Forth Job"),
              value: 4,
            ),
          ],
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
        ),
      ),
    );
  }
}
