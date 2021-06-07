import 'package:flutter/material.dart';
import 'views.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cartão",
      debugShowCheckedModeBanner: false,
      home:Home(),
    );
  }
}
