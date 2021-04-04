import 'dart:convert';
import 'package:timesheet_app/models/APIResponse.dart';
import 'package:timesheet_app/models/Job.dart';
import 'package:http/http.dart' as http;
import 'package:timesheet_app/models/JobDetail.dart';

class JobService {
  static const API_URL = '10.0.2.2:8000';
  static const headers = {
    'Content-Type': 'application/json'
  };

  Future<APIResponse<List<Job>>> getJobs() {
    return http.get(Uri.parse('http://10.0.2.2:8000/api/jobs'))
      .then((res) {
        if (res.statusCode == 200) {
          List<dynamic> data = json.decode(res.body);
          List<Job> jobs = data.map((item) =>
            Job.fromJson(item)
          ).toList();

          return APIResponse<List<Job>>(
            data: jobs,
          );
        }
        return APIResponse<List<Job>>(
          error: true, errorMsg: "An error occured");
      });
  }

  Future<APIResponse<JobDetail>> getJob(String id) {
    return http.get(Uri.parse('http://10.0.2.2:8000/api/job/$id'))
      .then((res) {
        if (res.statusCode == 200) {
          final data = json.decode(res.body);
          return APIResponse<JobDetail>(
            data: JobDetail.fromJson(data)
          );
        }
        return APIResponse<JobDetail>(
          error: true, errorMsg: "An error occured");
      });
  }
}