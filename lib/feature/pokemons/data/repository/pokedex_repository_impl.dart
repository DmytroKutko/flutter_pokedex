import 'package:pokedex/feature/pokemons/data/model/pokedex_model.dart';
import 'package:pokedex/feature/pokemons/data/remote/network_service.dart';
import 'package:pokedex/feature/pokemons/domain/entity/pokedex_entity.dart';
import 'package:pokedex/feature/pokemons/domain/repository/pokedex_repository.dart';

class PokedexRepositoryImpl extends PokedexRepository {
  final NetworkService networkService;

  PokedexRepositoryImpl({required this.networkService});

  @override
  Future<List<PokedexEntity>> getPokedex(int limit, int offset) async {
    try {
      final Map<String, dynamic> responseData =
          await networkService.getPokedex(limit, offset);
      // Extract Pokemon entities from the response data
      final List<dynamic> results = responseData['results'] ?? [];
      List<PokedexEntity> pokedexEntities =
          results.map((json) => PokedexModel.fromJson(json)).toList();
      return pokedexEntities;
    } catch (e) {
      throw Exception('Failed to fetch Pokémon: $e');
    }
  }
}
