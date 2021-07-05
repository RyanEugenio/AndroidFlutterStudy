import 'package:flutter/material.dart';
import 'package:market_flutter/views/views.dart';

class AdminChoice extends StatefulWidget {

  @override
  _AdminChoiceState createState() => _AdminChoiceState();
}

class _AdminChoiceState extends State<AdminChoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen Admin')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => RegisterMarket())
                  );
                },
                child: Text('Registrar')),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ListChangeAndDelete())
                  );
                },
                child: Text('Alterar e Excluir')),
          ],
        ),
      ),
    );
  }
}