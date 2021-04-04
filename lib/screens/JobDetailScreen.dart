import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:timesheet_app/models/JobDetail.dart';
import 'package:timesheet_app/services/JobService.dart';

class JobDetailScreen extends StatefulWidget {
  final String id;
  JobDetailScreen({this.id});

  @override
  _JobDetailScreenState createState() => _JobDetailScreenState();
}

class _JobDetailScreenState extends State<JobDetailScreen> {
  JobService get jobService => GetIt.instance<JobService>();

  String errorMsg;
  bool _isLoading = false;
  JobDetail job;

  @override
  void initState() {
    super.initState();

    setState(() {
      _isLoading = true;
    });
    jobService.getJob(widget.id).then((res) {
      setState(() {
        _isLoading = false;
      });

      if (res.error) {
        errorMsg = res.errorMsg ?? 'An error occured';
      }
      job = res.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Job Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          job.ref,
                          style: TextStyle(fontSize: 45.0)
                        ),
                        ),
                    ),
                    Container(height: 8),
                    //Text(job.description)
                  ],
                ),
        ));
  }
}
