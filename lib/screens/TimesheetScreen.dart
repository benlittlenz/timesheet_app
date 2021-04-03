import 'package:flutter/material.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
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
    Job(1, "First Job"),
    Job(2, "Second Job"),
    Job(3, "Third Job"),
    Job(4, "Fourth Job")
  ];

  List<DropdownMenuItem<Job>> _dropdownMenuItems;
  Job _selectedItem;

  void initState() {
    super.initState;
    _dropdownMenuItems = buildDropdownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<Job>> buildDropdownMenuItems(List listItems) {
    List<DropdownMenuItem<Job>> items = List();
    for (Job listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  final Timesheet _timesheet;
  TimesheetScreenState({Key key, timesheet}) : _timesheet = timesheet;

  TimeOfDay _time = TimeOfDay.now().replacing(minute: 30);
  bool iosStyle = true;

  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      _time = newTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Timesheet"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Inline Picker Style",
              style: Theme.of(context).textTheme.headline6,
            ),
            // Render inline widget
            createInlinePicker(
              elevation: 1,
              value: _time,
              onChange: onTimeChanged,
              //minuteInterval: MinuteInterval.FIVE,
              iosStylePicker: false,
              // minMinute: 7,
              // maxMinute: 56,
            ),
          ],
        ),
    ),);
  }
}
