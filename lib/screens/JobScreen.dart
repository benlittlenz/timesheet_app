import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:timesheet_app/models/Job.dart';
import 'package:timesheet_app/services/JobService.dart';

class JobScreen extends StatefulWidget {

  @override
  _JobScreenState createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  JobService get service => GetIt.I<JobService>();

  List<Job> jobs = [];

  @override
  void initState() {
    super.initState();

    jobs = service.getJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Jobs")
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green),
          itemBuilder: (_, index) {
            return ListTile(
                title: Text(jobs[index].ref),
            );
          },
          itemCount: jobs.length,
      ),
    );
  }
}