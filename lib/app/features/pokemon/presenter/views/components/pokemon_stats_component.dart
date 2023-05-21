import 'package:flutter/material.dart';
import 'package:pokedex_app/app/features/pokemon/models/pokemon_stats_model.dart';
import 'package:pokedex_app/app/theme/main.dart';

class PokemonStatsComponent extends StatelessWidget {
  final List<PokemonStat> stats;
  final Color color;
  const PokemonStatsComponent(this.stats, {super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Base Stats',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: color),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: stats.map((stat) => CustomRow(stat: stat, color: color)).toList()),
            ],
          )
        ],
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  final PokemonStat stat;
  final Color color;

  const CustomRow({
    Key? key,
    required this.stat,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          stat.statShortName().toUpperCase(),
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: color),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            alignment: Alignment.center,
            width: 1,
            height: 20,
            color: Palette.light,
          ),
        ),
        Text(stat.value.toString().padLeft(3, '0')),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
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
        ),
      ],
    );
  }
}
