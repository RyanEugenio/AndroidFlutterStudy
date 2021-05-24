import 'package:flutter/material.dart';
import 'package:trabalho_tabbar/views/views.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trabalho TabBar',
      debugShowCheckedModeBanner: false,
      home: HomePage('Trabalho TabBar'),
    );
  }
}
