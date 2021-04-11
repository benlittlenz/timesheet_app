

import 'dart:convert';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:timesheet_app/models/Job.dart';

import '../dio.dart';

class JobScreen extends StatefulWidget {
  @override
  _JobScreenState createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  Future<List<Job>> getJobs() async {
    Dio.Response response = await dio().get(
      'jobs',
      options: Dio.Options(
        headers: { 'auth': true }
      )
    );

    List jobs = json.decode(response.toString());

    return jobs.map((job) => Job.fromJson(job)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        title: Text('Jobs'),
      ),
      body: Center(
        child: FutureBuilder<List<Job>>(
          future: getJobs(),
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
            title: Text(item.ref, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            subtitle: Text(
                "${item.description}\n${item.address}, ${item.suburb}, ${item.city}",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal)),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
            isThreeLine: true,
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