import 'package:flutter/material.dart';
import 'package:poke_api/views/PokemonList.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListPokemons(),
    );
  }
}
