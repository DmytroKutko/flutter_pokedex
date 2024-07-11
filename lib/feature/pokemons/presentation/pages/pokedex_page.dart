import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/ui/error_page.dart';
import 'package:pokedex/core/ui/loading_page.dart';
import 'package:pokedex/di/dependency_injection.dart';
import 'package:pokedex/feature/pokemons/domain/entity/pokedex_entity.dart';
import 'package:pokedex/feature/pokemons/presentation/bloc/pokedex_bloc.dart';

class PokdexPage extends StatefulWidget {
  const PokdexPage({super.key});

  @override
  State<PokdexPage> createState() => _PokdexPageState();
}

class _PokdexPageState extends State<PokdexPage> {
  final PokedexBloc bloc = sl<PokedexBloc>();
  final List<PokedexEntity> pokemons = [];

  @override
  void initState() {
    bloc.add(LoadPokedex());
    super.initState();
  }

  Future refresh() async {
    pokemons.clear();
    bloc.add(LoadPokedex());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PokedexBloc, PokedexState>(
      bloc: bloc,
      listenWhen: (previous, current) => current is PokedexStateListener,
      buildWhen: (previous, current) => current is! PokedexStateListener,
      listener: (context, state) {
        switch (state) {
          case PokedexSuccessPaging():
            {}
          case PokedexErrorPaging():
            {}
          default:
            break;
        }
      },
      builder: (context, state) {
        switch (state) {
          case PokedexLoading():
            {
              return const LoadingPage();
            }
          case PokedexSuccess():
            {
              pokemons.addAll(state.list);
              return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text("Pokedex"),
                ),
                body: RefreshIndicator(
                  onRefresh: refresh,
                  child: ListView.builder(
                    itemCount: pokemons.length,
                    itemBuilder: (context, index) {
                      return Text(pokemons[index].name);
                    },
                  ),
                ),
              );
            }
          case PokedexError():
            {
              return const ErrorPage();
            }
          default:
            return const SizedBox();
        }
      },
    );
  }
}
