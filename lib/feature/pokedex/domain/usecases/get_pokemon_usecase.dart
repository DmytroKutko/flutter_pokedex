import 'package:pokedex/feature/pokedex/domain/entity/pokemon_entity.dart';
import 'package:pokedex/feature/pokedex/domain/repository/pokedex_repository.dart';

class GetPokemonUsecase {
  final PokedexRepository repository;

  GetPokemonUsecase({required this.repository});

  Future<PokemonEntity> getPokemon(int id) async {
    return repository.getPokemon(id);
  }
}
