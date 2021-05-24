import 'package:ex_material_app_scaffold/views/views.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exemplo Material App Scaffold',
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      home: HomePage('Ex MaterialAppScaffold'),
    );
  }
}
