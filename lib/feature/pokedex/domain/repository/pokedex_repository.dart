import 'package:pokedex/feature/pokedex/domain/entity/pokedex_entity.dart';
import 'package:pokedex/feature/pokedex/domain/entity/pokemon_entity.dart';

abstract class PokedexRepository {
  Future<List<PokedexEntity>> getPokedex(int limit, int offset);
  Future<PokemonEntity> getPokemon(int id);
}
