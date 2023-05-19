import 'package:flutter/material.dart';
import 'package:pokedex_app/app/features/pokemon/models/pokemon_type.dart';
import 'package:pokedex_app/app/theme/palette.dart';

import '../../models/pokemon_model.dart';
import 'components/pokemon_info_component.dart';
import 'components/pokemon_stats_component.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PokemonModel pokemon = ModalRoute.of(context)!.settings.arguments as PokemonModel;
    final Color pokemonColor = PokemonType.getTypeColor(pokemon.types.first);

    return Scaffold(
      backgroundColor: pokemonColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          pokemon.name,
          style: const TextStyle(fontSize: 24),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Center(child: Text('#${pokemon.id}')),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width * .98,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                      height: 180,
                      width: 180,
                      color: Palette.primary,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.1,
                  child: Column(
                    children: [
                      Image.network(
                        pokemon.imgUrl,
                        fit: BoxFit.fill,
                        scale: 0.4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: pokemon.types
                            .map((e) => Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Chip(backgroundColor: pokemonColor, label: Text(e.name)),
                                ))
                            .toList(),
                      ),
                      PokemonInfoComponent(height: pokemon.height, weight: pokemon.weight, moves: pokemon.moves),
                      const SizedBox(
                        height: 24,
                      ),
                      PokemonStatsComponent(pokemon.stats, color: pokemonColor)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
