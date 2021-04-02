import 'package:flutter/material.dart';
import 'package:timesheet_app/models/Timesheet.dart';

class TimesheetCollection extends ChangeNotifier
{
  final List<Timesheet> _timesheets = [
    Timesheet(id: '1', job: "Job 1"),
    Timesheet(id: '2', job: "Job 2"),
    Timesheet(id: '3', job: "Job 3"),
  ];

  get allTimesheets => _timesheets;

  void addTimesheet (Timesheet timesheet) {

    _timesheets.add(timesheet);

    notifyListeners();
  }
}