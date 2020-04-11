import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home.dart';

void main() => runApp(MyClock());

class MyClock extends StatefulWidget {
  MyClock({Key key}) : super(key: key);

  @override
  _MyClockState createState() => _MyClockState();
}

class _MyClockState extends State<MyClock> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primaryColor: Colors.cyan, accentColor: Colors.cyanAccent),
      home: Home(),
    );
  }
}
