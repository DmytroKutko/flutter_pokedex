import 'package:flutter/material.dart';
import 'package:pokedex/core/navigation/app_router.dart';
import 'package:pokedex/di/dependency_injection.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
