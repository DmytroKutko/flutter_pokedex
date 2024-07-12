class PokemonEntity {
  final int id;
  final String name;
  final String avatarUrl;
  final double weight;
  final List<String> types;

  PokemonEntity({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.weight,
    required this.types,
  });
}
