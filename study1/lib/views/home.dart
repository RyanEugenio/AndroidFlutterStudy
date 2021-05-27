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
        ),
      ),
    );
  }

  Widget _tab2() {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _widgetTextField(),
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


  Widget _tab3() {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        ListTile( title: Text("Battery Full"),subtitle: Text("The battery is full."),leading: CircleAvatar(backgroundImage: AssetImage('assets/images/whatsapp.png'),),trailing: Icon(Icons.star)),
        ListTile( title: Text("Anchor"),subtitle: Text("Lower the anchor."), leading: Icon(Icons.anchor), trailing: Icon(Icons.star)),
        ListTile( title: Text("Alarm"),subtitle: Text("This is the time."), leading: Icon(Icons.access_alarm), trailing: Icon(Icons.star)),
        ListTile( title: Text("Ballot"),subtitle: Text("Cast your vote."), leading: Icon(Icons.ballot), trailing: Icon(Icons.star)),
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
            bottom: TabBar(
                tabs: [
                  Tab(child: Text('Home',style: TextStyle(color: Colors.deepPurple),),),
                  Tab(child: Text('Chamaaaa',style: TextStyle(color: Colors.deepPurple),),),
                  Tab(child: Text('Tab03',style: TextStyle(color: Colors.deepPurple),),),
                ],

            ),
          ),
          body: Container(
            child: TabBarView(
              children: [
                _tab1(),
                _tab2(),
                _tab3(),
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

  Padding _widgetTextField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: myController,
      ),
    );
  }
}
