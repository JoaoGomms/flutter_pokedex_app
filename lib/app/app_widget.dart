import 'package:flutter/material.dart';
import 'package:pokedex_app/app/features/pokemon/presenter/views/home_page.dart';

import 'features/pokemon/presenter/views/pokemon_detail_page.dart';
import 'features/pokemon/presenter/views/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => SplashPage(),
        '/home': (context) => const HomePage(),
        '/details': (context) => const PokemonDetailPage(),
      },
      initialRoute: '/',
    );
  }
}
