
class Pokemon {

  String? name;
  String? url;

  Pokemon(this.name, this.url);

  //Mapeamento do JSON(JAVASCRIPT OBJECT NOTATION) para o Objeto...
  Pokemon.fromJson(Map<String, dynamic> map) {
    this.name = map['name'];
    this.url = map['url'];
    //.... NAO.
  }

  // {
  // "name": "bulbasaur",
  // "url": "https://pokeapi.co/api/v2/pokemon/1/"
  // },
  // {
  // "name": "ivysaur",
  // "url": "https://pokeapi.co/api/v2/pokemon/2/"
  // }

  @override
  String toString() {
    return 'Pokemon{name: $name, url: $url}';
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
    }
  ]
}
*/

