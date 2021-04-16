import 'dart:convert';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:timesheet_app/models/Job.dart';

import '../dio.dart';

class JobScreen extends StatefulWidget {
  @override
  _JobScreenState createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  Future<List<Job>> getJobs() async {
    Dio.Response response =
        await dio().get('jobs', options: Dio.Options(headers: {'auth': true}));
    //debugPrint(response.toString());
    List jobs = json.decode(response.toString());

    return jobs.map((job) => Job.fromJson(job)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.account_circle_rounded, size: 26.0),
        //leadingWidth: 80, // default is 56
        title: Text('Jobs'),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[300], blurRadius: 5.0, offset: Offset(0, 3))
          ],
        ),
        child: Column(
          children: <Widget>[
            
            Expanded(
                child: FutureBuilder<List<Job>>(
              future: getJobs(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        var item = snapshot.data[index];
                        return Card(
                          elevation: 8.0,
                          margin: new EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 6.0),
                          child: Column(children: <Widget>[
                            Column(children: [
                              Row(children: [
                                SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(top: 10.0)),
                                      Text(item.ref,
                                          style: TextStyle(fontSize: 20)),
                                      Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 5.0)),
                                      Text(
                                          "${item.address}, ${item.suburb}, ${item.city}",
                                          style: TextStyle(color: Colors.grey)),
                                      Padding(
                                          padding: EdgeInsets.only(top: 8.0)),
                                      Container(
                                          height: 50.0,
                                          child: Text(
                                            item.description,
                                            maxLines: 3,
                                          )),
                                    ],
                                  ),
                                )
                              ])
                            ]),
                            Container(
                              child: new ButtonBar(
                                children: <Widget>[
                                  TextButton(
                                    child: const Text('VIEW DETAILS'),
                                    onPressed: () {/* ... */},
                                  ),
                                ],
                              ),
                            )
                          ]),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text('Failed to load jobs');
                }

                return Center(child: CircularProgressIndicator());
              },
            )),
          ],
        ),
      ),
    );
  }
}
