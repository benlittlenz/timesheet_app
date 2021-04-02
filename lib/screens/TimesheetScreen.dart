import 'package:flutter/material.dart';

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
  final Timesheet _timesheet;

  TimesheetScreenState({Key key, timesheet}) : _timesheet = timesheet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timesheet"),
      ),
    );
  }
}