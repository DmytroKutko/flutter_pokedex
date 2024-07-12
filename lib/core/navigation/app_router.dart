import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/feature/pokedex/presentation/pages/pokedex_page.dart';
import 'package:pokedex/feature/pokemon/presentation/pages/pokemon_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: "home",
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const PokedexPage();
      },
    ),
    GoRoute(
      name: "pokemon",
      path: "/pokemon",
      builder: (BuildContext context, GoRouterState state) {
        final pokemonId = state.extra as int;
        return PokemonPage(pokemonId: pokemonId);
      },
    ),
  ],
);
