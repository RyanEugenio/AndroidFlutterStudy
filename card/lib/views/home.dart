import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'views.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _renderBackground() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.amber
    ));
  }

  _renderFront() {
    return Container(
      decoration: BoxDecoration(
        color:Colors.indigo,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Center(
        child: Text("Clique Aqui" , style: TextStyle(fontSize: 22.0, color: Colors.white),),
      ),
    );
  }

  _renderBack() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Center(
        child: Image.network("https://www.bamfestas.com.br/557-tm_thickbox_default/balao-metalizado-cart-de-baralho.jpg"),
      ),
    );
  }

  _renderCard(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.only(left: 32.0, right: 32.0, top: 50.0, bottom: 100.0),
      color: Colors.amber,
      child: FlipCard(
        flipOnTouch: true,
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        onFlipDone: (status) {
          print("status: $status");
        },
        front: _renderFront(),
        back: _renderBack(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("Cartão de Credito"),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          _renderBackground(),
          Column(
            children: [Expanded(child: _renderCard(context))],
          )
        ],
      ),
    );
  }
}
