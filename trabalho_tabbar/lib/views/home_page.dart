import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  final String title;

  HomePage(this.title);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget _tabHome() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.home, size: 150, color: Colors.purpleAccent,),
      ],
    );
  }

  Widget _tabCounter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('O contador: $counter', style: TextStyle(color: Colors.purpleAccent, fontSize: 20),),
        TextButton(
            onPressed: increaseCounter,
            child: Text('Aumentar', style: TextStyle(color: Colors.green),)
        ),
        TextButton(
            onPressed: decreaseCounter,
            child: Text('Diminuir', style: TextStyle(color: Colors.red),)
        ),
        TextButton(
            onPressed: randomCounter,
            child: Text('Número Aleatório', style: TextStyle(color: Colors.cyan),)
        ),
        TextButton(
            onPressed: resetCounter,
            child: Text('Resetar', style: TextStyle(color: Colors.white),)
        ),
      ],
    );
  }

  Widget _tabAbout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.person, size: 150, color: Colors.purpleAccent,),
        Text('Nome Completo: Ryan Eugênio Ferreira', style: TextStyle(color: Colors.blue),),
        Text('Email: ryaneugenio26@hotmail.com', style: TextStyle(color: Colors.green),),
        Text('GitHub: https://github.com/RyanEugenio', style: TextStyle(color: Colors.deepOrangeAccent),),
        Text('Telefone: (51) 98606-7568', style: TextStyle(color: Colors.pinkAccent),),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3, 
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            centerTitle: true,
            backgroundColor: Colors.purpleAccent,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Home',),
                Tab(icon: Icon(Icons.add_box_outlined), text: 'Counter',),
                Tab(icon: Icon(Icons.person), text: 'Sobre',)
              ],
            ),
          ),
          backgroundColor: Colors.black38,
          body: TabBarView(
            children: [
              _tabHome(),
              _tabCounter(),
              _tabAbout(),
            ],
          ),
        ),
    );
  }
  int counter = 0;

  void increaseCounter() {
    setState(() {
      counter++;
    });
  }

  void decreaseCounter() {
    setState(() {
      counter--;
    });
  }

  void randomCounter() {
    setState(() {
      final randNumber = new Random();
      counter = randNumber.nextInt(999999999);
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }
}
