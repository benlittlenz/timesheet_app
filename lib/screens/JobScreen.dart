import 'package:flutter/material.dart';

class JobScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Jobs")
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green),
          itemBuilder: (_, index) {

          },
          itemCount: 3,
      ),
    );
  }
}