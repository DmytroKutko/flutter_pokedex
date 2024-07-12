part of 'pokedex_bloc.dart';

@immutable
sealed class PokedexEvent {}

class LoadPokedex extends PokedexEvent {
  final int length;
  final int offset;

  LoadPokedex({this.length = 20, this.offset = 20});
}

class PokedexLoadMoreItems extends PokedexEvent {
  final int length;
  final int offset;

  PokedexLoadMoreItems({this.length = 20, this.offset = 0});
}
