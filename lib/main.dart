import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: PokemonPage());
}


class PokemonPage extends StatefulWidget { @override _PokemonPageState createState() => _PokemonPageState(); }
class _PokemonPageState extends State<PokemonPage> {
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text("Lista de Pokemons")));
}