import 'package:flutter/material.dart';
import 'package:market_flutter/model/model.dart';
import 'package:market_flutter/repository/repository.dart';
import 'package:market_flutter/views/home_market.dart';
import 'package:market_flutter/views/register_market.dart';

class ListChangeAndDelete extends StatefulWidget {

  @override
  _ListChangeAndDeleteState createState() => _ListChangeAndDeleteState();
}

class _ListChangeAndDeleteState extends State<ListChangeAndDelete> {
  late MarketRepository _repository;

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
        appBar: AppBar(title: Text('Alterar e Excluir'),),
        body: RefreshIndicator(
          onRefresh: _reloadList,
          child: FutureBuilder(
            future: this._repository.fetchAll(),
            builder: (BuildContext context, AsyncSnapshot<List<Market>> snapshot) {
              final List<Market> markets = snapshot.data!;

              if(snapshot.hasData) {
                return ListView.builder(
                  itemCount: markets.length, //snapshot.data?.length
                  itemBuilder: (BuildContext context, int index) {
                    final Market market = markets[index];
                    return Dismissible(
                        direction: DismissDirection.endToStart,
                        background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Icon(Icons.delete_forever)
                        ),
                        key: ValueKey<int>(market.id!),
                        onDismissed: (DismissDirection direction) async {
                          await this._repository.delete(market);
                          setState(() {
                            snapshot.data!.remove(snapshot.data![index]);
                            });
                          },
                        child: Card(
                          child: ListTile(
                            onTap: () {
                              print('Você adicionou ${market.toString()}');
                              HomeMarket.cart.add(market);
                              print(HomeMarket.cart.length);
                              print(HomeMarket.cart.toString());
                            },
                            onLongPress: () {
                              print('Você escolheu ${market.toString()}');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (BuildContext context)
                                  => RegisterMarket(market: market,))
                              );
                            },
                            title: _title(market),
                            subtitle: _subtitle(market),
                            leading: CircleAvatar(backgroundColor: Colors.blue,),
                      ),
                     )
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