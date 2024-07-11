import 'package:flutter/material.dart';
import 'package:pokedex/di/dependency_injection.dart';
import 'package:pokedex/feature/pokemons/domain/entity/pokemon_entity.dart';
import 'package:pokedex/feature/pokemons/domain/usecases/get_pokemon_usecase.dart';
import 'package:pokedex/feature/pokemons/domain/usecases/pokedex_usecases.dart';

class PokemonTile extends StatefulWidget {
  final int index;

  const PokemonTile({super.key, required this.index});

  @override
  State<PokemonTile> createState() => _PokemonTileState();
}

class _PokemonTileState extends State<PokemonTile> {
  final GetPokemonUsecase pokemonUsecase =
      sl<PokedexUsecases>().getPokemonUsecase;

  PokemonEntity? pokemon;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      var data = await pokemonUsecase.getPokemon(widget.index + 1);
      if (mounted) {
        setState(() {
          pokemon = data;
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (pokemon != null) {
      return Stack(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey, // Border color
                  width: 2, // Border width
                ),
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("name: ${pokemon!.name}"),
                  Text("types: ${pokemon!.types.join(', ')}"),
                  Text("weight: ${pokemon!.weight}"),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            width: 180,
            child: Image.network(
              pokemon!.avatarUrl,
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
          ),
        ],
      );
    } else {
      return const Center(child: Text('Failed to load Pokémon data.'));
    }
  }
}
