import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:timesheet_app/providers/auth.dart';
import 'package:timesheet_app/screens/JobScreen.dart';
import 'package:timesheet_app/screens/TimesheetScreen.dart';
import 'package:timesheet_app/widgets/nav-drawer.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => Auth(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  int _pageIndex = 0;
  PageController _pageController;
  final storage = FlutterSecureStorage();

  List<Widget> tabPages = [
    JobScreen(),
    TimesheetScreen(),
    //Screen1(),
    Screen2(),
    // Screen3(),
  ];

  void _attempAuthentication() async {
    final key = await storage.read(key: 'auth');
    //debugPrint(key);
    Provider.of<Auth>(context, listen: false).attempt(key);
  }

  @override
  void initState() {
    _attempAuthentication();
    _pageController = PageController(initialPage: _pageIndex);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      drawer: NavDrawer(),
      body: Center(
        child: Consumer<Auth>(
          builder: (context, auth, child) {
            if (auth.authenticated) {
              return PageView(
                children: tabPages,
                onPageChanged: onPageChanged,
                controller: _pageController,
              );
            } else {
              return Text("You are not logged in");
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _pageIndex,
        onTap: onTabTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: 'Timesheets'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: 'Jobs'),
        ],
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(child: Text("Screen 1")),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Center(child: Text("Screen 2")),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      child: Center(child: Text("Screen 3")),
    );
  }
}
