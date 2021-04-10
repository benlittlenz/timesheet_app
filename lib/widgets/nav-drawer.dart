import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timesheet_app/providers/auth.dart';
import 'package:timesheet_app/screens/JobScreen.dart';
import 'package:timesheet_app/screens/LoginScreen.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(child: Consumer<Auth>(builder: (context, auth, child) {
      if (auth.authenticated) {
        return ListView(
          children: [
            ListTile(
              title: Text(auth.user.name),
            ),
            ListTile(
                title: Text('Jobs'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => JobScreen()));
                }),
            ListTile(
                title: Text('Logout'),
                onTap: () {
                  Provider.of<Auth>(context, listen:false).logout();
                }),
          ],
        );
      } else {
        return ListView(
          children: [
            ListTile(
                title: Text('Login'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }),
          ],
        );
      }
    }));
  }
}
