part of 'pokedex_bloc.dart';

@immutable
sealed class PokedexState {}

abstract class PokedexStateListener extends PokedexState {}

final class PokedexInitial extends PokedexState {}

final class PokedexLoading extends PokedexState {}

final class PokedexError extends PokedexState {}

final class PokedexSuccess extends PokedexState {
  final List<PokedexEntity> list;

  PokedexSuccess({required this.list});
}

final class PokedexErrorPaging extends PokedexStateListener {
  final List<PokedexEntity> list;

  PokedexErrorPaging({required this.list});
}

final class PokedexSuccessPaging extends PokedexStateListener {}
