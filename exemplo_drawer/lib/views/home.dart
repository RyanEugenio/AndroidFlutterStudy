import 'package:exemplo_drawer/menu/menu.dart';
import 'package:exemplo_drawer/views/app.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exemplo drawer'),),
      drawer: MenuDrawer(),
      body: Column(
        children: [
          Text('Home')
        ],
      ),
    );
  }
}

