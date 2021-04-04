import 'dart:convert';
import 'package:timesheet_app/models/APIResponse.dart';
import 'package:timesheet_app/models/Job.dart';
import 'package:http/http.dart' as http;

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
            Job(
              id: item['id'].toString(),
              ref: item['job_ref'],
              description: item['job_description'],
              address: item['address'],
              suburb: item['suburb'],
              city: item['city'],
              status: item['status'],
              active: item['active'],
            )).toList();

          return APIResponse<List<Job>>(
            data: jobs,
          );
        }
        return APIResponse<List<Job>>(
          error: true, errorMsg: "An error occured");
      });
  }
}