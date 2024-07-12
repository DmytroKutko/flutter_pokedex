import 'package:flutter/material.dart';
import 'package:pokedex/core/ui/pokemon_type.dart';
import 'package:pokedex/di/dependency_injection.dart';
import 'package:pokedex/feature/pokedex/domain/entity/pokemon_entity.dart';
import 'package:pokedex/feature/pokedex/domain/usecases/get_pokemon_usecase.dart';
import 'package:pokedex/feature/pokedex/domain/usecases/pokedex_usecases.dart';
import 'package:pokedex/utils/text_converter.dart';

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
            width: double.infinity,
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context)
                    .colorScheme
                    .primaryContainer,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    capitalizeFirstLetter(pokemon!.name),
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (String type in pokemon!.types)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: PokemonType(type: type),
                        ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Image.network(
              pokemon!.avatarUrl,
              height: 100,
              width: 100,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      );
    } else {
      return const Center(child: Text('Failed to load Pokémon data.'));
    }
  }
}
