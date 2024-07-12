import 'package:flutter/material.dart';

class PokemonPage extends StatefulWidget {
  final int pokemonId;
  const PokemonPage({super.key, required this.pokemonId});

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon"),
      ),
    );
  }
}
