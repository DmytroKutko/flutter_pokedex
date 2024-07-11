import 'package:get_it/get_it.dart';
import 'package:pokedex/feature/pokemons/data/remote/network_service.dart';
import 'package:pokedex/feature/pokemons/data/repository/pokedex_repository_impl.dart';
import 'package:pokedex/feature/pokemons/domain/repository/pokedex_repository.dart';
import 'package:pokedex/feature/pokemons/domain/usecases/get_pokedex_usecase.dart';
import 'package:pokedex/feature/pokemons/domain/usecases/get_pokemon_usecase.dart';
import 'package:pokedex/feature/pokemons/domain/usecases/pokedex_usecases.dart';
import 'package:pokedex/feature/pokemons/presentation/bloc/pokedex_bloc.dart';

import 'package:http/http.dart' as http;

final sl = GetIt.I;

void setupLocator() {
  // Network service
  sl.registerSingleton(NetworkService(client: http.Client()));

  // Pokedex repository
  sl.registerSingleton<PokedexRepository>(PokedexRepositoryImpl(
    networkService: sl(),
  ));

  // Pokedex usecases
  sl.registerSingleton<PokedexUsecases>(PokedexUsecases(
    getPokemonsUsecase: GetPokedexUsecase(repository: sl<PokedexRepository>()),
    getPokemonUsecase: GetPokemonUsecase(repository: sl<PokedexRepository>())
  ));

  // Pokedex bloc
  sl.registerSingleton<PokedexBloc>(PokedexBloc());
}
