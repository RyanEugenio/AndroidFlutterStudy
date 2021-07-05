import 'package:flutter/material.dart';
import 'package:market_flutter/model/market.dart';
import 'package:market_flutter/repository/market_repository.dart';

class ListGrocery extends StatefulWidget {

  @override
  _ListGroceryState createState() => _ListGroceryState();
}

class _ListGroceryState extends State<ListGrocery> {
  late MarketRepository _repository;
  List cores = [Colors.green, Colors.brown, Colors.red, Colors.purpleAccent,Colors.deepPurple];

  _title(Market market) {
    return Row(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text('${market.nameProduct.toString()}'),
            )
          ],
        )
      ],
    );
  }

  _subtitle(Market market) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.shopping_cart),
              Text('${market.quantityProduct}')
            ],
          ),
          Row(
            children: [
              Icon(Icons.attach_money_outlined),
              Text('${market.valueProduct}')
            ],
          ),
          Row(
            children: [
              Icon(Icons.local_pizza_outlined),
              Text('${market.categoryProduct}')
            ],
          ),
        ],
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
        appBar: AppBar(title: Text('Mercearia'),),
        body: RefreshIndicator(
          onRefresh: _reloadList,
          child: FutureBuilder(
            future: this._repository.whereGrocery(),
            builder: (BuildContext context, AsyncSnapshot<List<Market>> snapshot) {

              final List<Market> markets = snapshot.data!;

              if(snapshot.hasData) {
                return ListView.builder(
                  itemCount: markets.length, //snapshot.data?.length
                  itemBuilder: (BuildContext context, int index) {
                    final Market market = markets[index];
                    return Card(
                      child: ListTile(
                        title: _title(market),
                        subtitle: _subtitle(market),
                        leading: CircleAvatar(backgroundColor: cores[index],),
                      ),
                    );
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator(),);
              }
            },
          ),
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