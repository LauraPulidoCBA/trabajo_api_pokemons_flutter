import 'dart:convert';
import 'package:http/http.dart' as http;
class PokemonService {

  Future<List> getPokemons() async {

  var url = Uri.parse("https://pokeapi.co/api/v2/pokemon?limit=20");

  var response = await http.get(url);
  if(response.statusCode == 200){
  var data = json.decode(response.body);
  return data["results"];

}else{

   return []; 
}
 }
 Future<Map<String, dynamic>>
  getPokemonDetail(int id) async {
  var url = Uri.parse("https://pokeapi.co/api/v2/pokemon/$id");
  var response = await http.get(url);

  
  return json.decode(response.body);
}
