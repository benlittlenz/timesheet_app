import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:timesheet_app/models/APIResponse.dart';
import 'package:timesheet_app/models/Job.dart';
import 'package:timesheet_app/services/JobService.dart';

class JobScreen extends StatefulWidget {
  @override
  _JobScreenState createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  JobService get service => GetIt.I<JobService>();

  APIResponse<List<Job>> _jobs;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchJobs();
  }

  _fetchJobs() async {
    setState(() {
      _isLoading = true;
    });

    _jobs = await service.getJobs();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List of Jobs")),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _buildListView(),
    );
  }

  ListView _buildListView() {
    return ListView.builder(
      itemCount: _jobs.data.length,
      itemBuilder: (_, index) {
        var _job = _jobs.data[index];
        return Card(
          child: ListTile(
            title: Text(_job.ref),
            subtitle:
            Text(
              "${_job.description}\n${_job.address}, ${_job.suburb}, ${_job.city}"),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          ),
        );
      },
    );
  }
}
