import 'package:flutter/material.dart';
import 'pokemon_service.dart';
import 'pages/detalle_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PokemonPage(),
    );

  }

}

class PokemonPage extends StatefulWidget {

  @override
  _PokemonPageState createState() => _PokemonPageState();

}

class _PokemonPageState extends State<PokemonPage>{

  PokemonService service = PokemonService();
  List pokemons = [];

  @override
  void initState() {
    super.initState();
    cargar();
  }

  Future<void> cargar() async {
    pokemons = await service.getPokemons();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Lista de Pokemons"),
      ),

      body: SingleChildScrollView(

        child: Column(

          children: List.generate(pokemons.length, (index){

            int id = index + 1;

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetallePage(
                      nombre: pokemons[index]["name"],
                      id: id,
                    ),
                  ),
                );
              },
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
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
                      Icon(Icons.arrow_forward_ios, size: 18),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}