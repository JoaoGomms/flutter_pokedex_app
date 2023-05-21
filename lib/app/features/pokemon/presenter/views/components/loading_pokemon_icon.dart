import 'package:flutter/material.dart';
import 'package:pokedex_app/app/theme/main.dart';

class PokemonLoadingIcon extends StatefulWidget {
  final Color color;
  const PokemonLoadingIcon({super.key, required this.color});

  @override
  State<PokemonLoadingIcon> createState() => _PokemonLoadingIconState();
}

class _PokemonLoadingIconState extends State<PokemonLoadingIcon> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> loadingAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 5))..forward();
    animationController.addListener(() {
      if (animationController.isCompleted) {
        animationController.reverse();
      }
    });
    loadingAnimation = Tween<double>(begin: 0.0, end: 2.0).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: loadingAnimation,
        child: Icon(
          PokemonAppIcons.pokeball,
          color: widget.color,
          size: 96,
        ),
      ),
    );
  }
}
