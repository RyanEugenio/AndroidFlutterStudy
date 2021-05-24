import 'package:flutter/material.dart';
import 'package:gurizes_estudo/views/views.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gurizes Estudos',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
