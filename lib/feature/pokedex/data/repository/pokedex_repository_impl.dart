import 'package:pokedex/feature/pokedex/data/model/pokedex_model.dart';
import 'package:pokedex/feature/pokedex/data/model/pokemon_model.dart';
import 'package:pokedex/feature/pokedex/data/remote/network_service.dart';
import 'package:pokedex/feature/pokedex/domain/entity/pokedex_entity.dart';
import 'package:pokedex/feature/pokedex/domain/entity/pokemon_entity.dart';
import 'package:pokedex/feature/pokedex/domain/repository/pokedex_repository.dart';

class PokedexRepositoryImpl extends PokedexRepository {
  final NetworkService networkService;

  PokedexRepositoryImpl({required this.networkService});

  @override
  Future<List<PokedexEntity>> getPokedex(int limit, int offset) async {
    try {
      final Map<String, dynamic> responseData =
          await networkService.getPokedex(limit, offset);

      final List<dynamic> results = responseData['results'] ?? [];
      List<PokedexEntity> pokedexEntities =
          results.map((json) => PokedexModel.fromJson(json)).toList();
      return pokedexEntities;
    } catch (e) {
      throw Exception('Failed to fetch Pokémon: $e');
    }
  }

  @override
  Future<PokemonEntity> getPokemon(int id) async {
    try {
      final Map<String, dynamic> responseData =
          await networkService.getPokemon(id);

      PokemonModel pokemon = PokemonModel.fromJson(responseData);

      return pokemon;
    } catch (e) {
      throw Exception('Failed to fetch Pokémon: $e');
    }
  }
}
