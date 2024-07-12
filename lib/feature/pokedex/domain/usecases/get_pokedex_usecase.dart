import 'package:pokedex/feature/pokedex/domain/entity/pokedex_entity.dart';

import 'package:pokedex/feature/pokedex/domain/repository/pokedex_repository.dart';

class GetPokedexUsecase {
  final PokedexRepository repository;

  GetPokedexUsecase({required this.repository});

  Future<List<PokedexEntity>> getPokedex(int limit, int offset) async {
    return await repository.getPokedex(limit, offset);
  }
}
