import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'views.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _renderBackground() {
    return Container(
      decoration: BoxDecoration(color: Colors.teal[500]),
    );
  }

  _renderFront() {
    return Container(
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  height: 230,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    color: Colors.yellow,
                  ),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: RichText(
                      text: TextSpan(
                        text: "Cartão do Usuário",
                        style: TextStyle(
                            color: Color(0xFF438966),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                        children: [
                          WidgetSpan(
                            child:
                                RotatedBox(quarterTurns: -1, child: Text('')),
                          )
                        ],
                      ),
                    ),
                  )),
            ),
            Expanded(
                flex: 14,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      image: new DecorationImage(
                          image: new AssetImage('assets/images/fundo_front.png'),
                          fit: BoxFit.fill)),
                  height: 230,
                  child: Container(
                      margin: EdgeInsets.only(left: 10, top: 20),
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "SUS ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    fontFamily: "Limelight"),
                              ),
                              Image.asset("assets/images/sus.png", width: 50),
                              Text(
                                "  Sistema \n  Único \n  de Saúde",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 7),
                                child: Text(
                                  "Cartão Nacional de Saúde",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      letterSpacing: 0.3),
                                ),
                              )
                            ],
                          ),
                        ],
                      )),
                ))
          ],
        ),
      ),
    );
  }

  _renderBack() {
    return Container(
        margin: EdgeInsets.only(top: 23),
        child: Column(
        children: [
            Expanded(
              flex: 1,
              child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.yellow,
                    ),
                    width: 400,
                    alignment: Alignment.center,
                child: Text(
                  "Sistema Único de Saúde",
                  style: TextStyle(
                      color: Color(0xFF438966),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 0.7),
                ),
              ),
            ),
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                image: new DecorationImage(
                    image: new AssetImage('assets/images/fundo2.png'),
                  fit: BoxFit.fill
                )
              ),
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    width: 200,
                    height: 110,
                    margin: EdgeInsets.only(top: 10),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, left: 10),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "ROMULO ARANTES SANTOS",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 10.5),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 10, left: 10),
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      "Data Nasc.: 13/12/1988",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.5,
                                          letterSpacing: 0.1),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "Sexo:M",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.5,
                                          letterSpacing: 0.1),
                                    ),
                                  )
                                ],
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 5),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Text(
                                    "893 0034 0054 0716",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Image.asset(
                                    "assets/images/bar_code.png",
                                    width: 140,
                                    height: 40,
                                  )
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Row(
                        children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 65,
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 1.5,
                                            left: 20,
                                            bottom: 1.5,
                                            right: 20),
                                        child: Text(
                                          "DISQUE SAÚDE 136",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.5),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 3.0, color: Colors.white),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  Text(
                                    "Este cartão é de uso pessoal e intransferível",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 9),
                                  ),
                                  Text(
                                    "Em caso de roubo ou perda, comunicar ao Disque Saúde",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 9),
                                  ),
                                  Text(
                                    "VÁLIDO EM TODO O TERRITÓRIO NACIONAL",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.5,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          )
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                              height: 50,
                              child: Container(
                                alignment: Alignment.bottomRight,
                                child: Row(
                                  children: [
                                    Text(
                                      "SUS ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          fontFamily: "Limelight"),
                                    ),
                                    Image.asset("assets/images/sus.png",
                                        width: 30),
                                  ],
                                ),
                              )
                          )
                      ),
                    ],
                    )
                  )
                ],
              ),
            )
          ),
      ],
    )
    );
  }

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  _renderCard(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 450),
      color: Colors.teal[500],
      child: FlipCard(
          key: cardKey,
          flipOnTouch: true,
          direction: FlipDirection.HORIZONTAL,
          speed: 1000,
          onFlipDone: (status) {
            print("status: $status");
          },
          front: _renderFront(),
          back: _renderBack()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Cartão do SUS",
            style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
            fontFamily: "Limelight"),),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          _renderBackground(),
          Column(
            children: [Expanded(child: _renderCard(context))],
          ),
          Container(
            margin: EdgeInsets.only(top: 220),
            child: Image.asset("assets/images/banner_saude.png",),
          ),

        ],
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          onPressed: () => cardKey.currentState.toggleCard(),
          child: Icon(Icons.credit_card),
        ),
    );
  }
}
