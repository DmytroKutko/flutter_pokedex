import 'package:pokedex/feature/pokemons/domain/usecases/get_pokedex_usecase.dart';
import 'package:pokedex/feature/pokemons/domain/usecases/get_pokemon_usecase.dart';

class PokedexUsecases {
  final GetPokedexUsecase getPokemonsUsecase;
  final GetPokemonUsecase getPokemonUsecase;

  PokedexUsecases({required this.getPokemonsUsecase, required this.getPokemonUsecase});
}