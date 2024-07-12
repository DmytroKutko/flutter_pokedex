import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/di/dependency_injection.dart';
import 'package:pokedex/feature/pokedex/domain/entity/pokedex_entity.dart';
import 'package:pokedex/feature/pokedex/domain/usecases/pokedex_usecases.dart';

part 'pokedex_event.dart';
part 'pokedex_state.dart';

class PokedexBloc extends Bloc<PokedexEvent, PokedexState> {
  final PokedexUsecases usecases = sl<PokedexUsecases>();

  PokedexBloc() : super(PokedexInitial()) {
    on<LoadPokedex>(loadPokedex);
    on<PokedexLoadMoreItems>(pokedexLoadMoreItems);
  }

  FutureOr<void> loadPokedex(
      LoadPokedex event, Emitter<PokedexState> emit) async {
    emit(PokedexLoading());

    final pokemons = await usecases.getPokemonsUsecase.getPokedex(20, 0);

    emit(PokedexSuccess(list: pokemons));
  }

  FutureOr<void> pokedexLoadMoreItems(
      PokedexLoadMoreItems event, Emitter<PokedexState> emit) async {
    final pokemons = await usecases.getPokemonsUsecase
        .getPokedex(event.length, event.offset);
    emit(PokedexSuccessPaging(list: pokemons));
  }
}