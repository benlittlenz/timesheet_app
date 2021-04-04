import 'dart:convert';
import 'package:timesheet_app/models/APIResponse.dart';
import 'package:timesheet_app/models/Job.dart';
import 'package:http/http.dart' as http;

class JobService {
  static const API_URL = 'localhost:8000';
  static const headers = {
    'Content-Type': 'application/json'
  };

  List<Job> getJobs() {
    return [
      new Job(
        id: "1",
        ref: "abc1",
        description: "test 1",
        address: "abc street",
        suburb: "abc suburb",
        city: "Auckland"
      ),
      new Job(
        id: "2",
        ref: "abc1",
        description: "test 1",
        address: "abc street",
        suburb: "abc suburb",
        city: "Auckland"
      ),
    ];
  }

  // Future<APIResponse<List<Job>>> getJobs() {
  //   return http.get(
  //     Uri.http(API_URL, '/notes', headers: headers).then((data) {
  //       final res = json.decode(data.body);

  //     })
  //   )
  // }
}