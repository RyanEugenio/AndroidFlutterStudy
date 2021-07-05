import 'package:exemplo_drawer/views/views.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exemplo drawer',
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home: Home(),
    );
  }
}
