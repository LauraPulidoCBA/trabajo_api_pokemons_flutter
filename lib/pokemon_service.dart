import 'dart:convert';
import 'package:http/http.dart' as http;
class PokemonService {

  Future<List> getPokemons() async {

  var url = Uri.parse("https://pokeapi.co/api/v2/pokemon?limit=20");

  var response = await http.get(url);
  
  return []; 
}
 }