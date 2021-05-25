import 'package:flutter/material.dart';
import 'package:exemplo_enviando_mensagens/views/views.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
