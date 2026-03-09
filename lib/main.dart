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
              (index) {
                int id = index + 1; 

                return Card(
                  margin: EdgeInsets.all(8),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Hero(
                          tag: "pokemon$id",
                          child: Image.network(
                            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png",
                            width: 120,
                            height: 120,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            pokemons[index]["name"].toUpperCase(),
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
}