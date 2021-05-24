import 'dart:html';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget _tab1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Impressora manos!'),
        Icon(Icons.print, size: 300,color: Colors.purple,),
      ],
    );
  }

  Widget _tab2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Chama fi'),
        TextButton(
          onPressed: resetarCor,
          child: Text('Resetar Cor'),
        ),
      ],
    );
  }

  Widget _tab(){
    return Column(
      children: [
        Text('ASOHDFSOAIJDFASFASDFAS'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
      appBar: AppBar(
        title: Text('Pagina Inicial'),
        centerTitle: true,
        backgroundColor: Colors.amber,
        bottom: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.print), text: 'Impressora',),
            Tab(icon: Icon(Icons.home), text: 'Home',),
            Tab(icon: Icon(Icons.contacts), text: 'Contatos',)
          ],
        ),
      ),
        backgroundColor: cores[troca],
        body: TabBarView(
        children: [
          _tab1(),
          _tab2(),
          _tab(),
        ],
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: trocarCores,
          tooltip: 'Trocar Cores',
          child: Icon(Icons.add),
      ),
      ),
    );
  }
  List cores = [Colors.cyan,Colors.deepOrange,Colors.purple,Colors.amberAccent,Colors.green,Colors.purpleAccent,Colors.white];

  int troca = 0;

  void trocarCores() {
    setState(() {
      final randColor = new Random();
      troca = randColor.nextInt(6);
    });
  }
  void resetarCor() {
    setState(() {
      troca = 6;
    });
  }
}
