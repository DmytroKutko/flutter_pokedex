part of 'pokedex_bloc.dart';

@immutable
sealed class PokedexEvent {}

class LoadPokedex extends PokedexEvent {
  final int length;
  final int offset;

  LoadPokedex({this.length = 20, this.offset = 0});
}
