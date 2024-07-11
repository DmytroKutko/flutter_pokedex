import 'package:flutter/material.dart';
import 'package:pokedex/di/dependency_injection.dart';
import 'package:pokedex/feature/pokemons/presentation/pages/pokedex_page.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PokdexPage(),
    );
  }
}
