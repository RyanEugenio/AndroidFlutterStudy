import 'package:flutter/material.dart';
import 'package:flutter_app/views/views.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Logo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


