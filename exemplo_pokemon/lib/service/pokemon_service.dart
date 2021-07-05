
import 'package:exemplo_pokemon/constant.dart';
import 'package:exemplo_pokemon/model/model.dart';
import 'package:http/http.dart' as http; //apelido
import 'dart:convert';

import 'package:http/http.dart';

class PokemonService {

  Future<List<Pokemon>> fetchNextPreviousPokemons(int offset) async {

    //"https://pokeapi.co/api/v2/pokemon?offset=20&limit=20"
    var url = Uri.https(Constant.baseURL, Constant.pokemonEndpoint, {'offset': '${offset}', 'limit':'{20}'});

    final response = await http.Client().get(url);

    if(response.statusCode != 200) {
      print('Deu erro!');
      throw Exception();
    }

    return parsedJson(response.body);
  }

  Future<List<Pokemon>> fetchPokemons() async {

    var url = Uri.https(Constant.baseURL, Constant.pokemonEndpoint);

    final response = await http.Client().get(url);

    if(response.statusCode != 200) {
      print('Deu erro!');
      throw Exception();
    }

    return parsedJson(response.body);
  }

  //json encode e json decode
  List<Pokemon> parsedJson(response) {
    final jsonDecoded = json.decode(response);

    List<dynamic> dynamicPokemons = jsonDecoded['results'];
    /*
    [
      {
        "name": "bulbasaur",
        "url": "https://pokeapi.co/api/v2/pokemon/1/"
      },
      {
        "name": "ivysaur",
        "url": "https://pokeapi.co/api/v2/pokemon/2/"
      },
      ...........
    ]
    */
    List<Pokemon> pokemons = dynamicPokemons.map((element) => Pokemon.fromJson(element)).toList();
    return pokemons;
  }
}
/*
{
  "count": 1118,
  "next": "https://pokeapi.co/api/v2/pokemon/?offset=20&limit=20",
  "previous": null,
  "results": [
    {
      "name": "bulbasaur",
      "url": "https://pokeapi.co/api/v2/pokemon/1/"
    },
    {
      "name": "ivysaur",
      "url": "https://pokeapi.co/api/v2/pokemon/2/"
    },
    ...........
  ]
}
*/