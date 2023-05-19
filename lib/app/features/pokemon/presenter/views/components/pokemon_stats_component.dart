import 'package:flutter/material.dart';
import 'package:pokedex_app/app/features/pokemon/models/pokemon_stats_model.dart';

class PokemonStatsComponent extends StatelessWidget {
  final List<PokemonStat> stats;
  final Color color;
  const PokemonStatsComponent(this.stats, {super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: [
          const Text('Base Stats'),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ...stats
                      .map((stat) => Text(
                            PokemonStat.statShortName(stat.name).toUpperCase(),
                            style: const TextStyle(fontSize: 16),
                          ))
                      .toList(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  height: 100,
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              Column(
                children: stats
                    .map((stat) => Text(stat.value.toString().padLeft(3, '0'), style: const TextStyle(fontSize: 16)))
                    .toList(),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...stats
                      .map((stat) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.63,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: LinearProgressIndicator(
                                  minHeight: 5,
                                  value: stat.value.toDouble() / 100,
                                  backgroundColor: color.withOpacity(0.4),
                                  valueColor: AlwaysStoppedAnimation<Color>(color),
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
