import 'dart:convert';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:timesheet_app/dio.dart';
import 'package:timesheet_app/models/Job.dart';
import 'package:timesheet_app/models/Timesheet.dart';


class TimesheetScreen extends StatefulWidget {
  @override
TimesheetScreenState createState() => TimesheetScreenState();
}

class TimesheetScreenState extends State<TimesheetScreen> {
    Future<List<Timesheet>> getTimesheets() async {
    Dio.Response response = await dio().get(
      'timesheets',
      options: Dio.Options(
        headers: { 'auth': true }
      )
    );

    List timesheets = json.decode(response.toString());

    return timesheets.map((job) => Timesheet.fromJson(job)).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        title: Text('Timesheets'),
      ),
      body: Center(
        child: FutureBuilder<List<Timesheet>>(
          future: getTimesheets(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  var item = snapshot.data[index];

                  return Card(
                    elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),

          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            title: Text(item.started + ' ' + item.stopped, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            onTap: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(builder: (_) => JobDetailScreen(id: _job.id)),
              // );
            },
          ),
          ),
        );
                }
              );
            } else if(snapshot.hasError) {
              return Text('Failed to load jobs');
            }

            return Center(child: CircularProgressIndicator());
          },
        )
      ),
    );
  }
}
