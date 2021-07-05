import 'package:flutter/material.dart';
import 'views.dart';
import 'package:study2/model/model.dart';
import 'package:study2/repository/repository.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
