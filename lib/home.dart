import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'painter.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  String _timeSting;
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);

    _timeSting = _formatDateTime(DateTime.now());

    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);

    setState(() {
      _timeSting = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Work On Time',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black
          )),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        color: Colors.cyan,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(1.0),
              child: CustomPaint(
                painter: Clock(),
                child: Container(height: 400.0,),
              ),
            ),
            Text(_timeSting.toString(), style: TextStyle(
                color: Colors.black,
                fontSize: 50.0,
                fontWeight: FontWeight.bold
            ))
          ],
        ),
      ),
    );
  }
}
