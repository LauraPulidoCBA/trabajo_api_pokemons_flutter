import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: PokemonPage());
}


class PokemonPage extends StatefulWidget { 
  @override 
  _PokemonPageState createState() => _PokemonPageState(); 
}


class _PokemonPageState extends State<PokemonPage> {
  List pokemons = [
    {"name": "Pikachu"},
    {"name": "Charmander"},
    {"name": "Bulbasaur"},
  ];
  
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("Lista de Pokemons")),
    body: SingleChildScrollView(
      child: Column(
        children: List.generate(
          pokemons.length, 
          (index) => Text(pokemons[index]["name"])
          ),
        ),
    ),
  );
}