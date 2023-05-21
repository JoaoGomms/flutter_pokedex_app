import 'package:flutter/material.dart';
import 'package:pokedex_app/app/features/pokemon/models/pokemon_move_model.dart';
import 'package:pokedex_app/app/theme/icons/pokemon_app_icons.dart';
import 'package:pokedex_app/app/theme/palette.dart';
import 'package:pokedex_app/app/util/extensions.dart';

class PokemonInfoComponent extends StatelessWidget {
  final num height;
  final num weight;
  final List<PokemonMove> moves;
  final Color color;
  const PokemonInfoComponent(
      {super.key, required this.height, required this.weight, required this.moves, required this.color});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'About',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: color),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Item(
                    value: Text(
                      '${weight.toString()} kg',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    label: 'Weight',
                    icon: PokemonAppIcons.weight),
                _separatorBuilder(),
                Item(
                  value: Text(
                    '${height.toString()} m',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  label: 'Height',
                  icon: PokemonAppIcons.rule,
                ),
                _separatorBuilder(),
                Item(
                  value: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: moves
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                e.name.capitalize(),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ))
                        .toList()
                        .sublist(0, 2),
                  ),
                  label: 'Moves',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _separatorBuilder() => Container(
        color: Palette.light,
        height: 60,
        width: 1,
      );
}

class Item extends StatelessWidget {
  final String label;
  final Widget value;
  final IconData? icon;
  const Item({super.key, required this.label, required this.value, this.icon});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 60),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                icon != null
                    ? Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          icon,
                          size: 14,
                        ),
                      )
                    : Container(),
                value
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.displayMedium,
            )
          ],
        ),
      ),
    );
  }
}
