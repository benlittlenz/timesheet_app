import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:timesheet_app/models/JobDetail.dart';
import 'package:timesheet_app/services/JobService.dart';

class JobDetailScreen extends StatefulWidget {
  var data;
  JobDetailScreen({this.data});

  @override
  _JobDetailScreenState createState() => _JobDetailScreenState();
}

class _JobDetailScreenState extends State<JobDetailScreen> {
  //JobService get jobService => GetIt.instance<JobService>();
  var _job;
  // String errorMsg;
  // bool _isLoading = false;
  //JobDetail job;

  @override
  void initState() {
    super.initState();

    _job = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Job Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(_job.description)
          // child: _isLoading
          //     ? Center(child: CircularProgressIndicator())
          //     : Stack(
          //         children: <Widget>[
          //           Container(
          //             height: MediaQuery.of(context).size.height * 0.1,
          //             width: MediaQuery.of(context).size.width,
          //             child: Center(
          //               child: Text(job.ref,
          //                   style:
          //                       TextStyle(color: Colors.white, fontSize: 45.0)),
          //             ),
          //           ),
          //           //Container(height: 8),
          //           Container(child: Center(child: Text(job.description)))
          //           //Text(job.description)
          //         ],
          //       ),
        )
        );
  }
}
