import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'views.dart';

class Home extends StatefulWidget {

  final String title;

  Home(this.title);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final myController = TextEditingController();

  List<Widget> list;

  @override
  void initState() {
    list = [];
    super.initState();
  }

  Widget listView1() {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 50,
      color: cores[troca],
      child: Center(child: Text(myController.text),),
    );
  }

  Widget _tab1() {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return list[index];
          },
          // children: [
          //   TextField(
          //     controller: myController,
          //   ),
          //   ElevatedButton(
          //       onPressed: (){
          //         // addList();
          //       },
          //       child: Text('Button')
          //   ),
          // ],
        ),
      ),
    );
  }

  Widget _tab2() {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: myController,
            ),
            ElevatedButton(
                onPressed: () {
                  addList();
                  trocarCores();
                },
                child: Text('Confirm'))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            bottom: TabBar(
                tabs: [
                  Text('Home'),
                  Text('Chamaaaa'),
                ]
            ),
          ),
          body: Container(
            child: TabBarView(
              children: [
                _tab1(),
                _tab2(),
              ],
            ),
          ),
        ),
    );
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void addList() {
    setState(() {
      list.add(listView1());
    });
  }

  List cores = [Colors.cyan,Colors.deepOrange,Colors.purple,Colors.amberAccent,Colors.green,Colors.purpleAccent,Colors.white];

  int troca = 0;

  void trocarCores() {
    setState(() {
      final randColor = new Random();
      troca = randColor.nextInt(6);
    });
  }
}
