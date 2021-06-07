import 'dart:html';

import 'package:flutter/material.dart';
import 'views.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Widget _column() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: heightColumn,
            color: colorsColumn[0],
            child: Container(
              child: Text('red',style: TextStyle(color: Colors.white,fontSize: fontSizeColumn),),
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: heightColumn,
            color: colorsColumn[1],
            child: Container(
                child: Text('green',style: TextStyle(color: Colors.white,fontSize: fontSizeColumn),),
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: heightColumn,
            color: colorsColumn[2],
            child: Container(
              child: Text('blue',style: TextStyle(color: Colors.white,fontSize: fontSizeColumn),),
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: heightColumn,
            color: colorsColumn[3],
            child: Container(
              child: Text('yellow',style: TextStyle(color: Colors.white,fontSize: fontSizeColumn),),
              alignment: Alignment.topCenter,
            ),
          ),
        ),
      ],
    );
  }

  Widget _row() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: heightRow,
          color: colorRow,
          child: Text('row one',style: TextStyle(color: Colors.white, fontSize: fontSizeRow),),
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: heightRow,
          color: colorRow,
          child: Text('row two',style: TextStyle(color: Colors.white, fontSize: fontSizeRow),),
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: heightRow,
          color: colorRow,
          child: Text('row three',style: TextStyle(color: Colors.white, fontSize: fontSizeRow),),
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: heightRow,
          color: colorRow,
          child: Text('row four',style: TextStyle(color: Colors.white, fontSize: fontSizeRow),),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Example Layout',style: TextStyle(fontSize: 30),),centerTitle: true,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _column(),
            _row()
          ],
        ),
      ),
    );
  }
  double fontSizeRow = 60;
  double heightRow = 116;
  double fontSizeColumn = 30;
  double heightColumn = 460;
  Color colorRow = Colors.black;
  List colorsColumn = [Colors.red, Colors.green, Colors.blue, Colors.yellow];
}
