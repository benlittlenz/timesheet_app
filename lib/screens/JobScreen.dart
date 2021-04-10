

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
    return [];
    // Dio.Response response = await dio().get(
    //   'jobs',
    //   options: Dio.Options(
    //     headers: { 'auth': true }
    //   )
    // );

    // List jobs = json.decode(response.toString());

    // return jobs.map((job) => Job.fromJson(job)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                  return ListTile(
                    title: Text(item.ref),
                  );
                }
              );
            } else if(snapshot.hasError) {
              return Text('Failed to load jobs');
            }

            return CircularProgressIndicator();
          },
        )
      ),
    );
  }
}