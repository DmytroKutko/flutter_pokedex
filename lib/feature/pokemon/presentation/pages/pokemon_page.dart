import 'package:flutter/material.dart';
import 'package:pokedex/di/dependency_injection.dart';
import 'package:pokedex/utils/providers/pokemon_provider.dart';

class PokemonPage extends StatefulWidget {
  final int pokemonId;
  const PokemonPage({super.key, required this.pokemonId});

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  final PokemonProvider provider = sl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon"),
      ),
      body: Hero(
        tag: widget.pokemonId,
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                provider.pokemon!.avatarUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.fitHeight,
              )
            ],
          ),
        ),
      ),
    );
  }
}
