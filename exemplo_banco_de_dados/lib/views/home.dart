import 'package:exemplo_banco_de_dados/views/views.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  final String title;

  const Home({Key? key, required this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Column(
        children : [
          Text('Seja bem vindo a agenda'),
          TextButton.icon(
            onPressed: () {
              print('Cadastrar contato');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => RegisterContact())
              );
            },
            label: Text('Cadastrar contato'),
            icon: Icon(Icons.add)
          ),
          TextButton.icon(
              onPressed: () {
                print('Listar contatos');
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => ListContact())
                );
              },
              label: Text('Listar contatos'),
              icon: Icon(Icons.list)
          )
        ]
      )
    );
  }

}