import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/ui/error_page.dart';
import 'package:pokedex/core/ui/loading_page.dart';
import 'package:pokedex/di/dependency_injection.dart';
import 'package:pokedex/feature/pokedex/domain/entity/pokedex_entity.dart';
import 'package:pokedex/feature/pokedex/presentation/bloc/pokedex_bloc.dart';
import 'package:pokedex/feature/pokedex/presentation/wigets/pokemon_tile.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({super.key});

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  final PokedexBloc bloc = sl<PokedexBloc>();
  final List<PokedexEntity> pokemons = [];
  final controller = ScrollController();

  @override
  void initState() {
    bloc.add(LoadPokedex());

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        bloc.add(PokedexLoadMoreItems(offset: pokemons.length));
      }
    });

    super.initState();
  }

  Future refresh() async {
    pokemons.clear();
    bloc.add(LoadPokedex());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
            {
              setState(() {
                pokemons.addAll(state.list);
              });
            }
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
                  backgroundColor: Colors.white,
                ),
                body: RefreshIndicator(
                  onRefresh: refresh,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: GridView.builder(
                      itemCount: pokemons.length,
                      controller: controller,
                      itemBuilder: (context, index) {
                        int id = index + 1;
                        return PokemonTile(id: id);
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12.0,
                        crossAxisSpacing: 12.0,
                      ),
                    ),
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
