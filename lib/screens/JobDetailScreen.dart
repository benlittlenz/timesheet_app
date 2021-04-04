import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:timesheet_app/models/JobDetail.dart';
import 'package:timesheet_app/services/JobService.dart';

class JobDetailScreen extends StatelessWidget {
  String id;
  String error;
  bool _isLoading = false;

  JobDetailScreen({id});

  JobService get jobService => GetIt.instance<JobService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
      )
    );
  }
}
