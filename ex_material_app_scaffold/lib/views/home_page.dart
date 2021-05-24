import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  final String title;

  HomePage(this.title);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget _tab1() {
    return Column(
      children: [
        Icon(Icons.home, size: 250, color: Colors.green,),
        Text('aaaa'),
        Text('bbbb'),
        Text('cccc'),
        Text('dddd'),
        Text('eeee'),
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
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.home)),
                  Tab(icon: Icon(Icons.list)),
                  Tab(icon: Icon(Icons.android))
                ],
              ),
            ),
            body: TabBarView(
              children: [
                _tab1(),
                Center(child: Text('Tab list'),),
                Center(child: Text('Tab android'),)
              ],
            )
        )
    );
  }

}

//child - filho único
//children - vários filhos