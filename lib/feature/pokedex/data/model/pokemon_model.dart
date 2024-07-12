import 'package:pokedex/feature/pokedex/domain/entity/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel({
    required super.id,
    required super.name,
    required super.avatarUrl,
    required super.weight,
    required super.types,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    // Extract the id
    final id = json['id'];

    // Extract the name
    final name = json['forms'][0]['name'];

    // Extract the avatar URL from sprites
    final avatarUrl = json['sprites']['front_default'];

    // Extract the weight
    final weight = (json['weight'] as num).toDouble();

    // Extract the types
    final types = (json['types'] as List)
        .map((typeInfo) => typeInfo['type']['name'] as String)
        .toList();

    return PokemonModel(
      id: id,
      name: name,
      avatarUrl: avatarUrl,
      weight: weight,
      types: types,
    );
  }
}