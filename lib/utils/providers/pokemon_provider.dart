import 'package:pokedex/feature/pokedex/domain/entity/pokemon_entity.dart';

class PokemonProvider {
  PokemonEntity? _pokemon;
  PokemonEntity? get pokemon => _pokemon;

  setPokemon(PokemonEntity data) {
    _pokemon = data;
  }
}
