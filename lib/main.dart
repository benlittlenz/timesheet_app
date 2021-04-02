import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timesheet_app/providers/TimesheetCollection.dart';
import 'package:timesheet_app/screens/HomeScreen.dart';
import 'package:timesheet_app/screens/TimesheetScreen.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (_) => new TimesheetCollection(),
    child: MyApp(),
  )
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timesheet"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: DropdownButton(
          value: _value,
          items: [
            DropdownMenuItem(
              child: Text("First Item"),
              value: 1,
            ),
            DropdownMenuItem(
              child: Text("Second Item"),
              value: 2,
            ),
            DropdownMenuItem(
              child: Text("Third Item"),
              value: 3,
            ),
            DropdownMenuItem(
              child: Text("Forth Item"),
              value: 4,
            ),
          ],
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
        ),
      ),
    );
  }
}
