import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:poke_api/models/pokemon.dart';

class PokemonController {
  final String url = 'https://pokeapi.co/api/v2/pokemon';
  final int limit = 20;

  getPokemons(int offset) async {
    List<Pokemon> pokemons = [];
    Uri uri = Uri.parse("$url?offset=$offset&limit=$limit");
    http.Response response = await http.get(uri);
    if (response.statusCode != 200) {
      throw Exception('Error al cargar los pokemons');
    }
    Map<String, dynamic> json = jsonDecode(response.body);
    List results = json["results"] as List;
    for(var item in results){
      pokemons.add(Pokemon(name: item["name"], url: item["url"]));
    }
    return pokemons;
  }
}
