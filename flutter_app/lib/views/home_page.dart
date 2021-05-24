import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/views/views.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('oi bb'),
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent,
      ),
    );
  }
}
