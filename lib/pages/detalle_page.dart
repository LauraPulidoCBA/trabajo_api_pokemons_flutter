Dart
import 'package:flutter/material.dart';
class DetallePage extends StatefulWidget {
  final String nombre; final int id;
  DetallePage({required this.nombre, required this.id});
  @override _DetallePageState createState() => _DetallePageState();
}
Dart
onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetallePage(nombre: name, id: id)))


Dart
body: Column(children: [ Text(widget.nombre.toUpperCase()) ])

Dart
Image.network("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${widget.id}.png")

Dart
Text("Altura: ${detalle["height"]}"), Text("Peso: ${detalle["weight"]}")