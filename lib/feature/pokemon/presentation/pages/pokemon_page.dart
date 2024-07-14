import 'package:flutter/material.dart';
import 'package:pokedex/core/ui/pokemon_type.dart';
import 'package:pokedex/di/dependency_injection.dart';
import 'package:pokedex/utils/providers/pokemon_provider.dart';
import 'package:pokedex/utils/text_converter.dart';

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
        title: Text(capitalizeFirstLetter(provider.pokemon!.name)),
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (String type in provider.pokemon!.types)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: PokemonType(type: type),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
