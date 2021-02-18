import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/tabs/bell.dart';
import 'package:sample_project/tabs/homee.dart';
import 'package:sample_project/tabs/user.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  var _currentindex = 0;
  final tabs = [
    Center(
      child: homee(),
    ),
    Center(
      child: bell(),
    ),
    Center(
      child: user(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentindex],
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey[100],
        buttonBackgroundColor: Colors.red,
        items: [
          Icon(Icons.account_balance_outlined),
          Icon(Icons.add_alert_outlined),
          Icon(Icons.account_circle_outlined),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
    );
  }
}
