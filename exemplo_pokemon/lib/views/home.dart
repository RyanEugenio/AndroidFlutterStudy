import 'package:exemplo_pokemon/model/model.dart';
import 'package:exemplo_pokemon/service/service.dart';
import 'package:exemplo_pokemon/views/view_pokemon_detail.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class Home extends StatefulWidget {

  final String title;

  const Home({Key? key, required this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Pokemon> _pokemonsList = [];
  bool _circularProgress = false;

  int _count = 0;
  int _page = 1;

  _title(int index) {
    return Text(_pokemonsList.elementAt(index).name.toString());
  }

  _subtitle(int index) {
    return Text(_pokemonsList.elementAt(index).url.toString());
  }

  _rowListPokemon() {
    if(_pokemonsList.isEmpty) {
      return Center(child: Text('Sem pokemons'),);
    }
    return ListView.builder(
        // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        //     maxCrossAxisExtent: 200,
        //     childAspectRatio: 3 / 2,
        //     crossAxisSpacing: 20,
        //     mainAxisSpacing: 20),
      itemCount: _pokemonsList.length, //qtd de pokemons.... 20
      itemBuilder: (context, index) { //0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
        // print('qtd de pokemons: ${_pokemonsList.length}');
        return Card(
            color: Colors.green,
            child: ListTile(
              title: _title(index),
              subtitle: _subtitle(index),
              leading: CircleAvatar(backgroundColor: Colors.transparent, backgroundImage: NetworkImage('${Constant.baseImageURL}${index+1}.png'),),
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                print('você escolheu: ${_pokemonsList.elementAt(index).name.toString()}');

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => ViewPokemonDetail(_pokemonsList.elementAt(index), index))
                );

              },
            )
        );
      }
    );
  }

  _rowProgress() {
    //tem cheiro.... tem cheiro de gambiarra...
    return _circularProgress ? CircularProgressIndicator() : Container();
  }

  _rowButton(BuildContext context) {
    return TextButton.icon(
      onPressed: () => _search(context),
      label: Text('Buscar pokemons'),
      icon: Icon(Icons.search)
    );
  }

  _rowControls(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _count > 0 ?
        TextButton.icon(
            onPressed: () => _count > 0 ? _previous(context) : print('s'),
            label: Text('anterior'),
            icon: Icon(Icons.arrow_back_outlined)
        ) : Text('Sem anterior'),
        TextButton.icon(
            onPressed: () => _next(context),
            label: Text('Próximo'),
            icon: Icon(Icons.navigate_next)
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de pokemons'),),
      body: Column(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            child: _rowListPokemon(),
          ),
          _rowProgress(),
          _rowButton(context),
          _rowControls(context),
          Text('Página ${_page}')
        ],
      ),
    );
  }

  _search(BuildContext context) async {
    _page = 1;
    _count = 0;
    setState(() {
      _circularProgress = true;
    });

    final pokemonService = PokemonService();

    _pokemonsList = await pokemonService.fetchPokemons();

    setState(() {
      print('atualizando a tela');
      _circularProgress = false;
    });
  }

  _previous(BuildContext context) async {
    _count = _count - 20;
    _page--;

    setState(() {
      _circularProgress = true;
    });

    final pokemonService = PokemonService();
    _pokemonsList = await pokemonService.fetchNextPreviousPokemons(_count);

    setState(() {
      print('atualizando a tela');
      _circularProgress = false;
    });
  }

  _next(BuildContext context) async {
    _count = _count + 20;
    _page++;
    setState(() {
      _circularProgress = true;
    });

    final pokemonService = PokemonService();

    _pokemonsList = await pokemonService.fetchNextPreviousPokemons(_count);

    setState(() {
      print('atualizando a tela');
      _circularProgress = false;
    });
  }
}