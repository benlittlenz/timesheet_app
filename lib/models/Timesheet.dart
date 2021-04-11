class Timesheet {
  String id;
  String job;
  String user;
  String started;
  String stopped;
  String hours;

  Timesheet(
      {this.id,
      this.job,
      this.user,
      this.started,
      this.stopped,
      this.hours
      });

  factory Timesheet.fromJson(Map<String, dynamic> item) {
    return Timesheet(
      id: item['id'].toString(),
      job: item['job_id'].toString(),
      user: item['user_id'].toString(),
      started: item['started_at'],
      stopped: item['stopped_at'],
      hours: item['total_hours'],
    );
  }
}
