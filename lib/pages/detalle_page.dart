import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nombre),
      ),

      
      body: detalle.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
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
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 20),

                Text(
                  "Altura: ${detalle["height"]}",
                  textAlign: TextAlign.center,
                ),

                Text(
                  "Peso: ${detalle["weight"]}",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
    );
  }
}

