import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:timesheet_app/models/Timesheet.dart';

class TimesheetScreen extends StatefulWidget {
  final Timesheet _timesheet;
  TimesheetScreen({Key key, timesheet}) : _timesheet = timesheet;

  @override
  State<StatefulWidget> createState() {
    return TimesheetScreenState(
      timesheet: _timesheet,
    )
  }
}