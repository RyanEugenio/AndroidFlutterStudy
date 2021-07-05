import 'package:exemplo_pokemon/constant.dart';
import 'package:exemplo_pokemon/model/model.dart';
import 'package:flutter/material.dart';

class ViewPokemonDetail extends StatefulWidget {

  final Pokemon pokemon;
  final int position; //index

  ViewPokemonDetail(this.pokemon, this.position);

  @override
  _ViewPokemonDetailState createState() => _ViewPokemonDetailState();
}

class _ViewPokemonDetailState extends State<ViewPokemonDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalhe do ${widget.pokemon.name}'),),
      body: Column(
        children: [
          Image.network('${Constant.baseImageURL}${widget.position+1}.png'),
          Text('Detalhe do pokemon ${widget.pokemon.name}'),
          Text('URL para ver mais infos ${widget.pokemon.url}'),
        ],
      ),
    );
  }
}

