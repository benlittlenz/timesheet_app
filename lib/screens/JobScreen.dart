import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:timesheet_app/models/APIResponse.dart';
import 'package:timesheet_app/models/Job.dart';
import 'package:timesheet_app/models/JobDetail.dart';
import 'package:timesheet_app/screens/JobDetailScreen.dart';
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
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      //appBar: AppBar(title: Text("List of Jobs")),
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
                    elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),

          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            title: Text(_job.ref, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            subtitle: Text(
                "${_job.description}\n${_job.address}, ${_job.suburb}, ${_job.city}",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal)),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
            isThreeLine: true,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => JobDetailScreen(id: _job.id)),
              );
            },
          ),
          ),
        );
      },
    );
  }
}
