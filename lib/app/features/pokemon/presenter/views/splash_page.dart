import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_app/app/theme/icons/pokemon_app_icons.dart';
import 'package:pokedex_app/app/theme/palette.dart';

import '../controllers/home_controller.dart';

class SplashPage extends StatefulWidget {
  SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  final HomeController _homeController = GetIt.I.get();
  late AnimationController animationController;
  late Animation<double> loadingAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 4))..forward();
    loadingAnimation = Tween<double>(begin: 0.0, end: 2.0).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    _homeController.fetchPokemons();

    Future.delayed(const Duration(seconds: 4), () => Navigator.pushReplacementNamed(context, '/home'));

    return Scaffold(
      backgroundColor: Palette.primary,
      body: Center(
        child: RotationTransition(
          turns: loadingAnimation,
          child: const Icon(
            PokemonAppIcons.pokeball,
            color: Palette.white,
            size: 96,
          ),
        ),
      ),
    );
  }
}
