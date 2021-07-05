import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'views.dart';
import 'package:market_flutter/model/model.dart';
import 'package:market_flutter/menu/menu.dart';
import 'package:market_flutter/repository/repository.dart';

class HomeMarket extends StatefulWidget {

  static List<Market> cart = [];

  @override
  _HomeMarketState createState() => _HomeMarketState();
}

class _HomeMarketState extends State<HomeMarket> {

  late MarketRepository _repository;

  _builderHorizontalContainer(Future<List<Market>> repository, Color color) {
    return Container(
      height: 130,
      child: FutureBuilder(
          future: repository,
          builder: (BuildContext context, AsyncSnapshot<List<Market>> snapshot) {

            final List<Market> markets = snapshot.data!;

            if(snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: markets.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Market market = markets[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 30, right: 5),
                      width: 160.0,
                      color: color,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${market.nameProduct}',textAlign: TextAlign.center,),
                            Text('R\$ ${market.valueProduct}',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    );
                  }
              );
            } else {
              return Center(child: CircularProgressIndicator(),);
            }
          }
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._repository = MarketRepository();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Market App", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: MenuDrawer(),
      body: RefreshIndicator(
        onRefresh: _reloadList,
        child:SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                Text('Açougue e Peixaria'),
                _builderHorizontalContainer(this._repository.whereButcherAndFishmonger(), Colors.amber),
                Text('Bebidas'),
                _builderHorizontalContainer(this._repository.whereDrink(), Colors.purpleAccent),
                Text('Frutas'),
                _builderHorizontalContainer(this._repository.whereFruit(), Colors.teal),
                Text('Higiene'),
                _builderHorizontalContainer(this._repository.whereHygiene(), Colors.lime),
                Text('Laticínios e Ovos'),
                _builderHorizontalContainer(this._repository.whereDairyAndEggs(), Colors.redAccent),
                Text('Mercearia'),
                _builderHorizontalContainer(this._repository.whereGrocery(), Colors.brown),
                Text('Verduras e Legumes'),
                _builderHorizontalContainer(this._repository.whereVegetablesAndLegumes(), Colors.green),
              ],
            )
        ),
      )
    )
    );
  }
  Future<void> _reloadList() async {
    var newList = await Future.delayed(Duration(seconds: 2), () => _repository);
    setState(() {
      _repository = newList;
    });
  }
}