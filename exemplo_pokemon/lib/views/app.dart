import 'package:exemplo_pokemon/views/views.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      title: 'Pokemon',
      home: Home(title: 'Pokemon'),
    );
  }
}
