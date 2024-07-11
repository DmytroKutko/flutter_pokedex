import 'package:pokedex/feature/pokemons/domain/entity/pokedex_entity.dart';

class PokedexModel extends PokedexEntity {
  PokedexModel({
    required super.name,
    required super.url,
  });

  factory PokedexModel.fromJson(Map<String, dynamic> json) {
    // Extract the name
    final name = json['name'];

    // Extract the url
    final url = json['url'];

    return PokedexModel(
      name: name,
      url: url,
    );
  }
}
