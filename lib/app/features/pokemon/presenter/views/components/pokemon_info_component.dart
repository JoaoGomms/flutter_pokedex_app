import 'package:flutter/material.dart';
import 'package:pokedex_app/app/features/pokemon/models/pokemon_move_model.dart';

class PokemonInfoComponent extends StatelessWidget {
  final num height;
  final num weight;
  final List<PokemonMove> moves;
  const PokemonInfoComponent({super.key, required this.height, required this.weight, required this.moves});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text('About'),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Item(
              value: '${weight.toString()} kg',
              label: 'Weight',
              icon: const Icon(Icons.person),
            ),
            _separatorBuilder(),
            Item(
              value: '${weight.toString()} kg',
              label: 'Height',
              icon: const Icon(Icons.person),
            ),
            _separatorBuilder(),
            Item(
              value: '${weight.toString()} kg',
              label: 'Moves',
              icon: const Icon(Icons.person),
            )
          ],
        ),
      ],
    );
  }

  Widget _separatorBuilder() => Container(
        color: Colors.black26,
        height: 45,
        width: 1,
      );
}

class Item extends StatelessWidget {
  final String label;
  final String value;
  final Widget icon;
  const Item({super.key, required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: icon,
              ),
              Text(value)
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(label)
        ],
      ),
    );
  }
}
