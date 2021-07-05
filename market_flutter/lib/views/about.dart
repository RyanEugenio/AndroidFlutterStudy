import 'package:flutter/material.dart';
import 'package:market_flutter/views/register_market.dart';

class About extends StatefulWidget {


  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Sobre"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [  Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(
                      color: Colors.black, // set border color
                      width: 3.0), // set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)), // set rounded corner radius
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.black,
                        offset: Offset(1, 3))
                  ] // make rounded corner of border
              ),
              child:
              Padding(
                padding: EdgeInsets.all(0.0),
                child: Text(
                  "Aplicativo Desenvolvido pelos alunos da Faculdade e Escola Técnica QI ,de Porto Alegre, com intuito para apresentar como projeto final do Curso de Informatica para Internet :",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                ),
              ),
            ),
              Text(
                "\nDesenvolvedores",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.all(25),
                padding: EdgeInsets.all(25),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(
                        color: Colors.black, // set border color
                        width: 3.0), // set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(10.0)), // set rounded corner radius
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(1, 3))
                    ] // make rounded corner of border
                ),
                child: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      Text("Lucas ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Image.asset(
                        "assets/images/lucas.jpg",
                        height: 600,
                        alignment: Alignment.center,
                      ),
                      Text(
                          "Nome Completo : Lucas Ribeiro Gades \n\nIdade : 21 anos \n\nCidade : Porto Alegre , RS\n"),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(25),
                padding: EdgeInsets.all(25),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(
                        color: Colors.black, // set border color
                        width: 3.0), // set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(10.0)), // set rounded corner radius
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(1, 3))
                    ] // make rounded corner of border
                ),
                child: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      Text("Ryan ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Image.asset(
                        "assets/images/ryan.jpeg",
                        height: 350,
                        alignment: Alignment.center,
                      ),
                      Text(
                          "Nome Completo : Ryan Eugênio Ferreira \n\nIdade : 18 anos \n\nCidade : Porto Alegre , RS\n"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}