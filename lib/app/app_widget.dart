import 'package:flutter/material.dart';
import 'package:pokedex_app/app/features/pokemon/presenter/views/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/': (context) => const HomePage()},
      initialRoute: '/',
    );
  }
}
