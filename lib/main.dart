import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:timesheet_app/providers/TimesheetCollection.dart';
import 'package:timesheet_app/providers/auth.dart';
import 'package:timesheet_app/screens/HomeScreen.dart';
import 'package:timesheet_app/screens/TimesheetScreen.dart';
import 'package:timesheet_app/services/JobService.dart';
import 'package:timesheet_app/widgets/nav-drawer.dart';

// void setupLocator() {
//   GetIt.instance.registerLazySingleton(() => JobService());
// }


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Auth(),
      child: MyApp(),
    )
  );
}

  // ChangeNotifierProvider(
  //   create: (_) => new TimesheetCollection(),
  //   child: MyApp(),
  // )
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
      ),
      home: Home(title: 'Flutter Authentication'),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: NavDrawer(),
      body: Center(
        child: Consumer<Auth>(
          builder: (context, auth, child) {
            if(auth.authenticated) {
              return Text('You are logged in');
            } else {
              return Text("You are not logged in");
            }
          },
        ),
      ),
    );
  }
}
