import 'package:pokedex/feature/pokemons/domain/entity/pokedex_entity.dart';

abstract class PokedexRepository {
  Future<List<PokedexEntity>> getPokedex(int limit, int offset);
}
