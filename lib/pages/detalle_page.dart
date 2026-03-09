
 import 'package:flutter/material.dart';
import '../pokemon_service.dart';

class DetallePage extends StatefulWidget {
  final String nombre;
  final int id;

  DetallePage({required this.nombre, required this.id});

  @override
  _DetallePageState createState() => _DetallePageState();
}

class _DetallePageState extends State<DetallePage> {
  Map<String, dynamic> detalle = {};

  @override
  void initState() {
    super.initState();
    cargarDetalle();
  }

  Future<void> cargarDetalle() async {
    PokemonService service = PokemonService();
    detalle = await service.getPokemonDetail(widget.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.nombre)),
      body: detalle.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center, 
                  children: [
                    Hero(
                      tag: "pokemon${widget.id}",
                      child: Image.network(
                        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${widget.id}.png",
                        width: 250,
                        height: 250,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      widget.nombre.toUpperCase(),
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center, // 🔹 centrado del texto
                    ),
                    SizedBox(height: 20),

                    Text("Altura: ${detalle["height"]}", textAlign: TextAlign.center),
                    Text("Peso: ${detalle["weight"]}", textAlign: TextAlign.center),

                    SizedBox(height: 10),
                    Text("Tipos:",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center, // 🔹 centrado
                      children: (detalle["types"] as List)
                          .map((tipo) => Text(tipo["type"]["name"], textAlign: TextAlign.center))
                          .toList(),
                    ),

                    SizedBox(height: 10),
                    Text("Habilidades:",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center, 
                      children: (detalle["abilities"] as List)
                          .map((hab) => Text(hab["ability"]["name"], textAlign: TextAlign.center))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
} 
