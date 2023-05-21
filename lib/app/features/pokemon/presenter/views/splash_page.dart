import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_app/app/features/pokemon/presenter/views/components/loading_pokemon_icon.dart';

import 'package:pokedex_app/app/theme/main.dart';

import '../controllers/home_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final HomeController _homeController = GetIt.I.get();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _homeController.fetchPokemons();

    Future.delayed(const Duration(seconds: 4), () => Navigator.pushReplacementNamed(context, '/home'));

    return const Scaffold(
        backgroundColor: Palette.primary,
        body: PokemonLoadingIcon(
          color: Palette.white,
        ));
  }
}
