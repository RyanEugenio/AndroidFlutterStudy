import 'package:exemplo_drawer/menu/menu.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exemplo drawer'),),
      body: Column(
        children: [
          Text('Tela 2')
        ],
      ),
    );
  }
}
