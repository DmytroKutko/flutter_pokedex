import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/ui/error_page.dart';
import 'package:pokedex/core/ui/loading_page.dart';
import 'package:pokedex/core/ui/paging_loading_indicator.dart';
import 'package:pokedex/di/dependency_injection.dart';
import 'package:pokedex/feature/pokemons/domain/entity/pokedex_entity.dart';
import 'package:pokedex/feature/pokemons/presentation/bloc/pokedex_bloc.dart';
import 'package:pokedex/feature/pokemons/presentation/wigets/pokemon_tile.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class PokdexPage extends StatefulWidget {
  const PokdexPage({super.key});

  @override
  State<PokdexPage> createState() => _PokdexPageState();
}

class _PokdexPageState extends State<PokdexPage> {
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
                    child: StaggeredGridView.countBuilder(
                      controller: controller,
                      crossAxisCount: 2, // Number of columns
                      itemCount:
                          pokemons.length + 1, // Additional item for the loader
                      itemBuilder: (context, index) {
                        if (index < pokemons.length) {
                          return PokemonTile(index: index);
                        } else {
                          return const Padding(
                            padding: EdgeInsets.all(12),
                            child: PagingLoadingIndicator(),
                          );
                        }
                      },
                      staggeredTileBuilder: (index) {
                        if (index < pokemons.length) {
                          return const StaggeredTile.fit(1);
                        } else {
                          return const StaggeredTile.fit(2);
                        }
                      },
                      mainAxisSpacing: 8.0, // Vertical spacing between items
                      crossAxisSpacing: 8.0, // Horizontal spacing between items
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
