import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_app/app/features/pokemon/models/pokemon_type.dart';
import 'package:pokedex_app/app/theme/palette.dart';
import 'package:pokedex_app/app/util/extensions.dart';

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
        backgroundColor: Colors.transparent,
        title: Text(
          pokemon.name.capitalize(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Center(
                child: Text(
                  '#${pokemon.id.toString().padLeft(3, '0')}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Palette.white),
                ),
              ))
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
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
                        color: Palette.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width * .98,
                    ),
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 12,
                  child: Image.asset(
                    'assets/Pokeball.png',
                    color: Palette.white.withOpacity(0.1),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.2,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 200, maxWidth: 200, minHeight: 200, minWidth: 200),
                        child: SvgPicture.network(
                          placeholderBuilder: (context) => Image.network(
                            pokemon.imgUrl,
                          ),
                          alignment: Alignment.center,
                          'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/${pokemon.id}.svg',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: pokemon.types
                            .map((e) => Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Chip(
                                    labelPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                                    backgroundColor: PokemonType.getTypeColor(e),
                                    label: Text(
                                      e.name.capitalize(),
                                      style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Palette.white),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                      PokemonInfoComponent(
                          height: pokemon.height, weight: pokemon.weight, moves: pokemon.moves, color: pokemonColor),
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
